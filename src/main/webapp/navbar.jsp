<%-- 
    Document   : navbar
    Created on : 11 Dec 2025, 14.02.20
    Author     : autummzebtotanel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
    .navbar { 
        transition: all 0.3s ease; 
        background: rgba(255, 255, 255, 0.98) !important; 
        backdrop-filter: blur(10px); 
        border-bottom: 1px solid #f0f0f0;
        padding: 15px 0 !important;
        font-family: 'Poppins', sans-serif !important;
    }
    .navbar-brand { font-weight: 700 !important; font-size: 1.6rem !important; color: #1e293b !important; text-decoration: none; }
    .brand-icon { color: #3b82f6 !important; }
    .nav-link { font-weight: 400 !important; color: #475569 !important; font-size: 0.95rem !important; padding: 0 15px !important; }
    .nav-link:hover { color: #3b82f6 !important; }
    
    .btn-login-nav {
        background-color: #60a5fa !important; 
        color: white !important;
        border-radius: 50px !important;
        padding: 8px 30px !important;
        font-weight: 500 !important;
        text-decoration: none !important;
        display: inline-block !important;
        border: none !important;
        transition: 0.3s;
    }
    .btn-login-nav:hover { background-color: #3b82f6 !important; opacity: 0.9; }
</style>

<nav class="navbar navbar-expand-lg fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="bi bi-book-half brand-icon"></i> ePerpus
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#fitur">Fitur</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#manfaat">Manfaat</a></li>
                <li class="nav-item"><a class="nav-link" href="tentang.jsp">Tentang Kami</a></li>
                <li class="nav-item"><a class="nav-link" href="galeri.jsp">Galeri</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#faq">FAQ</a></li>
                
                <li class="nav-item ms-lg-3">
                    <% if (session.getAttribute("status") == null) { %>
                        <a href="login.jsp" class="btn-login-nav">Login</a>
                    <% } else { %>
                        <div class="d-flex align-items-center gap-2">
                            <% if("admin".equals(session.getAttribute("level"))) { %>
                                <span class="badge text-primary border border-primary px-3 py-2 rounded-pill" style="font-size: 0.75rem;">Admin Mode</span>
                            <% } %>
                            <a href="logout.jsp" class="btn btn-danger rounded-pill px-4" 
                               style="font-weight: 500;" 
                               onclick="return confirm('Apakah Anda yakin ingin logout?')">
                                <i class="bi bi-box-arrow-right me-1"></i> Logout
                            </a>
                        </div>
                    <% } %>
                </li>
            </ul>
        </div>
    </div>
</nav>