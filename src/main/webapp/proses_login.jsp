<%-- 
    Document   : proses_login
    Created on : 4 Dec 2025, 15.20.07
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mycompany.javaweb.koneksi.Koneksi"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String level = request.getParameter("level"); // Tangkap pilihan user

    try {
        Connection con = Koneksi.getConnection();
        PreparedStatement ps = null;
        String sql = "";

        // Tentukan Query berdasarkan pilihan Level
        if (level.equals("admin")) {
            sql = "SELECT * FROM admin WHERE username=? AND password=?";
        } else {
            sql = "SELECT * FROM anggota WHERE username=? AND password=?";
        }

        ps = con.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // --- LOGIN SUKSES ---
            session.setAttribute("status", "login");
            session.setAttribute("level", level); // Simpan level (admin/anggota)
            session.setAttribute("user", user);

            if (level.equals("admin")) {
                // Jika Admin -> Masuk ke Menu Admin (CRUD)
                response.sendRedirect("daftar_buku.jsp"); 
            } else {
                // Jika Anggota -> Simpan ID-nya untuk keperluan pinjam
                session.setAttribute("id_anggota", rs.getInt("id_anggota"));
                session.setAttribute("nama", rs.getString("nama_lengkap"));
                
                // Arahkan ke Halaman Peminjaman (Kita buat setelah ini)
                response.sendRedirect("halaman_anggota.jsp"); 
            }
        } else {
            // --- LOGIN GAGAL ---
            out.println("<script>alert('Login Gagal! Cek Username, Password, atau Level.'); window.location='login.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>