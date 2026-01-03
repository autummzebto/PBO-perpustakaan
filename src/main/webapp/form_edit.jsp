<%-- 
    Document   : form_edit
    Created on : 4 Dec 2025, 15.03.42
    Author     : autummzebtotanel
--%>

<%@page import="com.autum.javaweb.perpustakaan.dao.BukuDAO, com.mycompany.javaweb.model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("status") == null || !session.getAttribute("status").equals("login")) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Ambil Data Lama Buku
    int id = Integer.parseInt(request.getParameter("id"));
    BukuDAO dao = new BukuDAO();
    Buku b = dao.getBukuById(id);
    
    if(b == null) {
        response.sendRedirect("daftar_buku.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Data Buku</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    
    <div class="container mt-5">
        <div class="card shadow" style="max-width: 500px; margin: auto;">
            <div class="card-header bg-warning">
                <h4 class="mb-0 text-dark">Edit Data Buku</h4>
            </div>
            <div class="card-body">
                <form action="proses_edit.jsp" method="post">
                    <input type="hidden" name="id_buku" value="<%= b.getIdBuku() %>">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Judul Buku</label>
                        <input type="text" name="judul_buku" class="form-control" value="<%= b.getJudulBuku() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Pengarang</label>
                        <input type="text" name="pengarang" class="form-control" value="<%= b.getPengarang() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Penerbit</label>
                        <input type="text" name="penerbit" class="form-control" value="<%= b.getPenerbit() %>" required>
                    </div>
                    
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label class="form-label fw-bold">Tahun Terbit</label>
                            <input type="number" name="tahun_terbit" class="form-control" value="<%= b.getTahunTerbit() %>" required>
                        </div>
                        <div class="col-6 mb-3">
                            <label class="form-label fw-bold">Stok</label>
                            <input type="number" name="stok" class="form-control" value="<%= b.getStok() %>" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Nama File Gambar</label>
                        <input type="text" name="gambar" class="form-control" value="<%= (b.getGambar()==null)?"":b.getGambar() %>">
                        <small class="text-muted">Folder: <b>images/buku/</b></small>
                    </div>
                    
                    <div class="d-flex justify-content-between mt-4">
                        <a href="daftar_buku.jsp" class="btn btn-secondary">Batal</a>
                        <button type="submit" class="btn btn-warning fw-bold">Update Perubahan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>