--
-- PostgreSQL database dump
--

\restrict nmXBIgwRkx1zyQcmA3Z1ZSSOgZdI91je9WOwjF1d3gBFpwqOa3bRjR2R9CL1tqg

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-16 14:01:28 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16409)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(50),
    password character varying(50)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16408)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO postgres;

--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 224 (class 1259 OID 16417)
-- Name: anggota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anggota (
    id_anggota integer NOT NULL,
    nama_lengkap character varying(100),
    username character varying(50),
    password character varying(50),
    alamat text
);


ALTER TABLE public.anggota OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16416)
-- Name: anggota_id_anggota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.anggota_id_anggota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.anggota_id_anggota_seq OWNER TO postgres;

--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 223
-- Name: anggota_id_anggota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.anggota_id_anggota_seq OWNED BY public.anggota.id_anggota;


--
-- TOC entry 220 (class 1259 OID 16386)
-- Name: buku; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku (
    id_buku integer NOT NULL,
    judul_buku character varying(100),
    pengarang character varying(100),
    penerbit character varying(50),
    tahun_terbit integer,
    stok integer DEFAULT 0,
    gambar character varying(255) DEFAULT 'no-image.jpg'::character varying
);


ALTER TABLE public.buku OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16385)
-- Name: buku_id_buku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buku_id_buku_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buku_id_buku_seq OWNER TO postgres;

--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_id_buku_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buku_id_buku_seq OWNED BY public.buku.id_buku;


--
-- TOC entry 226 (class 1259 OID 16430)
-- Name: peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peminjaman (
    id_pinjam integer NOT NULL,
    id_buku integer,
    id_anggota integer,
    tanggal_pinjam date,
    tanggal_kembali date,
    status character varying(20) DEFAULT 'dipinjam'::character varying
);


ALTER TABLE public.peminjaman OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16429)
-- Name: peminjaman_id_pinjam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peminjaman_id_pinjam_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peminjaman_id_pinjam_seq OWNER TO postgres;

--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 225
-- Name: peminjaman_id_pinjam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peminjaman_id_pinjam_seq OWNED BY public.peminjaman.id_pinjam;


--
-- TOC entry 228 (class 1259 OID 16453)
-- Name: ulasan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulasan (
    id_ulasan integer NOT NULL,
    id_buku integer,
    id_anggota integer,
    isi_komentar text,
    rating integer,
    tanggal_ulasan date DEFAULT CURRENT_DATE
);


ALTER TABLE public.ulasan OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16452)
-- Name: ulasan_id_ulasan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ulasan_id_ulasan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ulasan_id_ulasan_seq OWNER TO postgres;

--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 227
-- Name: ulasan_id_ulasan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ulasan_id_ulasan_seq OWNED BY public.ulasan.id_ulasan;


--
-- TOC entry 230 (class 1259 OID 16474)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    nama_lengkap character varying(100),
    level character varying(20) DEFAULT 'anggota'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16473)
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_user_seq OWNER TO postgres;

--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 3698 (class 2604 OID 16412)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 3699 (class 2604 OID 16420)
-- Name: anggota id_anggota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota ALTER COLUMN id_anggota SET DEFAULT nextval('public.anggota_id_anggota_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 16389)
-- Name: buku id_buku; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku ALTER COLUMN id_buku SET DEFAULT nextval('public.buku_id_buku_seq'::regclass);


--
-- TOC entry 3700 (class 2604 OID 16433)
-- Name: peminjaman id_pinjam; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman ALTER COLUMN id_pinjam SET DEFAULT nextval('public.peminjaman_id_pinjam_seq'::regclass);


--
-- TOC entry 3702 (class 2604 OID 16456)
-- Name: ulasan id_ulasan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan ALTER COLUMN id_ulasan SET DEFAULT nextval('public.ulasan_id_ulasan_seq'::regclass);


--
-- TOC entry 3704 (class 2604 OID 16477)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 3876 (class 0 OID 16409)
-- Dependencies: 222
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, username, password) FROM stdin;
1	admin	admin123
\.


--
-- TOC entry 3878 (class 0 OID 16417)
-- Dependencies: 224
-- Data for Name: anggota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.anggota (id_anggota, nama_lengkap, username, password, alamat) FROM stdin;
1	Budi Santoso	budi	123	Jl. Margonda Raya
\.


--
-- TOC entry 3874 (class 0 OID 16386)
-- Dependencies: 220
-- Data for Name: buku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku (id_buku, judul_buku, pengarang, penerbit, tahun_terbit, stok, gambar) FROM stdin;
15	Design Pattern Java	Gang of Four	Addison Wesley	1994	1	dp.webp
12	Pemrograman Web JSP	Eko Kurniawan	Elex Media	2020	1	jsp.jpg
19	Laut Bercerita	Leila S. Chudori	Kepustakaan Populer Gramedia (KPG) 	2017	9	lb.jpeg
20	Filosofi Teras: Hidup Bahagia ala Stoikisme 	Henry Manampiring 	Kompas 	2019	8	teras.jpeg
21	Atomic Habits (Kebiasaan Kecil, Dampak Besar) 	James Clear 	Gramedia Pustaka Utama (GPU) 	2019	3	atm.jpeg
22	Nanti Kita Cerita tentang Hari Ini (NKCTHI) 	Marchella FP 	Kepustakaan Populer Gramedia (KPG) 	2018	4	nktci.jpeg
23	Bumi	Tere Liye 	Gramedia Pustaka Utama (GPU) 	2014	7	bumi.jpeg
24	Anjing Mengeong, Kucing Menggonggong 	Eka Kurniawan 	Gramedia Pustaka Utama (GPU) 	2024	5	ajg.jpeg
25	Tanpa Rencana 	Dee Lestari 	Bentang Pustaka 	2024	4	rencana.jpeg
26	Timun Jelita 	Raditya Dika 	GagasMedia 	2024	9	timun.jpeg
28	Dongeng Kucing 	Boy Candra 	Bukune	2024	5	kucing.jpeg
29	Perkumpulan Anak Luar Nikah 	Grace Tioso 	Gramedia Pustaka Utama (GPU) 	2023	9	nikah.jpeg
31	Laut Tengah 	Berliana Kimberly 	Coconut Books/Bintang Media 	2022	8	lt.jpeg
33	Kamu Terlalu Banyak Bercanda (KTBB) 	Marchella FP 	Kepustakaan Populer Gramedia (KPG) 	2019	8	canda.jpeg
34	Dune	Frank Herbert 	Gramedia Pustaka Utama (GPU) 	2021	4	dune.jpeg
35	CICA	Cynththa Hariadi 	Bentang Pustaka 	2024	8	cica.jpeg
18	LaskarPelangi	Andrea Hirata 	Bentang Pustaka	2005	10	lp.jpg
36	White Nights 	F. Dostoevsky 	Gramedia Pustaka Utama (GPU) 	2020	1	wn.jpeg
37	Geez & Ann	Rizki Nurhidayah	GagasMedia	2017	10	gezz.jpeg
30	The Things You Can See Without Looking 	Jenny Lawson 	Gramedia Pustaka Utama (GPU) 	2024	11	jny.jpeg
27	Seorang Pria yang Melalui Duka dengan Mencuci Piring 	dr. Andreas Kurniawan, Sp.KJ 	Gramedia Pustaka Utama (GPU) 	2024	6	pria.jpeg
32	The Alchemist 25th Anniversary	Paulo Coelho 	Gramedia Pustaka Utama (GPU) 	2018	3	paulo.jpeg
17	Laravel 10 Masterclass	Taylor Otwell	Laravel LLC	2023	6	lrv.jpg
16	ReactJS Frontend Modern	Sandhika Galih	Web Unpas	2024	7	rjs.jpg
13	Machine Learning Python	Andrew Ng	DeepLearning AI	2023	4	mlp.jpg
10	PostgreSQL untuk Pemula	Abdul Kadir	Andi Offset	2024	10	psql.jpg
11	Sistem Basis Data	Fathansyah	Informatika	2021	2	bd.jpg
9	Algoritma Pemrograman	Rinaldi Munir	Informatika	2022	3	ap.jpg
8	Belajar Java Dasar	Budi Raharjo	Informatika	2023	5	bjav.jpg
14	Clean Code	Robert C Martin	Prentice Hall	2008	2	cc.jpeg
3	Harry Potter	J.K Rowling	autum	2025	1	hp.jpg
5	Seporsi Mie Ayam Sebelum Mati	Brian Khrisna	GagasMedia	2024	1	mi.jpg
\.


--
-- TOC entry 3880 (class 0 OID 16430)
-- Dependencies: 226
-- Data for Name: peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peminjaman (id_pinjam, id_buku, id_anggota, tanggal_pinjam, tanggal_kembali, status) FROM stdin;
2	3	1	2025-12-05	2025-12-05	kembali
4	12	1	2025-12-05	2025-12-05	kembali
3	3	1	2025-12-05	2025-12-05	kembali
8	12	1	2025-12-05	2025-12-05	kembali
7	15	1	2025-12-05	2025-12-05	kembali
6	3	1	2025-12-05	2025-12-05	kembali
5	16	1	2025-12-05	2025-12-05	kembali
9	15	1	2025-12-05	2025-12-05	kembali
10	3	1	2025-12-05	2025-12-05	kembali
11	3	1	2025-12-05	2025-12-05	kembali
12	3	1	2025-12-08	2025-12-08	kembali
13	3	1	2025-12-11	2025-12-11	kembali
14	3	1	2025-12-11	2025-12-11	kembali
15	3	1	2025-12-11	2025-12-11	kembali
16	8	1	2025-12-11	2025-12-11	kembali
17	18	1	2025-12-11	2025-12-11	kembali
18	3	1	2025-12-11	2025-12-11	kembali
19	3	1	2025-12-11	2025-12-11	kembali
20	3	1	2025-12-11	2025-12-11	kembali
21	3	1	2025-12-11	2025-12-11	kembali
22	3	1	2025-12-11	2025-12-11	kembali
23	3	1	2025-12-11	2025-12-11	kembali
24	3	1	2026-01-06	2026-01-14	kembali
25	5	1	2026-01-14	2026-01-14	kembali
\.


--
-- TOC entry 3882 (class 0 OID 16453)
-- Dependencies: 228
-- Data for Name: ulasan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ulasan (id_ulasan, id_buku, id_anggota, isi_komentar, rating, tanggal_ulasan) FROM stdin;
1	8	1	mudah dipahami	4	2025-12-11
2	3	1	aku udah baca berkali kali seru banget, filmnya juga udah aku tonton semuaa... rekomennn	5	2025-12-11
6	5	3	bagus banget sih ini bukunya	5	2026-01-15
7	5	4	harus baca buku ini kalian	5	2026-01-15
8	3	5	baca buku ini karna suka filmnya	5	2026-01-15
9	5	5	bukunya stok dikit saya mau pinjam habis	3	2026-01-15
10	18	4	asikk bangettt ini buku aseli	4	2026-01-15
11	18	5	bukunya sangat menarik untuk dibaca	5	2026-01-16
\.


--
-- TOC entry 3884 (class 0 OID 16474)
-- Dependencies: 230
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, username, password, nama_lengkap, level) FROM stdin;
1	admin	admin123	Autumm Admin	admin
3	revani	123	Revani	anggota
4	Asep	123	Asep Saepudin	anggota
5	rian	123	Rian Akhlul Fadli	anggota
7	budi	123	Budi Santoso	anggota
\.


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, true);


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 223
-- Name: anggota_id_anggota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anggota_id_anggota_seq', 1, true);


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_id_buku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_id_buku_seq', 37, true);


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 225
-- Name: peminjaman_id_pinjam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peminjaman_id_pinjam_seq', 25, true);


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 227
-- Name: ulasan_id_ulasan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ulasan_id_ulasan_seq', 11, true);


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 7, true);


--
-- TOC entry 3709 (class 2606 OID 16415)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 3711 (class 2606 OID 16425)
-- Name: anggota anggota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota
    ADD CONSTRAINT anggota_pkey PRIMARY KEY (id_anggota);


--
-- TOC entry 3713 (class 2606 OID 16427)
-- Name: anggota anggota_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota
    ADD CONSTRAINT anggota_username_key UNIQUE (username);


--
-- TOC entry 3707 (class 2606 OID 16392)
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- TOC entry 3715 (class 2606 OID 16437)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id_pinjam);


--
-- TOC entry 3717 (class 2606 OID 16462)
-- Name: ulasan ulasan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_pkey PRIMARY KEY (id_ulasan);


--
-- TOC entry 3719 (class 2606 OID 16483)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3721 (class 2606 OID 16485)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3722 (class 2606 OID 16443)
-- Name: peminjaman peminjaman_id_anggota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_anggota_fkey FOREIGN KEY (id_anggota) REFERENCES public.anggota(id_anggota) ON DELETE CASCADE;


--
-- TOC entry 3723 (class 2606 OID 16438)
-- Name: peminjaman peminjaman_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 3724 (class 2606 OID 16463)
-- Name: ulasan ulasan_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 3725 (class 2606 OID 16486)
-- Name: ulasan ulasan_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_id_user_fkey FOREIGN KEY (id_anggota) REFERENCES public.users(id_user) ON DELETE CASCADE;


-- Completed on 2026-01-16 14:01:28 WIB

--
-- PostgreSQL database dump complete
--

\unrestrict nmXBIgwRkx1zyQcmA3Z1ZSSOgZdI91je9WOwjF1d3gBFpwqOa3bRjR2R9CL1tqg

