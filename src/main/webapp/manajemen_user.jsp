<%-- 
    Document   : manajemen_user
    Created on : Jan 14, 2026
    Author     : autummzebtotanel
--%>

<%@page import="com.mycompany.javaweb.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.autum.javaweb.perpustakaan.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manajemen User - ePerpus</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body { padding-top: 100px; background-color: #f8f9fa; font-family: 'Poppins', sans-serif; }
        .card-custom { border: none; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        .table thead { background-color: #1e293b; color: white; }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-dark"><i class="bi bi-people-fill text-primary"></i> Manajemen Anggota</h2>
            <button class="btn btn-primary rounded-pill px-4" data-bs-toggle="modal" data-bs-target="#modalTambah">
                <i class="bi bi-person-plus-fill me-2"></i> Tambah Anggota
            </button>
        </div>

        <div class="card card-custom p-4">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Nama Lengkap</th>
                            <th>Level</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            UserDAO dao = new UserDAO();
                            List<User> list = dao.getAllUsers();
                            for(User u : list) {
                        %>
                        <tr>
                            <td><%= u.getIdUser() %></td>
                            <td class="fw-bold"><%= u.getUsername() %></td>
                            <td><%= u.getNamaLengkap() %></td>
                            <td>
                                <span class="badge <%= u.getLevel().equals("admin") ? "bg-danger" : "bg-success" %> rounded-pill">
                                    <%= u.getLevel() %>
                                </span>
                            </td>
                            <td class="text-center">
                                <a href="proses_user.jsp?aksi=hapus&id=<%= u.getIdUser() %>" 
                                   class="btn btn-outline-danger btn-sm rounded-circle" 
                                   onclick="return confirm('Yakin ingin menghapus user ini?')">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalTambah" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content border-0 shadow">
                <div class="modal-header bg-primary text-white border-0">
                    <h5 class="modal-title fw-bold">Input Anggota Baru</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form action="proses_user.jsp" method="POST">
                    <input type="hidden" name="aksi" value="tambah">
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Masukkan username..." required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Masukkan password..." required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Nama Lengkap</label>
                            <input type="text" name="nama_lengkap" class="form-control" placeholder="Nama asli anggota..." required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Level Akses</label>
                            <select name="level" class="form-select">
                                <option value="anggota">Anggota</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-light rounded-pill" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary rounded-pill px-4">Simpan Anggota</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>