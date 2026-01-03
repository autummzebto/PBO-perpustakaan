<%-- 
    Document   : daftar_pinjam
    Created on : 4 Dec 2025, 15.13.35
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // 1. Cek Security (Hanya Admin)
    if (session.getAttribute("status") == null || !session.getAttribute("level").equals("admin")) {
        response.sendRedirect("login.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Data Peminjaman</title>
        <style>
            body { font-family: sans-serif; padding: 20px; }
            h2 { text-align: center; }
            table { width: 95%; margin: 20px auto; border-collapse: collapse; }
            th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
            th { background-color: #17a2b8; color: white; } 
            tr:nth-child(even) { background-color: #f9f9f9; }
            
            .btn { text-decoration: none; padding: 6px 12px; border-radius: 4px; color: white; font-size: 14px; }
            .btn-back { background: #6c757d; margin-bottom: 15px; display: inline-block; }
            .btn-kembali { background: #28a745; } 
            
            .badge { padding: 5px 10px; border-radius: 10px; font-size: 12px; color: white; }
            .bg-pinjam { background-color: #ffc107; color: black; } 
            .bg-selesai { background-color: #28a745; } 
        </style>
    </head>
    <body>
        <h2>Data Riwayat Peminjaman</h2>
        
        <div style="width: 95%; margin: auto;">
            <a href="daftar_buku.jsp" class="btn btn-back">&laquo; Kembali ke Daftar Buku</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID Pinjam</th>
                    <th>Nama Peminjam</th>
                    <th>Judul Buku</th>
                    <th>Tgl Pinjam</th>
                    <th>Status</th>
                    <th style="text-align: center;">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = Koneksi.getConnection();
                    
                    // --- PERBAIKAN QUERY SQL DISINI ---
                    // 1. p.id_pinjam (Sesuai database Anda)
                    // 2. a.nama_lengkap (Sesuai database Anda)
                    // 3. b.judul_buku (Sesuai database Anda)
                    String sql = "SELECT p.id_pinjam, p.tanggal_pinjam, p.status, " +
                                 "a.nama_lengkap AS nama_anggota, " +
                                 "b.judul_buku AS judul_buku " +
                                 "FROM peminjaman p " +
                                 "JOIN anggota a ON p.id_anggota = a.id_anggota " +
                                 "JOIN buku b ON p.id_buku = b.id_buku " +
                                 "ORDER BY p.id_pinjam DESC";
                                 
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    
                    while(rs.next()) {
                        String status = rs.getString("status");
                        // Pastikan null safe (jika status kosong, anggap dipinjam)
                        if(status == null) status = "dipinjam";
                %>
                <tr>
                    <td><%= rs.getString("id_pinjam") %></td>
                    <td><%= rs.getString("nama_anggota") %></td>
                    <td><%= rs.getString("judul_buku") %></td>
                    <td><%= rs.getDate("tanggal_pinjam") %></td>
                    <td>
                        <% if(status.equalsIgnoreCase("dipinjam")) { %>
                            <span class="badge bg-pinjam">Sedang Dipinjam</span>
                        <% } else { %>
                            <span class="badge bg-selesai">Sudah Kembali</span>
                        <% } %>
                    </td>
                    <td style="text-align: center;">
                        <% if(status.equalsIgnoreCase("dipinjam")) { %>
                            <a href="proses_kembali.jsp?id=<%= rs.getString("id_pinjam") %>" 
                               class="btn btn-kembali"
                               onclick="return confirm('Proses pengembalian buku ini?')">
                               ✅ Kembalikan
                            </a>
                        <% } else { %>
                            -
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
