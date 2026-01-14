<%-- 
    Document   : proses_user
    Created on : 14 Jan 2026, 23.45.34
    Author     : autummzebtotanel
--%>

<%@page import="com.mycompany.javaweb.model.User"%>
<%@page import="com.autum.javaweb.perpustakaan.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Inisialisasi DAO
    UserDAO dao = new UserDAO();
    String aksi = request.getParameter("aksi");

    if (aksi != null) {
        if (aksi.equals("tambah")) {
            // 1. Ambil data dari form modal
            String userBaru = request.getParameter("username");
            String passBaru = request.getParameter("password");
            String namaBaru = request.getParameter("nama_lengkap");
            String levelBaru = request.getParameter("level");

            // 2. Bungkus dalam objek Model User
            User u = new User();
            u.setUsername(userBaru);
            u.setPassword(passBaru);
            u.setNamaLengkap(namaBaru);
            u.setLevel(levelBaru);

            // 3. Simpan ke Database
            dao.tambahUser(u);
            
            // 4. Kembali ke halaman manajemen
            response.sendRedirect("manajemen_user.jsp");

        } else if (aksi.equals("hapus")) {
            // 1. Ambil ID yang akan dihapus dari link aksi
            int id = Integer.parseInt(request.getParameter("id"));
            
            // 2. Eksekusi hapus di Database
            dao.hapusUser(id);
            
            // 3. Kembali ke halaman manajemen
            response.sendRedirect("manajemen_user.jsp");
        }
    }
%>