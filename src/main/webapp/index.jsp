<%-- 
    Document   : index
    Created on : 11 Dec 2025, 14.18.09
    Author     : autummzebtotanel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <link rel="icon" type="image/jpg" href="images/favicon.png">
    <title>ePerpus - Perpustakaan Digital</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    
    <link href="css/style.css" rel="stylesheet">
    
    <style>
        .accordion-button:not(.collapsed) {
            background-color: #e7f1ff;
            color: #0c63e4;
            box-shadow: inset 0 -1px 0 rgba(0,0,0,.125);
        }
        .accordion-button:focus {
            box-shadow: none;
            border-color: rgba(0,0,0,.125);
        }

        .footer-custom {
            background-color: #1a1d20;
            color: #dee2e6;
            padding-top: 50px;
        }
        .footer-title {
            color: #ffffff;
            font-weight: 600;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        .footer-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 3px;
            background-color: #0d6efd;
        }
        .footer-link {
            color: #adb5bd;
            text-decoration: none;
            transition: 0.3s;
        }
        .footer-link:hover {
            color: #0d6efd;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="bi bi-book-half text-primary"></i> ePerpus
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#fitur">Fitur</a></li>
                    <li class="nav-item"><a class="nav-link" href="#manfaat">Manfaat</a></li>
                    <li class="nav-item"><a class="nav-link" href="tentang.jsp">Tentang Kami</a></li>
                    <li class="nav-item"><a class="nav-link" href="galeri.jsp">Galeri</a></li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="https://docs.google.com/forms/d/e/1FAIpQLSfNYm6wmOcXNBQu2qZupgnaaVv4ABxbxrnkR8b2dwIM_U34Jg/viewform" target="_blank">Hubungi Kami</a>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="#faq">FAQ</a></li>
                    
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

    <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/img1.jpg" class="d-block w-100" alt="Slide 1">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="hero-title">Perpustakaan dalam Genggaman</h1>
                    <p class="hero-desc">Nikmati kemudahan meminjam ribuan buku digital kapan saja dan di mana saja.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/img2.jpeg" class="d-block w-100" alt="Slide 2">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="hero-title">Koleksi Terlengkap</h1>
                    <p class="hero-desc">Mulai dari novel, buku pelajaran, hingga jurnal ilmiah tersedia lengkap.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/img3.jpg" class="d-block w-100" alt="Slide 3">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="hero-title">Akses Cepat & Mudah</h1>
                    <p class="hero-desc">Tidak perlu antre. Cukup login, pilih buku, dan pinjam dalam hitungan detik.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>

    <section id="fitur" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Kenapa Memilih ePerpus?</h2>
                <p class="text-muted">Fitur unggulan yang kami tawarkan untuk pengalaman membaca terbaik.</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-box bg-white shadow-sm h-100">
                        <div class="icon-circle"><i class="bi bi-journal-richtext"></i></div>
                        <h4>Koleksi Digital</h4>
                        <p class="text-muted">Akses ribuan buku digital dari berbagai kategori tanpa batasan ruang dan waktu.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box bg-white shadow-sm h-100">
                        <div class="icon-circle"><i class="bi bi-phone"></i></div>
                        <h4>Fitur Membaca Lengkap</h4>
                        <p class="text-muted">Mode membaca yang nyaman, pencarian kata kunci, dan penanda halaman.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box bg-white shadow-sm h-100">
                        <div class="icon-circle"><i class="bi bi-clock-history"></i></div>
                        <h4>24/7 Layanan</h4>
                        <p class="text-muted">Perpustakaan tidak pernah tutup. Akses kapan saja.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="manfaat" class="py-5 bg-white">
        <div class="container py-4">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0 text-center">
                    <img src="images/eper.webp" 
                         alt="Manfaat ePerpus" class="img-fluid" style="max-width: 90%;">
                </div>
                <div class="col-lg-6">
                    <h2 class="fw-bold text-primary mb-4">Manfaat ePerpus</h2>
                    <div class="manfaat-item">
                        <i class="bi bi-collection-fill manfaat-icon"></i>
                        <div><h5 class="fw-bold mb-1">Koleksi Lengkap</h5><p class="text-muted">Tersedia ribuan buku, majalah, dan koran dari penerbit terkemuka.</p></div>
                    </div>
                    <div class="manfaat-item">
                        <i class="bi bi-laptop-fill manfaat-icon"></i>
                        <div><h5 class="fw-bold mb-1">Media Pembelajaran</h5><p class="text-muted">Menjadi solusi media pembelajaran jarak jauh yang fleksibel.</p></div>
                    </div>
                    <div class="manfaat-item">
                        <i class="bi bi-award-fill manfaat-icon"></i>
                        <div><h5 class="fw-bold mb-1">Meningkatkan Akreditasi</h5><p class="text-muted">Meningkatkan poin akreditasi bagi sekolah dan universitas.</p></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="about" class="py-5" style="background-color: #f0f8ff;">
        <div class="container py-4">
            <div class="row align-items-center">
                <div class="col-lg-6 order-2 order-lg-1">
                    <h2 class="fw-bold text-primary mb-3">Tentang ePerpus</h2>
                    <p class="lead text-dark">Solusi Literasi Digital Masa Depan</p>
                    <p>
                        Website ini dikembangkan sebagai bagian dari tugas besar mata kuliah 
                        Pemrograman Berorientasi Objek (PBO). Fokus utama kami adalah 
                        menerapkan prinsip-prinsip fundamental OOP seperti <em>Encapsulation, 
                            Inheritance, Abstraction,</em> dan <em>Polymorphism</em> dalam solusi dunia nyata.
                    </p>
                    <p>
                        Melalui sistem ini, kami berusaha menciptakan manajemen database buku 
                        yang terstruktur, efisien, dan memiliki skalabilitas kode yang baik.
                    </p>

                    <h3>Tim Pengembang</h3>
                    <ul>
                        <li><strong>Autumm Zebtotanel</strong> (0110224058)</li>
                        <li><strong>Revani</strong> (0110224111)</li>
                        <li><strong>Rian Akhlul Fadli</strong> (0110224211)</li>
                        <li><strong>Asep Saepudin</strong> (0110224207)</li>
                    </ul>

                    <p><em><strong>Program Studi Teknik Informatika</strong> - 2024</em></p>
                    <div class="row g-3">
                        <div class="col-sm-4">
                            <div class="stat-box"><h3 class="fw-bold text-dark">10K+</h3><small class="text-muted">Koleksi Buku</small></div>
                        </div>
                        <div class="col-sm-4">
                            <div class="stat-box"><h3 class="fw-bold text-dark">5K+</h3><small class="text-muted">Anggota Aktif</small></div>
                        </div>
                        <div class="col-sm-4">
                            <div class="stat-box"><h3 class="fw-bold text-dark">24/7</h3><small class="text-muted">Layanan Akses</small></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2 mb-4 mb-lg-0 text-center">
                    <img src="images/kelompok.jpeg" 
                         alt="Tentang Kami" class="img-fluid about-img">
                </div>
            </div>
        </div>
    </section>

    <section id="faq" class="py-5 bg-white">
        <div class="container py-4">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary">Pertanyaan Umum (FAQ)</h2>
                <p class="text-muted">Jawaban untuk pertanyaan yang sering diajukan.</p>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="accordion" id="accordionFAQ">
                        
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <strong>Apa itu ePerpus?</strong>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    ePerpus adalah aplikasi perpustakaan digital yang memberikan akses kepada penggunanya untuk menjadi pengelola dan anggota perpustakaan. Bekerja sama dengan ratusan penerbit ternama, ePerpus menyediakan ribuan koleksi bacaan digital berupa buku, majalah, dan koran.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <strong>Bagaimana cara meminjam bacaan di ePerpus?</strong>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Anggota perpustakaan dapat meminjam secara online melalui website ini atau aplikasi mobile. Cukup login, pilih buku yang diinginkan, dan klik tombol "Pinjam". Buku akan otomatis masuk ke daftar pinjaman Anda.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <strong>Berapa lama batas waktu peminjaman?</strong>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Batas waktu peminjaman standar adalah 7 hari. Jika masa peminjaman habis, buku harus dikembalikan sebelum dapat meminjam buku lain. Anda dapat memperpanjang masa pinjam jika stok buku masih tersedia.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <strong>Siapa saja yang bisa menjadi pelanggan ePerpus?</strong>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Siapa saja bisa mendaftar! Baik itu institusi pendidikan (sekolah/kampus), perusahaan, maupun individu yang ingin mengakses ribuan koleksi buku berkualitas secara legal dan mudah.
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer-custom">
        <div class="container">
            <div class="row g-4 mb-5">
                <div class="col-lg-4 col-md-6">
                    <div class="mb-3">
                        <i class="bi bi-book-half fs-3 text-primary"></i> <span class="fs-4 fw-bold ms-2 text-white">ePerpus</span>
                    </div>
                    <h5 class="footer-title">Jam Operasional Layanan</h5>
                    <p class="small mb-1"><i class="bi bi-calendar3 me-2"></i>Senin - Jumat: 08.00 - 19.00 WIB</p>
                    <p class="small mb-1"><i class="bi bi-calendar3 me-2"></i>Sabtu - Minggu: 09.00 - 15.30 WIB</p>
                    <p class="small text-danger mt-2">Cuti Bersama dan Libur Nasional <strong>Tutup</strong></p>
                    <div class="mt-4">
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2"><i class="bi bi-youtube"></i></a>
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2"><i class="bi bi-twitter-x"></i></a>
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle"><i class="bi bi-instagram"></i></a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <h5 class="footer-title">Layanan Digital</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#" class="footer-link small">Koleksi Buku Terpadu</a></li>
                        <li class="mb-2"><a href="#" class="footer-link small">E-Resources STT-NF</a></li>
                        <li class="mb-2"><a href="https://nurulfikri.ac.id" target="_blank" class="footer-link small">Portal nurulfikri.ac.id</a></li>
                        <li class="mb-2"><a href="#" class="footer-link small">Statistik Website</a></li>
                    </ul>
                    <h5 class="footer-title mt-4">Informasi Aplikasi</h5>
                    <p class="small mb-1"><strong>Dibuat:</strong> 16 Januari 2025</p>
                    <p class="small"><strong>Jenis:</strong> Universitas Swasta</p>
                </div>

                <div class="col-lg-4">
                    <h5 class="footer-title">Kontak Kami</h5>
                    <p class="small d-flex">
                        <i class="bi bi-geo-alt-fill me-3 text-primary"></i>
                        <span>Jalan Lenteng Agung Raya No.20 RT.5/RW.1, Srengseng Sawah, Kec. Jagakarsa, Jakarta Selatan, 12640</span>
                    </p>
                    <p class="small mb-2">
                        <i class="bi bi-telephone-fill me-3 text-primary"></i> (021) 7863191
                    </p>
                    <p class="small mb-2">
                        <i class="bi bi-envelope-fill me-3 text-primary"></i> info@nurulfikri.ac.id
                    </p>
                    <p class="small">
                        <i class="bi bi-globe me-3 text-primary"></i> DKI Jakarta, Indonesia
                    </p>
                </div>
            </div>
            <hr class="bg-secondary">
            <div class="row py-3">
                <div class="col-md-12 text-center">
                    <p class="text-white-50 small mb-0">&copy; 2026 ePerpus Digital Library - Kelompok PBO STT-NF. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>