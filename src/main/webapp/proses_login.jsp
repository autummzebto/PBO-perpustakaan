<%-- 
    Document   : proses_login
    Author     : autummzebtotanel
--%>

<%@page import="com.mycompany.javaweb.model.User"%>
<%@page import="com.autum.javaweb.perpustakaan.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Ambil data dari login.jsp
    String userParam = request.getParameter("username");
    String passParam = request.getParameter("password");
    String levelParam = request.getParameter("level");

    // Validasi input agar tidak null
    if (userParam != null && passParam != null && levelParam != null) {
        
        UserDAO dao = new UserDAO();
        // Memanggil fungsi cekLogin yang sudah kita buat di UserDAO.java
        User userLogin = dao.cekLogin(userParam, passParam, levelParam);

        if (userLogin != null) {
            // --- LOGIN BERHASIL ---
                session.setAttribute("status", "login");
                session.setAttribute("id_user", userLogin.getIdUser());
                session.setAttribute("id_anggota", userLogin.getIdUser());
                session.setAttribute("user", userLogin.getUsername());
                session.setAttribute("nama", userLogin.getNamaLengkap());
                session.setAttribute("level", userLogin.getLevel());

            if (userLogin.getLevel().equalsIgnoreCase("admin")) {
                response.sendRedirect("daftar_buku.jsp");
            } else {
                response.sendRedirect("halaman_anggota.jsp");
            }
        } else {
            // --- LOGIN GAGAL ---
            out.println("<script>alert('Gagal! Akun tidak ditemukan di database.'); window.location='login.jsp';</script>");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>