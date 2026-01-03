<%-- 
    Document   : form_pinjam
    Created on : 4 Dec 2025, 15.12.40
    Author     : autummzebtotanel
--%>

<%@page import="java.sql.*, com.mycompany.javaweb.koneksi.Koneksi"%>
<%
    // 1. Cek Security (Hanya Admin)
    if (session.getAttribute("level") == null || !session.getAttribute("level").equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // 2. Ambil Parameter ID Buku
    String strIdBuku = request.getParameter("id_buku");
    if(strIdBuku == null || strIdBuku.isEmpty()) {
        response.sendRedirect("daftar_buku.jsp");
        return;
    }
    
    // 3. Ambil Judul Buku (Info)
    String judulBuku = "Tidak Diketahui";
    Connection con = Koneksi.getConnection();
    
    // Query Buku (Pastikan kolom 'judul_buku')
    String sqlBuku = "SELECT judul_buku FROM buku WHERE id_buku = ?";
    PreparedStatement psBuku = con.prepareStatement(sqlBuku);
    psBuku.setInt(1, Integer.parseInt(strIdBuku)); // Konversi ke Integer
    
    ResultSet rsBuku = psBuku.executeQuery();
    if(rsBuku.next()){ 
        judulBuku = rsBuku.getString("judul_buku"); 
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Form Peminjaman (Admin)</title>
    <style>
        body { font-family: sans-serif; padding: 20px; background-color: #f4f4f4; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 500px; margin: auto; }
        h2 { text-align: center; color: #333; }
        label { font-weight: bold; display: block; margin-bottom: 5px; }
        select, input[type=text] { width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        button:hover { background-color: #218838; }
        .btn-cancel { display: block; text-align: center; margin-top: 10px; text-decoration: none; color: #666; }
    </style>
</head>
<body>

    <div class="container">
        <h2>Form Peminjaman Buku</h2>
        
        <div style="background-color: #e9ecef; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
            Detail Buku:<br>
            <b style="font-size: 1.2em;"><%= judulBuku %></b>
        </div>
        
        <form action="proses_pinjam.jsp" method="post">
            <input type="hidden" name="id_buku" value="<%= strIdBuku %>">
            
            <label>Pilih Anggota Peminjam:</label>
            <select name="id_anggota_peminjam" required>
                <option value="">-- Pilih Nama Anggota --</option>
                <%
                    Statement st = con.createStatement();
                    // PERBAIKAN UTAMA: Menggunakan 'nama_lengkap'
                    String sqlAnggota = "SELECT id_anggota, nama_lengkap FROM anggota ORDER BY nama_lengkap ASC";
                    ResultSet rs = st.executeQuery(sqlAnggota);
                    
                    while(rs.next()){
                %>
                    <option value="<%= rs.getString("id_anggota") %>">
                        <%= rs.getString("nama_lengkap") %> (ID: <%= rs.getString("id_anggota") %>)
                    </option>
                <% } %>
            </select>
            
            <button type="submit">Proses Peminjaman</button>
            <a href="daftar_buku.jsp" class="btn-cancel">Batal</a>
        </form>
    </div>

</body>
</html>