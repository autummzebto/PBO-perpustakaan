<%-- 
    Document   : proses_simpan
    Created on : 4 Dec 2025
    Updated on : 16 Jan 2026 (Fitur Kategori & Keamanan)
--%>

<%@page import="com.autum.javaweb.perpustakaan.dao.BukuDAO"%>
<%@page import="com.mycompany.javaweb.model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // 1. CEK KEAMANAN
    if (session.getAttribute("status") == null || !session.getAttribute("status").equals("login")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. TANGKAP DATA FORM
    String judul = request.getParameter("judul_buku");
    String idKategoriStr = request.getParameter("id_kategori"); // Ambil ID Kategori
    String pengarang = request.getParameter("pengarang");
    String penerbit = request.getParameter("penerbit");
    String tahunStr = request.getParameter("tahun_terbit");
    String stokStr = request.getParameter("stok");
    String gambar = request.getParameter("gambar");

    // Validasi input wajib
    if (judul == null || judul.trim().isEmpty() || idKategoriStr == null || idKategoriStr.isEmpty()) {
        out.println("<script>alert('Judul dan Kategori wajib diisi!'); window.history.back();</script>");
        return;
    }

    try {
        int tahun = Integer.parseInt(tahunStr);
        int stok = Integer.parseInt(stokStr);
        int idKategori = Integer.parseInt(idKategoriStr); // Konversi ID Kategori ke angka

        // 3. SET DATA KE MODEL
        Buku b = new Buku();
        b.setJudulBuku(judul);
        b.setPengarang(pengarang);
        b.setPenerbit(penerbit);
        b.setTahunTerbit(tahun);
        b.setStok(stok);
        b.setGambar(gambar);
        
        // CATATAN: Pastikan di class Buku.java kamu sudah ada method setIdKategori
        // Jika belum ada, kamu bisa menambahkan kodingan manual di BukuDAO atau menambahkan field di class Buku.
        b.setIdKategori(idKategori); 

        // 4. SIMPAN KE DATABASE VIA DAO
        BukuDAO dao = new BukuDAO();
        dao.tambahBuku(b); // Pastikan method ini di DAO sudah mendukung id_kategori

        // 5. REDIRECT
        out.println("<script>alert('Data Berhasil Disimpan!'); window.location='daftar_buku.jsp';</script>");
        
    } catch (NumberFormatException e) {
        out.println("<script>alert('Tahun, Stok, dan Kategori harus angka!'); window.history.back();</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>