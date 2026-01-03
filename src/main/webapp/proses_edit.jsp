<%-- 
    Document   : proses_edit
    Created on : 4 Dec 2025, 15.04.26
    Author     : autummzebtotanel
--%>

<%@page import="com.autum.javaweb.perpustakaan.dao.BukuDAO, com.mycompany.javaweb.model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("status") == null || !session.getAttribute("status").equals("login")) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        int id = Integer.parseInt(request.getParameter("id_buku"));
        String judul = request.getParameter("judul_buku");
        String pengarang = request.getParameter("pengarang");
        String penerbit = request.getParameter("penerbit");
        int tahun = Integer.parseInt(request.getParameter("tahun_terbit"));
        int stok = Integer.parseInt(request.getParameter("stok"));
        String gambar = request.getParameter("gambar");

        Buku b = new Buku();
        b.setIdBuku(id);
        b.setJudulBuku(judul);
        b.setPengarang(pengarang);
        b.setPenerbit(penerbit);
        b.setTahunTerbit(tahun);
        b.setStok(stok);
        b.setGambar(gambar);

        BukuDAO dao = new BukuDAO();
        dao.updateBuku(b); // Update ke Database

        response.sendRedirect("daftar_buku.jsp?msg=SuksesEdit");
        
    } catch (Exception e) {
        out.println("Error Update: " + e.getMessage());
    }
%>