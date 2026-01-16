<%-- 
    Document   : form_buku
    Created on : 4 Dec 2025, 14.48.16
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("status") == null || !session.getAttribute("status").equals("login")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Tambah Buku Baru</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    
    <div class="container mt-5">
        <div class="card shadow" style="max-width: 500px; margin: auto;">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">Form Input Buku</h4>
            </div>
            <div class="card-body">
                <form action="proses_simpan.jsp" method="post">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Judul Buku</label>
                        <input type="text" name="judul_buku" class="form-control" required placeholder="Contoh: Belajar Java">
                    </div>

                    <%-- BAGIAN BARU: Dropdown Kategori --%>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Kategori Buku</label>
                        <select name="id_kategori" class="form-control" required>
                            <option value="">-- Pilih Kategori --</option>
                            <%
                                try {
                                    Connection con = Koneksi.getConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT * FROM kategori ORDER BY nama_kategori ASC");
                                    while(rs.next()){
                                %>
                                    <option value="<%= rs.getInt("id_kategori") %>">
                                        <%= rs.getString("nama_kategori") %>
                                    </option>
                                <%
                                    }
                                } catch (Exception e) {
                                    out.println("<option value=''>Error: " + e.getMessage() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Pengarang</label>
                        <input type="text" name="pengarang" class="form-control" required placeholder="Nama Pengarang">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Penerbit</label>
                        <input type="text" name="penerbit" class="form-control" required placeholder="Nama Penerbit">
                    </div>
                    
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label class="form-label fw-bold">Tahun Terbit</label>
                            <input type="number" name="tahun_terbit" class="form-control" required placeholder="2024">
                        </div>
                        <div class="col-6 mb-3">
                            <label class="form-label fw-bold">Stok Awal</label>
                            <input type="number" name="stok" class="form-control" required placeholder="10" min="1">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Nama File Gambar</label>
                        <input type="text" name="gambar" class="form-control" placeholder="Contoh: java.jpg">
                        <small class="text-muted">*Pastikan file sudah ada di folder <b>images/buku/</b></small>
                    </div>
                    
                    <div class="d-flex justify-content-between mt-4">
                        <a href="daftar_buku.jsp" class="btn btn-secondary">Batal</a>
                        <button type="submit" class="btn btn-success">Simpan Data</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>