<%-- 
    Document   : proses_komentar
    Created on : 11 Dec 2025, 15.04.57
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%
    // 1. Cek apakah user sudah login
    if (session.getAttribute("status") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. Tangkap Data dari Formulir Detail Buku
    String idBukuStr = request.getParameter("id_buku");
    String ratingStr = request.getParameter("rating");
    String komentar = request.getParameter("komentar");
    
    // 3. Ambil ID User dari Session (Penting untuk Foreign Key)
    // Kita ambil id_user karena tabel ulasan sekarang merujuk ke tabel users
    int idUserAktif = 0;
    if(session.getAttribute("id_user") != null) {
        idUserAktif = (int) session.getAttribute("id_user");
    } else if(session.getAttribute("id_anggota") != null) {
        // Backup jika login masih menggunakan nama session lama
        idUserAktif = (int) session.getAttribute("id_anggota");
    } else {
        out.println("<script>alert('Error: Session ID tidak ditemukan. Silakan login ulang.'); window.location='login.jsp';</script>");
        return;
    }

    // 4. Proses Simpan ke Database
    if (idBukuStr != null && ratingStr != null && komentar != null && !komentar.trim().isEmpty()) {
        try {
            Connection con = Koneksi.getConnection();
            
            // Perintah SQL untuk memasukkan ulasan
            // id_anggota di sini diisi dengan ID dari tabel users yang aktif
            String sql = "INSERT INTO ulasan (id_buku, id_anggota, rating, isi_komentar, tanggal_ulasan) VALUES (?, ?, ?, ?, CURRENT_DATE)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, Integer.parseInt(idBukuStr));
            ps.setInt(2, idUserAktif);
            ps.setInt(3, Integer.parseInt(ratingStr));
            ps.setString(4, komentar);
            
            ps.executeUpdate();
            
            // 5. Tutup koneksi dan kembali ke halaman detail buku
            con.close();
            response.sendRedirect("detail_buku.jsp?id=" + idBukuStr);
            
        } catch (Exception e) {
            // Menampilkan error jika terjadi masalah pada database (seperti Foreign Key error)
            out.println("Error Database: " + e.getMessage());
        }
    } else {
        // Jika data tidak lengkap, kembali ke halaman utama anggota
        response.sendRedirect("halaman_anggota.jsp");
    }
%>