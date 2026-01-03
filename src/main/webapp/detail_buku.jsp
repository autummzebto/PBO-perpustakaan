<%-- 
    Document   : detail_buku
    Created on : 11 Dec 2025, 15.03.59
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Cek Login
    if (session.getAttribute("status") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idBuku = request.getParameter("id");
    // Validasi ID
    if(idBuku == null || idBuku.isEmpty()) {
        response.sendRedirect("halaman_anggota.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Detail Buku</title>
    <link rel="icon" type="image/jpg" href="images/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .cover-img {
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            width: 100%;
            max-height: 500px;
            object-fit: cover;
        }
        .review-box {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
        }
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body class="bg-light">
    
    <jsp:include page="navbar.jsp" />

    <%
        Connection con = Koneksi.getConnection();
        
        // 1. AMBIL DETAIL BUKU
        String sql = "SELECT * FROM buku WHERE id_buku = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(idBuku));
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            // Cek gambar
            String img = (rs.getString("gambar") == null || rs.getString("gambar").isEmpty()) ? "no-image.jpg" : rs.getString("gambar");
    %>

    <div class="container mt-5 mb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="halaman_anggota.jsp">Koleksi</a></li>
                <li class="breadcrumb-item active" aria-current="page"><%= rs.getString("judul_buku") %></li>
            </ol>
        </nav>

        <div class="row g-5">
            <div class="col-md-4">
                <img src="images/buku/<%= img %>" class="cover-img" alt="Cover">
            </div>

            <div class="col-md-8">
                <h1 class="fw-bold mb-3"><%= rs.getString("judul_buku") %></h1>
                <h5 class="text-muted mb-4"><i class="bi bi-pen"></i> <%= rs.getString("pengarang") %></h5>
                
                <table class="table table-borderless w-75">
                    <tr>
                        <td width="30%"><strong>Penerbit</strong></td>
                        <td>: <%= rs.getString("penerbit") %></td>
                    </tr>
                    <tr>
                        <td><strong>Tahun Terbit</strong></td>
                        <td>: <%= rs.getString("tahun_terbit") %></td>
                    </tr>
                    <tr>
                        <td><strong>Stok Tersedia</strong></td>
                        <td>: 
                            <% if(rs.getInt("stok") > 0) { %>
                                <span class="badge bg-success"><%= rs.getInt("stok") %> Eks</span>
                            <% } else { %>
                                <span class="badge bg-danger">Habis</span>
                            <% } %>
                        </td>
                    </tr>
                </table>

                <div class="mt-4">
                    <% if(rs.getInt("stok") > 0) { %>
                        <a href="proses_pinjam.jsp?id_buku=<%= idBuku %>" 
                           class="btn btn-primary btn-lg px-5 shadow-sm"
                           onclick="return confirm('Pinjam buku ini?')">
                            <i class="bi bi-bag-plus"></i> Pinjam Sekarang
                        </a>
                    <% } else { %>
                        <button class="btn btn-secondary btn-lg px-5" disabled>Stok Habis</button>
                    <% } %>
                </div>

                <hr class="my-5">

                <h4 class="fw-bold mb-4"><i class="bi bi-chat-quote-fill text-warning"></i> Ulasan Pembaca</h4>

                <div class="review-box mb-4">
                    <form action="proses_komentar.jsp" method="post">
                        <input type="hidden" name="id_buku" value="<%= idBuku %>">
                        <h6 class="fw-bold">Tulis pengalaman membacamu:</h6>
                        
                        <div class="mb-2">
                            <label class="small text-muted">Rating:</label>
                            <select name="rating" class="form-select form-select-sm w-auto d-inline-block border-warning">
                                <option value="5">⭐⭐⭐⭐⭐ (Sangat Bagus)</option>
                                <option value="4">⭐⭐⭐⭐ (Bagus)</option>
                                <option value="3">⭐⭐⭐ (Cukup)</option>
                                <option value="2">⭐⭐ (Kurang)</option>
                                <option value="1">⭐ (Buruk)</option>
                            </select>
                        </div>
                        
                        <textarea name="komentar" class="form-control mb-2" rows="2" placeholder="Apa yang menarik dari buku ini?" required></textarea>
                        <button type="submit" class="btn btn-sm btn-dark">Kirim Ulasan</button>
                    </form>
                </div>

                <div class="vstack gap-3">
                    <%
                        // Query Gabungan (JOIN) ambil ulasan + nama anggota
                        String sqlUlasan = "SELECT u.*, a.nama_lengkap FROM ulasan u JOIN anggota a ON u.id_anggota = a.id_anggota WHERE u.id_buku = ? ORDER BY u.id_ulasan DESC";
                        PreparedStatement psUlasan = con.prepareStatement(sqlUlasan);
                        psUlasan.setInt(1, Integer.parseInt(idBuku));
                        ResultSet rsUlasan = psUlasan.executeQuery();
                        
                        boolean adaUlasan = false;
                        while(rsUlasan.next()) {
                            adaUlasan = true;
                            int rating = rsUlasan.getInt("rating");
                            String bintang = "";
                            for(int i=0; i<rating; i++) bintang += "⭐";
                    %>
                        <div class="d-flex gap-3 border-bottom pb-3">
                            <div class="user-avatar">
                                <%= rsUlasan.getString("nama_lengkap").substring(0, 1) %>
                            </div>
                            <div>
                                <h6 class="fw-bold mb-0">
                                    <%= rsUlasan.getString("nama_lengkap") %> 
                                    <small class="text-warning small ms-2"><%= bintang %></small>
                                </h6>
                                <small class="text-muted" style="font-size: 12px;"><%= rsUlasan.getDate("tanggal_ulasan") %></small>
                                <p class="mt-1 mb-0"><%= rsUlasan.getString("isi_komentar") %></p>
                            </div>
                        </div>
                    <% 
                        } 
                        if(!adaUlasan) { out.println("<p class='text-muted fst-italic'>Belum ada ulasan. Jadilah yang pertama!</p>"); }
                    %>
                </div>

            </div>
        </div>
    </div>

    <% 
        } else {
            out.println("<div class='container mt-5 text-center'><h3>Buku tidak ditemukan</h3><a href='halaman_anggota.jsp'>Kembali</a></div>");
        }
        
        // Tutup koneksi
        try { if(rs!=null) rs.close(); if(ps!=null) ps.close(); if(con!=null) con.close(); } catch(Exception e){}
    %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
