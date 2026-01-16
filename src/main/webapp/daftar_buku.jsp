<%-- 
    Document   : daftar_buku
    Created on : 4 Dec 2025, 14.54.09
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%@page import="java.util.List, com.autum.javaweb.perpustakaan.dao.BukuDAO, com.mycompany.javaweb.model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // 1. Cek Login Admin
    if (session.getAttribute("status") == null || !session.getAttribute("level").equals("admin")) {
        response.sendRedirect("login.jsp");
        return; 
    }
    String keyword = request.getParameter("cari");
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Daftar Buku (Admin)</title>
    <link rel="icon" type="image/jpg" href="images/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="bg-light" style="padding-top: 100px;">

    <jsp:include page="navbar.jsp" />

    <div class="container mt-4">
        
        <%
            // Menghitung statistik menggunakan DAO
            BukuDAO statsDao = new BukuDAO();
            int totalJudul = statsDao.hitungTotalBuku();
            int totalStok = statsDao.hitungTotalStok();
        %>
        
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card bg-primary text-white p-3 shadow-sm border-0 h-100">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-0 text-white-50">Total Judul Buku</h6>
                            <h2 class="mb-0 fw-bold"><%= totalJudul %></h2>
                        </div>
                        <i class="bi bi-book fs-1 opacity-25"></i>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card bg-success text-white p-3 shadow-sm border-0 h-100">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-0 text-white-50">Total Eksemplar</h6>
                            <h2 class="mb-0 fw-bold"><%= totalStok %></h2>
                        </div>
                        <i class="bi bi-box-seam fs-1 opacity-25"></i>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card bg-warning text-dark p-3 shadow-sm border-0 h-100">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-0 text-muted">Status Server</h6>
                            <h5 class="mb-0 fw-bold">Online 🟢</h5>
                        </div>
                        <i class="bi bi-hdd-network fs-1 opacity-25"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="card shadow-sm mb-5">
            <div class="card-header bg-white py-3">
                <h4 class="mb-0 text-primary">📚 Manajemen Buku</h4>
            </div>
            <div class="card-body">

                <% 
                    String msg = request.getParameter("msg");
                    if("SuksesEdit".equals(msg)){ 
                %>
                    <div class="alert alert-success alert-dismissible fade show">
                        ✅ Data buku berhasil diperbarui!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <% } %>

                <div class="row mb-3">
                    <div class="col-md-7 mb-2">
                        <a href="form_buku.jsp" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Tambah Buku</a>
                        <a href="manajemen_user.jsp" class="btn btn-dark"><i class="bi bi-people-fill"></i> Manajemen Anggota</a>
                        <a href="daftar_pinjam.jsp" class="btn btn-info text-white"><i class="bi bi-list-check"></i> Data Peminjaman</a>
                    </div>
                    <div class="col-md-5">
                        <form action="daftar_buku.jsp" method="get" class="d-flex gap-2">
                            <input type="text" name="cari" class="form-control" placeholder="Cari Judul..." value="<%= (keyword != null) ? keyword : "" %>">
                            <button type="submit" class="btn btn-dark">Cari</button>
                            <% if(keyword != null) { %><a href="daftar_buku.jsp" class="btn btn-secondary">Reset</a><% } %>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered align-middle">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>ID</th>
                                <th>Cover</th>
                                <th>Judul Buku</th>
                                <th>Kategori</th> <%-- Kolom Baru --%>
                                <th>Pengarang</th>
                                <th>Penerbit</th>
                                <th>Stok</th>
                                <th style="width: 150px;">Aksi</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Connection con = Koneksi.getConnection();
                                    // Query JOIN untuk mengambil nama kategori
                                    String sql = "SELECT b.*, k.nama_kategori FROM buku b " +
                                                 "LEFT JOIN kategori k ON b.id_kategori = k.id_kategori ";
                                    
                                    if(keyword != null && !keyword.isEmpty()) {
                                        sql += "WHERE b.judul_buku ILIKE '%" + keyword + "%' ";
                                    }
                                    sql += "ORDER BY b.id_buku DESC";
                                    
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery(sql);
                                    
                                    boolean adaData = false;
                                    while(rs.next()) {
                                        adaData = true;
                                        String img = (rs.getString("gambar") == null || rs.getString("gambar").isEmpty()) ? "no-image.jpg" : rs.getString("gambar");
                                        String kategori = rs.getString("nama_kategori") != null ? rs.getString("nama_kategori") : "-";
                            %>
                            <tr>
                                <td class="text-center"><%= rs.getInt("id_buku") %></td>
                                <td class="text-center">
                                    <img src="images/buku/<%= img %>" width="50" height="70" style="object-fit: cover; border-radius: 4px; border: 1px solid #ddd;">
                                </td>
                                <td><strong><%= rs.getString("judul_buku") %></strong></td>
                                <td class="text-center"><span class="badge bg-secondary"><%= kategori %></span></td> <%-- Tampilan Kategori --%>
                                <td><%= rs.getString("pengarang") %></td>
                                <td><%= rs.getString("penerbit") %></td>
                                <td class="text-center">
                                    <% if(rs.getInt("stok") > 0) { %>
                                        <span class="badge bg-success"><%= rs.getInt("stok") %></span>
                                    <% } else { %>
                                        <span class="badge bg-danger">Habis</span>
                                    <% } %>
                                </td>
                                <td class="text-center">
                                    <div class="btn-group">
                                        <a href="form_edit.jsp?id=<%= rs.getInt("id_buku") %>" class="btn btn-sm btn-warning" title="Edit"><i class="bi bi-pencil-square"></i></a>
                                        <a href="proses_hapus.jsp?id=<%= rs.getInt("id_buku") %>" class="btn btn-sm btn-danger" onclick="return confirm('Hapus buku ini?')" title="Hapus"><i class="bi bi-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                            <% 
                                    }
                                    if(!adaData) {
                                        out.println("<tr><td colspan='8' class='text-center'>Data tidak ditemukan</td></tr>");
                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='8' class='text-center text-danger'>Error: " + e.getMessage() + "</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>