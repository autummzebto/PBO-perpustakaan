<%-- 
    Document   : proses_pinjam
    Created on : 4 Dec 2025, 15.13.09
    Author     : autummzebtotanel
--%>

<%@page import="com.autum.javaweb.perpustakaan.dao.BukuDAO"%>
<%@page import="java.sql.*, java.util.Date"%>
<%@page import="com.mycompany.javaweb.koneksi.Koneksi"%>

<%@page import="com.autum.javaweb.perpustakaan.dao.BukuDAO"%>
<%@page import="java.sql.*"%>
<%@page import="com.mycompany.javaweb.koneksi.Koneksi"%>

<%
    // 1. Cek Login
    String userLevel = (String) session.getAttribute("level");
    if (userLevel == null || (!userLevel.equals("anggota") && !userLevel.equals("admin"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. Ambil ID Buku
    String strIdBuku = request.getParameter("id_buku");
    if(strIdBuku == null || strIdBuku.isEmpty()) { 
        response.sendRedirect("halaman_anggota.jsp"); 
        return; 
    }
    
    int idBuku = Integer.parseInt(strIdBuku);
    int idAnggota = 0;
    String redirectPage = "";

    // 3. LOGIKA PEMILIHAN PEMINJAM (Fitur Canggih Anda)
    if (userLevel.equals("anggota")) {
        // A. Jika Anggota: Pakai ID sendiri dari Session
        if(session.getAttribute("id_anggota") != null){
            idAnggota = (int) session.getAttribute("id_anggota");
        }
        redirectPage = "halaman_anggota.jsp"; // Balik ke Grid Gambar
        
    } else {
        // B. Jika Admin: Pakai ID dari Form Input (Admin meminjamkan untuk orang lain)
        String paramIdAnggota = request.getParameter("id_anggota_peminjam");
        
        // Validasi: Admin harus pilih anggota dulu
        if (paramIdAnggota == null || paramIdAnggota.isEmpty()) {
            out.println("<script>alert('Harap pilih anggota terlebih dahulu!'); window.history.back();</script>");
            return;
        }
        idAnggota = Integer.parseInt(paramIdAnggota);
        redirectPage = "daftar_buku.jsp"; // Balik ke Tabel Admin
    }

    // 4. PROSES TRANSAKSI
    BukuDAO dao = new BukuDAO();
    int stokTersedia = dao.getStokById(idBuku);

    if (stokTersedia > 0) {
        try {
            Connection con = Koneksi.getConnection();
            
            // Insert ke tabel peminjaman
            // Pastikan nama kolom di database Anda 'status' atau 'status_kembali' (sesuaikan disini)
            String sql = "INSERT INTO peminjaman (id_buku, id_anggota, tanggal_pinjam, status) VALUES (?, ?, CURRENT_DATE, 'dipinjam')";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idBuku);
            ps.setInt(2, idAnggota);
            ps.executeUpdate();
            
            // KURANGI STOK (Fitur Baru)
            dao.kurangiStok(idBuku);
            
            // SUKSES -> Redirect dengan parameter msg agar muncul Alert Hijau
            response.sendRedirect(redirectPage + "?msg=BerhasilPinjam");
            
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    } else {
        // GAGAL (Stok Habis) -> Redirect dengan parameter msg agar muncul Alert Merah
        response.sendRedirect(redirectPage + "?msg=GagalPinjam");
    }
%>