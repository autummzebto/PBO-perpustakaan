<%-- 
    Document   : proses_simpan
    Created on : 4 Dec 2025
    Updated on : 11 Dec 2025 (Fitur Gambar & Stok)
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
    String pengarang = request.getParameter("pengarang");
    String penerbit = request.getParameter("penerbit");
    String tahunStr = request.getParameter("tahun_terbit");
    String stokStr = request.getParameter("stok");
    String gambar = request.getParameter("gambar");

    if (judul == null || judul.trim().isEmpty()) {
        out.println("<script>alert('Judul wajib diisi!'); window.history.back();</script>");
        return;
    }

    try {
        int tahun = Integer.parseInt(tahunStr);
        int stok = Integer.parseInt(stokStr);

        // 3. SET DATA KE MODEL
        Buku b = new Buku();
        b.setJudulBuku(judul);
        b.setPengarang(pengarang);
        b.setPenerbit(penerbit);
        b.setTahunTerbit(tahun);
        b.setStok(stok);
        b.setGambar(gambar); // Set gambar

        // 4. SIMPAN KE DATABASE VIA DAO
        BukuDAO dao = new BukuDAO();
        dao.tambahBuku(b);

        // 5. REDIRECT
        out.println("<script>alert('Data Berhasil Disimpan!'); window.location='daftar_buku.jsp';</script>");
        
    } catch (NumberFormatException e) {
        out.println("<script>alert('Tahun dan Stok harus angka!'); window.history.back();</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>