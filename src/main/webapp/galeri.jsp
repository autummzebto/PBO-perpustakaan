<%-- 
    Document   : galeri
    Created on : 14 Jan 2026
    Author     : autummzebtotanel
--%>

<%@page import="java.util.List, com.autum.javaweb.perpustakaan.dao.BukuDAO, com.mycompany.javaweb.model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <link rel="icon" type="image/jpg" href="images/favicon.png">
    <title>Galeri ePerpus - Koleksi Digital</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="css/style.css" rel="stylesheet">
    
    <style>
        body { 
            padding-top: 100px; /* Memberi ruang untuk fixed-top navbar */
            background-color: #f0f2f5; /* Background abu-abu muda */
            font-family: 'Poppins', sans-serif;
        }
        .gallery-header {
            text-align: center;
            margin-bottom: 50px;
            padding-top: 30px;
        }
        .gallery-header h2 {
            font-size: 2.8rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }
        .gallery-header h2::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: -10px;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: #3498db;
            border-radius: 2px;
        }
        .gallery-header p {
            font-size: 1.1rem;
            color: #7f8c8d;
            max-width: 700px;
            margin: 0 auto;
        }

        /* Tombol Filter */
        .filter-buttons {
            display: flex;
            justify-content: center;
            flex-wrap: wrap; /* Agar responsif pada layar kecil */
            gap: 10px; /* Jarak antar tombol */
            margin-bottom: 40px;
        }
        .filter-btn {
            background-color: #ecf0f1;
            color: #2c3e50;
            border: 1px solid #bdc3c7;
            border-radius: 50px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .filter-btn:hover {
            background-color: #dfe6e9;
            border-color: #aeb5bb;
            color: #2c3e50;
        }
        .filter-btn.active {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
            box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
        }
        .filter-btn.active:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            color: white;
        }

        /* Card Galeri */
        .card-gallery {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08); /* Bayangan lebih halus */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%; /* Pastikan kartu punya tinggi yang sama */
            display: flex;
            flex-direction: column;
        }
        .card-gallery:hover {
            transform: translateY(-8px); /* Efek naik sedikit */
            box-shadow: 0 15px 35px rgba(0,0,0,0.15); /* Bayangan lebih tebal saat hover */
        }
        .img-container {
            height: 250px; /* Tinggi gambar default */
            width: 100%;
            overflow: hidden;
            background-color: #ecf0f1;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Memastikan gambar mengisi area tanpa terdistorsi */
            transition: transform 0.3s ease;
        }
        .card-gallery:hover .img-container img {
            transform: scale(1.05); /* Zoom in sedikit saat hover */
        }
        .gallery-info {
            padding: 20px;
            text-align: center;
            flex-grow: 1; /* Agar info mengisi sisa ruang */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .gallery-info h6 {
            font-weight: 700;
            margin-bottom: 8px;
            color: #34495e;
            font-size: 1.1rem;
        }
        .gallery-info p {
            font-size: 0.9rem;
            color: #7f8c8d;
            margin-bottom: 0;
            line-height: 1.5;
        }
        
        /* Animasi saat filter */
        .gallery-item.hidden {
            display: none;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="bi bi-book-half text-primary"></i> ePerpus
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
                    <li class="nav-item"><a class="nav-link active" href="galeri.jsp">Galeri</a></li>

                    <li class="nav-item">
                        <a class="nav-link" href="https://docs.google.com/forms/d/e/1FAIpQLSfNYm6wmOcXNBQu2qZupgnaaVv4ABxbxrnkR8b2dwIM_U34Jg/viewform" target="_blank">Hubungi Kami</a>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="index.jsp#faq">FAQ</a></li>

                    <li class="nav-item ms-3">
                        <% if (session.getAttribute("status") == null) { %>
                        <a href="login.jsp" class="btn-login-nav">Login</a>
                        <% } else { %>
                        <% if (session.getAttribute("level").equals("admin")) { %>
                        <a href="daftar_buku.jsp" class="btn btn-success rounded-pill px-4">Dashboard Admin</a>
                        <% } else { %>
                        <a href="halaman_anggota.jsp" class="btn btn-success rounded-pill px-4">Dashboard Anggota</a>
                        <% } %>
                        <% } %>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    

    <div class="container mb-5">
        <div class="gallery-header">
            <h2>Galeri ePerpus</h2>
            <p>Lihat tampilan dan fitur aplikasi Buku Warung Digital kami, termasuk sampul buku dan representasi database.</p>
        </div>

        <div class="filter-buttons">
            <button class="filter-btn active" data-filter="all">Semua Koleksi</button>
            <button class="filter-btn" data-filter="aplikasi">Tampilan Aplikasi</button>
            <button class="filter-btn" data-filter="buku">Sampul Buku</button>
            <button class="filter-btn" data-filter="database">Database</button>
        </div>

        <div class="row g-4 justify-content-center" id="gallery-container">
            <%
                BukuDAO bukuDao = new BukuDAO();
                List<Buku> daftarBuku = bukuDao.getAllBuku();
            %>
            
            <div class="col-lg-3 col-md-4 col-sm-6 gallery-item aplikasi">
                <div class="card card-gallery">
                    <div class="img-container">
                        <img src="images/gallery/admin1.png" alt="Tampilan Aplikasi Dashboard Admin">
                    </div>
                    <div class="gallery-info">
                        <h6>Dashboard Admin</h6>
                        <p>Antarmuka pengelolaan buku dan peminjaman oleh admin.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 gallery-item aplikasi">
                <div class="card card-gallery">
                    <div class="img-container">
                        <img src="images/gallery/user1.png" alt="Tampilan Aplikasi Peminjaman">
                    </div>
                    <div class="gallery-info">
                        <h6>Form Peminjaman</h6>
                        <p>Desain formulir untuk user meminjam buku secara digital.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-4 col-sm-6 gallery-item database">
                <div class="card card-gallery">
                    <div class="img-container">
                        <img src="images/gallery/stable.jpeg" alt="Struktur Tabel Buku">
                    </div>
                    <div class="gallery-info">
                        <h6>Struktur Tabel Buku</h6>
                        <p>Representasi visual skema database untuk tabel buku.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 gallery-item database">
                <div class="card card-gallery">
                    <div class="img-container">
                        <img src="images/gallery/rl.png" alt="Relasi Antar Tabel">
                    </div>
                    <div class="gallery-info">
                        <h6>Data Real-Time</h6>
                        <p>data di pgAdmin sama persis dengan data yang ada di tabel web</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 gallery-item database">
                <div class="card card-gallery">
                    <div class="img-container">
                        <img src="images/gallery/kod.png" alt="Relasi Antar Tabel">
                    </div>
                    <div class="gallery-info">
                        <h6>Source Code Koneksi</h6>
                        <p>Jembatan Kodingan</p>
                    </div>
                </div>
            </div>

            <%
                if (daftarBuku != null && !daftarBuku.isEmpty()) {
                    for (Buku b : daftarBuku) {
                        String imgName = (b.getGambar() == null || b.getGambar().isEmpty()) ? "no-image.jpg" : b.getGambar();
            %>
            <div class="col-lg-3 col-md-4 col-sm-6 gallery-item buku">
                <div class="card card-gallery">
                    <div class="img-container">
                        <img src="images/buku/<%= imgName %>" alt="Sampul Buku <%= b.getJudulBuku() %>">
                    </div>
                    <div class="gallery-info">
                        <h6><%= b.getJudulBuku() %></h6>
                        <p><%= b.getPengarang() %></p>
                    </div>
                </div>
            </div>
            <% 
                    } 
                } else { 
            %>
                <div class="col-12 text-center py-5">
                    <i class="bi bi-images fs-1 text-muted"></i>
                    <p class="mt-3">Belum ada koleksi sampul buku yang tersedia.</p>
                </div>
            <% } %>

            <% if (daftarBuku == null || daftarBuku.isEmpty()) { %>
                <div class="col-12 text-center py-5" id="no-items-message" style="display: none;">
                    <i class="bi bi-x-circle fs-1 text-danger"></i>
                    <p class="mt-3">Tidak ada item yang ditemukan untuk kategori ini.</p>
                </div>
            <% } %>

        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const filterButtons = document.querySelectorAll('.filter-btn');
            const galleryItems = document.querySelectorAll('.gallery-item');
            const noItemsMessage = document.getElementById('no-items-message');
            
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');

                    const filterValue = this.getAttribute('data-filter');
                    let itemsShown = 0;

                    galleryItems.forEach(item => {
                        if (filterValue === 'all' || item.classList.contains(filterValue)) {
                            item.classList.remove('hidden');
                            itemsShown++;
                        } else {
                            item.classList.add('hidden');
                        }
                    });

                    if (itemsShown === 0) {
                        noItemsMessage.style.display = 'block';
                    } else {
                        noItemsMessage.style.display = 'none';
                    }
                });
            });

            // Trigger "Semua Koleksi" saat halaman pertama kali dimuat
            document.querySelector('.filter-btn[data-filter="all"]').click();
        });
    </script>
</body>
</html>