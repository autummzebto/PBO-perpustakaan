<%-- 
    Document   : tentang
    Created on : 12 Dec 2025, 10.30.00
    Author     : autummzebtotanel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <link rel="icon" type="image/jpg" href="images/favicon.png">
    <title>Tentang Kami - ePerpus</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="css/style.css" rel="stylesheet">
    
    <style>
        /* CSS Tambahan Khusus Tentang Kami */
        html {
            scroll-behavior: smooth;
            scroll-padding-top: 150px; /* Jarak agar judul tidak tertutup navbar saat scroll */
        }

        .hero-about {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('images/img3.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 180px 0 100px;
            text-align: center;
            margin-top: 76px;
        }
        
        /* Sub-Navbar Dropdown Styling */
        .sub-nav-container {
            background: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: sticky;
            top: 76px;
            z-index: 999;
            padding: 12px 0;
        }

        .team-member {
            transition: transform 0.3s ease;
        }
        
        .team-member:hover {
            transform: translateY(-10px);
        }
        
        .timeline {
            position: relative;
            padding: 20px 0;
        }
        
        .timeline::before {
            content: '';
            position: absolute;
            height: 100%;
            width: 4px;
            background: #0c63e4;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .timeline-item {
            margin-bottom: 50px;
            position: relative;
        }
        
        .timeline-item::before {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            background: #0c63e4;
            border-radius: 50%;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .timeline-content {
            width: 45%;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .timeline-item:nth-child(odd) .timeline-content {
            margin-left: auto;
        }
        
        @media (max-width: 768px) {
            .timeline::before {
                left: 30px;
            }
            
            .timeline-item::before {
                left: 30px;
            }
            
            .timeline-content {
                width: calc(100% - 60px);
                margin-left: 60px !important;
            }
        }
        
        .vision-mission-box {
            background-color: #f0f8ff;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        
        .vision-mission-icon {
            font-size: 2.5rem;
            color: #0c63e4;
            margin-bottom: 15px;
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
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Tentang Kami
                        </a>
                        <ul class="dropdown-menu shadow border-0" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="tentang.jsp#tentang-proyek">Profil Perpustakaan</a></li>
                            <li><a class="dropdown-item" href="tentang.jsp#visi-misi">Visi dan Misi</a></li>
                            <li><a class="dropdown-item" href="tentang.jsp#tim-pengembang">Tim Pengembang</a></li>
                            <li><a class="dropdown-item" href="tentang.jsp#perjalanan-proyek">Perjalanan Proyek</a></li>
                            <li><a class="dropdown-item" href="tentang.jsp#teknologi">Teknologi</a></li>
                        </ul>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="galeri.jsp">Galeri</a></li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="https://docs.google.com/forms/d/e/1FAIpQLSfNYm6wmOcXNBQu2qZupgnaaVv4ABxbxrnkR8b2dwIM_U34Jg/viewform" target="_blank">Hubungi Kami</a>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="index.jsp#faq">FAQ</a></li>
                    
                    <li class="nav-item ms-3">
                        <% if (session.getAttribute("status") == null) { %>
                            <a href="login.jsp" class="btn-login-nav">Login</a>
                        <% } else { %>
                            <% if(session.getAttribute("level").equals("admin")) { %>
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

    <section class="hero-about">
        <div class="container">
            <h1 class="display-4 fw-bold mb-4">Tentang ePerpus</h1>
            <p class="lead">Solusi Literasi Digital Masa Depan</p>
        </div>
    </section>

    <section id="tentang-proyek" class="py-5 bg-white">
        <div class="container py-4">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0 text-center">
                    <img src="images/eper.webp" 
                         alt="Tentang ePerpus" class="img-fluid" style="max-width: 90%;">
                </div>
                <div class="col-lg-6">
                    <h2 class="fw-bold text-primary mb-4">Tentang ePerpus</h2>
                    <p class="lead">Menghadirkan Perpustakaan Digital untuk Semua</p>
                    <p>
                        ePerpus adalah aplikasi perpustakaan digital yang dikembangkan sebagai bagian dari tugas besar mata kuliah 
                        Pemrograman Berorientasi Objek (PBO). Fokus utama kami adalah 
                        menerapkan prinsip-prinsip fundamental OOP seperti <em>Encapsulation, 
                            Inheritance, Abstraction,</em> dan <em>Polymorphism</em> dalam solusi dunia nyata.
                    </p>
                    <p>
                        Melalui sistem ini, kami berusaha menciptakan manajemen database buku 
                        yang terstruktur, efisien, dan memiliki skalabilitas kode yang baik.
                    </p>
                    <p>
                        ePerpus dirancang untuk memudahkan pengelolaan perpustakaan modern, memberikan akses 
                        mudah kepada anggota untuk menjelajahi koleksi buku, dan menyederhanakan proses peminjaman 
                        dan pengembalian buku digital.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section id="visi-misi" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Visi & Misi</h2>
                <p class="text-muted">Arah dan tujuan kami dalam mengembangkan ePerpus</p>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="vision-mission-box h-100">
                        <div class="text-center">
                            <i class="bi bi-eye-fill vision-mission-icon"></i>
                            <h3 class="fw-bold mb-3">Visi</h3>
                        </div>
                        <p>
                            Menjadi solusi perpustakaan digital terdepan yang menghubungkan 
                            pembaca dengan pengetahuan tanpa batasan ruang dan waktu, serta 
                            mendukung transformasi digital di bidang pendidikan dan literasi.
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="vision-mission-box h-100">
                        <div class="text-center">
                            <i class="bi bi-bullseye vision-mission-icon"></i>
                            <h3 class="fw-bold mb-3">Misi</h3>
                        </div>
                        <ul>
                            <li>Menyediakan platform perpustakaan digital yang mudah diakses</li>
                            <li>Meningkatkan minat baca masyarakat melalui teknologi</li>
                            <li>Mendukung institusi pendidikan dalam manajemen perpustakaan</li>
                            <li>Menerapkan prinsip-prinsip pemrograman berorientasi objek</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="tim-pengembang" class="py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Tim Pengembang</h2>
                <p class="text-muted">Orang-orang di balik pengembangan ePerpus</p>
            </div>
            
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="card team-member shadow-sm h-100">
                        <img src="images/kelompok.jpeg" class="card-img-top" alt="Autumm Zebtotanel">
                        <div class="card-body text-center">
                            <h5 class="card-title">Autumm Zebtotanel</h5>
                            <p class="text-muted">Project Leader</p>
                            <p class="small">0110224058</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="text-primary"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-github"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card team-member shadow-sm h-100">
                        <img src="images/kelompok.jpeg" class="card-img-top" alt="Revani">
                        <div class="card-body text-center">
                            <h5 class="card-title">Revani</h5>
                            <p class="text-muted">UI/UX Designer</p>
                            <p class="small">0110224111</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="text-primary"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-github"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card team-member shadow-sm h-100">
                        <img src="images/kelompok.jpeg" class="card-img-top" alt="Rian Akhlul Fadli">
                        <div class="card-body text-center">
                            <h5 class="card-title">Rian Akhlul Fadli</h5>
                            <p class="text-muted">Backend Developer</p>
                            <p class="small">0110224211</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="text-primary"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-github"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card team-member shadow-sm h-100">
                        <img src="images/kelompok.jpeg" class="card-img-top" alt="Asep Saepudin">
                        <div class="card-body text-center">
                            <h5 class="card-title">Asep Saepudin</h5>
                            <p class="text-muted">Database Administrator</p>
                            <p class="small">0110224207</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="text-primary"><i class="bi bi-linkedin"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-github"></i></a>
                                <a href="#" class="text-primary"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="text-center mt-5">
                <p class="text-muted"><em><strong>Program Studi Teknik Informatika</strong> - 2024</em></p>
            </div>
        </div>
    </section>

    <section id="perjalanan-proyek" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Perjalanan Proyek</h2>
                <p class="text-muted">Milestone penting dalam pengembangan ePerpus</p>
            </div>
            
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h5>Perencanaan Konsep</h5>
                        <p class="text-muted">November 2025</p>
                        <p>Brainstorming ide dan perencanaan awal arsitektur sistem perpustakaan digital.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h5>Desain UI/UX</h5>
                        <p class="text-muted">Desember 2025</p>
                        <p>Pembuatan desain antarmuka pengguna yang intuitif dan menarik.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h5>Pengembangan Backend</h5>
                        <p class="text-muted">Januari 2026</p>
                        <p>Implementasi logika bisnis dan koneksi database dengan Java dan PostgreSQL.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h5>Integrasi & Testing</h5>
                        <p class="text-muted">Februari 2026</p>
                        <p>Integrasi frontend-backend dan pengujian menyeluruh sistem.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h5>Launch & Deployment</h5>
                        <p class="text-muted">Maret 2026</p>
                        <p>Perilisan resmi ePerpus dan deployment ke server produksi.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="teknologi" class="py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Teknologi yang Digunakan</h2>
                <p class="text-muted">Stack teknologi modern untuk pengembangan ePerpus</p>
            </div>
            
            <div class="row g-4">
                <div class="col-md-3 text-center">
                    <div class="p-4">
                        <i class="bi bi-filetype-java display-4 text-primary mb-3"></i>
                        <h5>Java</h5>
                        <p class="text-muted">Bahasa pemrograman utama untuk backend</p>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="p-4">
                        <i class="bi bi-database display-4 text-primary mb-3"></i>
                        <h5>PostgreSQL</h5>
                        <p class="text-muted">Sistem manajemen database relasional</p>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="p-4">
                        <i class="bi bi-bootstrap display-4 text-primary mb-3"></i>
                        <h5>Bootstrap</h5>
                        <p class="text-muted">Framework CSS untuk desain responsif</p>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="p-4">
                        <i class="bi bi-server display-4 text-primary mb-3"></i>
                        <h5>Apache Tomcat</h5>
                        <p class="text-muted">Server aplikasi Java</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Pencapaian Kami</h2>
                <p class="text-muted">Statistik penting tentang ePerpus</p>
            </div>
            
            <div class="row g-3">
                <div class="col-sm-4 text-center">
                    <div class="stat-box">
                        <h3 class="fw-bold text-primary display-4">10K+</h3>
                        <p class="text-muted">Koleksi Buku</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center">
                    <div class="stat-box">
                        <h3 class="fw-bold text-primary display-4">5K+</h3>
                        <p class="text-muted">Anggota Aktif</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center">
                    <div class="stat-box">
                        <h3 class="fw-bold text-primary display-4">24/7</h3>
                        <p class="text-muted">Layanan Akses</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>