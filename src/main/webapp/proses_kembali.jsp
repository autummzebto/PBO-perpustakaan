<%-- 
    Document   : proses_kembali
    Created on : 4 Dec 2025, 15.14.02
    Author     : autummzebtotanel
--%>

<%@page import="com.autum.javaweb.perpustakaan.dao.BukuDAO"%>
<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%
    // 1. Ambil ID dari URL (dikirim dari daftar_pinjam.jsp)
    String idPinjam = request.getParameter("id");
    
    if(idPinjam != null && !idPinjam.isEmpty()) {
        try {
            Connection con = Koneksi.getConnection();
            
            // 2. Ambil ID Buku dulu sebelum status diubah (untuk kembalikan stok)
            // PERHATIKAN: Nama kolom 'id_pinjam' dan 'id_buku'
            String sqlGetBuku = "SELECT id_buku FROM peminjaman WHERE id_pinjam = ?";
            PreparedStatement psGet = con.prepareStatement(sqlGetBuku);
            psGet.setInt(1, Integer.parseInt(idPinjam));
            ResultSet rs = psGet.executeQuery();
            
            int idBuku = 0;
            if(rs.next()) {
                idBuku = rs.getInt("id_buku");
            }
            
            // 3. Update Status Peminjaman
            // PERHATIKAN: Nama kolom 'id_pinjam'
            String sqlUpdate = "UPDATE peminjaman SET status = 'kembali', tanggal_kembali = NOW() WHERE id_pinjam = ?";
            PreparedStatement ps = con.prepareStatement(sqlUpdate);
            ps.setInt(1, Integer.parseInt(idPinjam));
            int hasil = ps.executeUpdate();
            
            if(hasil > 0) {
                // 4. Kembalikan Stok Buku (Opsional, tapi bagus)
                if(idBuku > 0) {
                    BukuDAO dao = new BukuDAO();
                    // Pastikan di BukuDAO ada method tambahStok atau logika sejenis
                    // Jika belum ada, bisa skip bagian ini atau buat manual query UPDATE buku SET stok = stok + 1
                    String sqlStok = "UPDATE buku SET stok = stok + 1 WHERE id_buku = ?";
                    PreparedStatement psStok = con.prepareStatement(sqlStok);
                    psStok.setInt(1, idBuku);
                    psStok.executeUpdate();
                }
                
                response.sendRedirect("daftar_pinjam.jsp?msg=SuksesKembali");
            } else {
                out.println("Gagal update database.");
            }
            
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        response.sendRedirect("daftar_pinjam.jsp");
    }
%>