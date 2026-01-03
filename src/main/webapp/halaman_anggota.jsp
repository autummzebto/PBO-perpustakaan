<%@page import="java.util.List, com.autum.javaweb.perpustakaan.dao.BukuDAO, com.mycompany.javaweb.model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // 1. CEK KEAMANAN (Sama seperti sebelumnya)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("status") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Pustaka Digital - Katalog</title>
    <link rel="icon" type="image/jpg" href="images/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <style>
        /* Efek Kartu Melayang saat di-hover */
        .book-card {
            transition: all 0.3s ease;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            background: #fff;
            overflow: hidden;
            height: 100%;
        }
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        /* Mengatur Ukuran Gambar Agar Seragam */
        .book-cover {
            height: 300px; /* Tinggi gambar tetap */
            object-fit: cover; /* Gambar menyesuaikan tanpa gepeng */
            border-bottom: 1px solid #f0f0f0;
        }
        /* Badge Stok di Pojok Kanan Atas Gambar */
        .stok-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 0.8rem;
            padding: 5px 10px;
            border-radius: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body class="bg-light">

    <jsp:include page="navbar.jsp" />

    <div class="container mt-4 mb-5">
        
        <div class="row align-items-center mb-4">
            <div class="col-md-6">
                <h2 class="fw-bold text-primary mb-1">📚 Koleksi Buku</h2>
                <p class="text-muted mb-0">Halo, <strong><%= session.getAttribute("user") %></strong>! Mau baca apa hari ini?</p>
            </div>
            <div class="col-md-6">
                <form action="halaman_anggota.jsp" method="get" class="d-flex gap-2 justify-content-md-end mt-3 mt-md-0">
                    <div class="input-group" style="max-width: 350px;">
                        <input type="text" name="cari" class="form-control" placeholder="Cari judul atau pengarang...">
                        <button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button>
                         <% if(request.getParameter("cari") != null) { %>
                            <a href="halaman_anggota.jsp" class="btn btn-secondary">Reset</a>
                        <% } %>
                    </div>
                </form>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
            <%
                BukuDAO dao = new BukuDAO();
                String keyword = request.getParameter("cari");
                List<Buku> daftarBuku;
                
                // Logika Pencarian
                if (keyword != null && !keyword.trim().isEmpty()) {
                    daftarBuku = dao.cariBuku(keyword);
                } else {
                    daftarBuku = dao.getAllBuku();
                }

                if (daftarBuku != null && !daftarBuku.isEmpty()) {
                    for (Buku b : daftarBuku) {
                        // Logika Gambar: Jika null, pakai default 'no-image.jpg'
                        String imgName = (b.getGambar() == null || b.getGambar().isEmpty()) ? "no-image.jpg" : b.getGambar();
            %>
            <div class="col">
                <div class="book-card card h-100">
                    <% if(b.getStok() > 0) { %>
                        <span class="badge bg-success stok-badge">Stok: <%= b.getStok() %></span>
                    <% } else { %>
                        <span class="badge bg-danger stok-badge">Habis</span>
                    <% } %>

                    <img src="images/buku/<%= imgName %>" class="book-cover card-img-top" alt="<%= b.getJudulBuku() %>">

                    <div class="card-body d-flex flex-column p-3">
                        <h5 class="card-title fw-bold text-dark mb-1 text-truncate" title="<%= b.getJudulBuku() %>">
                            <%= b.getJudulBuku() %>
                        </h5>
                        <p class="text-muted small mb-2"><%= b.getPengarang() %></p>
                        
                        <div class="mt-auto pt-3">
                            <div class="d-grid gap-2">
                                <a href="detail_buku.jsp?id=<%= b.getIdBuku() %>" class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-eye"></i> Detail & Review
                                </a>
                                
                                <% if(b.getStok() > 0) { %>
                                    <a href="proses_pinjam.jsp?id_buku=<%= b.getIdBuku() %>" 
                                       class="btn btn-success btn-sm fw-bold"
                                       onclick="return confirm('Yakin ingin meminjam buku ini?')">
                                        <i class="bi bi-bag-plus"></i> Pinjam
                                    </a>
                                <% } else { %>
                                    <button class="btn btn-secondary btn-sm" disabled>Stok Habis</button>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                    } 
                } else {
            %>
                <div class="col-12 text-center py-5">
                    <h3 class="text-muted">😢 Yah, buku tidak ditemukan...</h3>
                    <a href="halaman_anggota.jsp" class="btn btn-outline-primary mt-3">Lihat Semua Koleksi</a>
                </div>
            <% } %>
        </div> </div> <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>