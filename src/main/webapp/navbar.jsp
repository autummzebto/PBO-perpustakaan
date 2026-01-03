<%-- 
    Document   : navbar
    Created on : 11 Dec 2025, 14.02.20
    Author     : autummzebtotanel
--%>

<%-- navbar.jsp --%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
  <div class="container">
    <a class="navbar-brand" href="#">Perpus Digital</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <% if (session.getAttribute("status") != null) { %>
            
            <% if (session.getAttribute("level").equals("admin")) { %>
                <li class="nav-item"><a class="nav-link" href="daftar_buku.jsp">Daftar Buku</a></li>
                <li class="nav-item"><a class="nav-link" href="daftar_pinjam.jsp">Peminjaman</a></li>
            <% } else { %>
                <li class="nav-item"><a class="nav-link" href="halaman_anggota.jsp">Pinjam Buku</a></li>
            <% } %>

            <li class="nav-item">
                <a class="nav-link btn btn-danger text-white btn-sm ms-2 px-3" href="logout.jsp">Logout</a>
            </li>
            
        <% } %>
      </ul>
    </div>
  </div>
</nav>
