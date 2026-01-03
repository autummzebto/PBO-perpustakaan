<%-- 
    Document   : proses_hapus
    Created on : 4 Dec 2025, 14.59.40
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mycompany.javaweb.koneksi.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // --- 1. CEK KEAMANAN (WAJIB) ---
    // Pastikan user sudah login sebelum boleh menghapus
    if (session.getAttribute("status") == null || !session.getAttribute("status").equals("login")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // --- 2. TANGKAP ID BUKU ---
    String idStr = request.getParameter("id");

    // Validasi: Jika ID kosong, batalkan
    if (idStr == null || idStr.isEmpty()) {
        response.sendRedirect("daftar_buku.jsp");
        return;
    }

    try {
        int id = Integer.parseInt(idStr);
        
        Connection con = Koneksi.getConnection();
        
        // --- 3. EKSEKUSI HAPUS ---
        String sql = "DELETE FROM buku WHERE id_buku = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        
        int hasil = ps.executeUpdate();
        
        if (hasil > 0) {
            // Jika berhasil dihapus
            out.println("<script>alert('Data Berhasil Dihapus!'); window.location='daftar_buku.jsp';</script>");
        } else {
            // Jika ID tidak ditemukan (misal sudah dihapus duluan)
            out.println("<script>alert('Data gagal dihapus atau tidak ditemukan.'); window.location='daftar_buku.jsp';</script>");
        }
        
    } catch (Exception e) {
        out.println("<h3>Gagal Menghapus Data!</h3>");
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
