<%-- 
    Document   : proses_komentar
    Created on : 11 Dec 2025, 15.04.57
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%
    // 1. Cek Login
    if (session.getAttribute("status") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. Tangkap Data
    String idBukuStr = request.getParameter("id_buku");
    String ratingStr = request.getParameter("rating");
    String komentar = request.getParameter("komentar");
    
    // Ambil ID Anggota dari Session yang sedang login
    // Pastikan session attribute ini sesuai dengan login.jsp (id_anggota)
    int idAnggota = 0;
    if(session.getAttribute("id_anggota") != null) {
        idAnggota = (int) session.getAttribute("id_anggota");
    } else {
        out.println("Error: Session ID Anggota tidak ditemukan.");
        return;
    }

    if (idBukuStr != null && ratingStr != null && komentar != null) {
        try {
            Connection con = Koneksi.getConnection();
            
            // 3. Insert ke Tabel Ulasan
            String sql = "INSERT INTO ulasan (id_buku, id_anggota, rating, isi_komentar, tanggal_ulasan) VALUES (?, ?, ?, ?, CURRENT_DATE)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, Integer.parseInt(idBukuStr));
            ps.setInt(2, idAnggota);
            ps.setInt(3, Integer.parseInt(ratingStr));
            ps.setString(4, komentar);
            
            ps.executeUpdate();
            
            // 4. Kembali ke halaman detail
            response.sendRedirect("detail_buku.jsp?id=" + idBukuStr);
            
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        response.sendRedirect("halaman_anggota.jsp");
    }
%>
