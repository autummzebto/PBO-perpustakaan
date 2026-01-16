--
-- PostgreSQL database dump
--

\restrict 7OOPRyVn5N2eLlXCN8bb7WCaG7rWZhH4DTeb1wMAIa4eZHd3PxVbO5XGfTmrMUu

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-16 16:40:50 WIB

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
    gambar character varying(255) DEFAULT 'no-image.jpg'::character varying,
    id_kategori integer
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
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_id_buku_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buku_id_buku_seq OWNED BY public.buku.id_buku;


--
-- TOC entry 228 (class 1259 OID 16498)
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id_kategori integer NOT NULL,
    nama_kategori character varying(100) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16497)
-- Name: kategori_id_kategori_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_id_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kategori_id_kategori_seq OWNER TO postgres;

--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 227
-- Name: kategori_id_kategori_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_id_kategori_seq OWNED BY public.kategori.id_kategori;


--
-- TOC entry 222 (class 1259 OID 16430)
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
-- TOC entry 221 (class 1259 OID 16429)
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
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 221
-- Name: peminjaman_id_pinjam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peminjaman_id_pinjam_seq OWNED BY public.peminjaman.id_pinjam;


--
-- TOC entry 224 (class 1259 OID 16453)
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
-- TOC entry 223 (class 1259 OID 16452)
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
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 223
-- Name: ulasan_id_ulasan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ulasan_id_ulasan_seq OWNED BY public.ulasan.id_ulasan;


--
-- TOC entry 226 (class 1259 OID 16474)
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
-- TOC entry 225 (class 1259 OID 16473)
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
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 3690 (class 2604 OID 16389)
-- Name: buku id_buku; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku ALTER COLUMN id_buku SET DEFAULT nextval('public.buku_id_buku_seq'::regclass);


--
-- TOC entry 3699 (class 2604 OID 16501)
-- Name: kategori id_kategori; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN id_kategori SET DEFAULT nextval('public.kategori_id_kategori_seq'::regclass);


--
-- TOC entry 3693 (class 2604 OID 16433)
-- Name: peminjaman id_pinjam; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman ALTER COLUMN id_pinjam SET DEFAULT nextval('public.peminjaman_id_pinjam_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 16456)
-- Name: ulasan id_ulasan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan ALTER COLUMN id_ulasan SET DEFAULT nextval('public.ulasan_id_ulasan_seq'::regclass);


--
-- TOC entry 3697 (class 2604 OID 16477)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 3865 (class 0 OID 16386)
-- Dependencies: 220
-- Data for Name: buku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku (id_buku, judul_buku, pengarang, penerbit, tahun_terbit, stok, gambar, id_kategori) FROM stdin;
15	Design Pattern Java	Gang of Four	Addison Wesley	1994	1	dp.webp	1
12	Pemrograman Web JSP	Eko Kurniawan	Elex Media	2020	1	jsp.jpg	1
5	Seporsi Mie Ayam Sebelum Mati	Brian Khrisna	GagasMedia	2024	1	mi.jpg	1
19	Laut Bercerita	Leila S. Chudori	Kepustakaan Populer Gramedia (KPG) 	2017	9	lb.jpeg	1
20	Filosofi Teras: Hidup Bahagia ala Stoikisme 	Henry Manampiring 	Kompas 	2019	8	teras.jpeg	1
21	Atomic Habits (Kebiasaan Kecil, Dampak Besar) 	James Clear 	Gramedia Pustaka Utama (GPU) 	2019	3	atm.jpeg	1
22	Nanti Kita Cerita tentang Hari Ini (NKCTHI) 	Marchella FP 	Kepustakaan Populer Gramedia (KPG) 	2018	4	nktci.jpeg	1
23	Bumi	Tere Liye 	Gramedia Pustaka Utama (GPU) 	2014	7	bumi.jpeg	1
24	Anjing Mengeong, Kucing Menggonggong 	Eka Kurniawan 	Gramedia Pustaka Utama (GPU) 	2024	5	ajg.jpeg	1
25	Tanpa Rencana 	Dee Lestari 	Bentang Pustaka 	2024	4	rencana.jpeg	1
26	Timun Jelita 	Raditya Dika 	GagasMedia 	2024	9	timun.jpeg	1
28	Dongeng Kucing 	Boy Candra 	Bukune	2024	5	kucing.jpeg	1
29	Perkumpulan Anak Luar Nikah 	Grace Tioso 	Gramedia Pustaka Utama (GPU) 	2023	9	nikah.jpeg	1
31	Laut Tengah 	Berliana Kimberly 	Coconut Books/Bintang Media 	2022	8	lt.jpeg	1
33	Kamu Terlalu Banyak Bercanda (KTBB) 	Marchella FP 	Kepustakaan Populer Gramedia (KPG) 	2019	8	canda.jpeg	1
34	Dune	Frank Herbert 	Gramedia Pustaka Utama (GPU) 	2021	4	dune.jpeg	1
35	CICA	Cynththa Hariadi 	Bentang Pustaka 	2024	8	cica.jpeg	1
36	White Nights 	F. Dostoevsky 	Gramedia Pustaka Utama (GPU) 	2020	1	wn.jpeg	1
37	Geez & Ann	Rizki Nurhidayah	GagasMedia	2017	10	gezz.jpeg	1
30	The Things You Can See Without Looking 	Jenny Lawson 	Gramedia Pustaka Utama (GPU) 	2024	11	jny.jpeg	1
27	Seorang Pria yang Melalui Duka dengan Mencuci Piring 	dr. Andreas Kurniawan, Sp.KJ 	Gramedia Pustaka Utama (GPU) 	2024	6	pria.jpeg	1
32	The Alchemist 25th Anniversary	Paulo Coelho 	Gramedia Pustaka Utama (GPU) 	2018	3	paulo.jpeg	1
17	Laravel 10 Masterclass	Taylor Otwell	Laravel LLC	2023	6	lrv.jpg	1
16	ReactJS Frontend Modern	Sandhika Galih	Web Unpas	2024	7	rjs.jpg	1
13	Machine Learning Python	Andrew Ng	DeepLearning AI	2023	4	mlp.jpg	1
10	PostgreSQL untuk Pemula	Abdul Kadir	Andi Offset	2024	10	psql.jpg	1
11	Sistem Basis Data	Fathansyah	Informatika	2021	2	bd.jpg	1
9	Algoritma Pemrograman	Rinaldi Munir	Informatika	2022	3	ap.jpg	1
8	Belajar Java Dasar	Budi Raharjo	Informatika	2023	5	bjav.jpg	1
18	LaskarPelangi	Andrea Hirata 	Bentang Pustaka	2005	10	lp.jpg	1
14	Clean Code	Robert C Martin	Prentice Hall	2008	2	cc.jpeg	1
3	Harry Potter	J.K Rowling	autum	2025	1	hp.jpg	1
\.


--
-- TOC entry 3873 (class 0 OID 16498)
-- Dependencies: 228
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori (id_kategori, nama_kategori) FROM stdin;
1	Novel
2	Sains
3	Komputer
4	Sejarah
\.


--
-- TOC entry 3867 (class 0 OID 16430)
-- Dependencies: 222
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
32	3	3	2026-01-16	2026-01-16	kembali
\.


--
-- TOC entry 3869 (class 0 OID 16453)
-- Dependencies: 224
-- Data for Name: ulasan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ulasan (id_ulasan, id_buku, id_anggota, isi_komentar, rating, tanggal_ulasan) FROM stdin;
1	8	1	mudah dipahami	4	2025-12-11
2	3	1	aku udah baca berkali kali seru banget, filmnya juga udah aku tonton semuaa... rekomennn	5	2025-12-11
6	5	3	bagus banget sih ini bukunya	5	2026-01-15
8	3	5	baca buku ini karna suka filmnya	5	2026-01-15
9	5	5	bukunya stok dikit saya mau pinjam habis	3	2026-01-15
11	18	5	bukunya sangat menarik untuk dibaca	5	2026-01-16
\.


--
-- TOC entry 3871 (class 0 OID 16474)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, username, password, nama_lengkap, level) FROM stdin;
1	admin	admin123	Autumm Admin	admin
3	revani	123	Revani	anggota
5	rian	123	Rian Akhlul Fadli	anggota
\.


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_id_buku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_id_buku_seq', 39, true);


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 227
-- Name: kategori_id_kategori_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_id_kategori_seq', 4, true);


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 221
-- Name: peminjaman_id_pinjam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peminjaman_id_pinjam_seq', 35, true);


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 223
-- Name: ulasan_id_ulasan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ulasan_id_ulasan_seq', 11, true);


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 8, true);


--
-- TOC entry 3701 (class 2606 OID 16392)
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- TOC entry 3711 (class 2606 OID 16505)
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id_kategori);


--
-- TOC entry 3703 (class 2606 OID 16437)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id_pinjam);


--
-- TOC entry 3705 (class 2606 OID 16462)
-- Name: ulasan ulasan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_pkey PRIMARY KEY (id_ulasan);


--
-- TOC entry 3707 (class 2606 OID 16483)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3709 (class 2606 OID 16485)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3712 (class 2606 OID 16506)
-- Name: buku buku_id_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_id_kategori_fkey FOREIGN KEY (id_kategori) REFERENCES public.kategori(id_kategori);


--
-- TOC entry 3713 (class 2606 OID 16438)
-- Name: peminjaman peminjaman_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 3714 (class 2606 OID 16492)
-- Name: peminjaman peminjaman_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_user_fkey FOREIGN KEY (id_anggota) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 3715 (class 2606 OID 16463)
-- Name: ulasan ulasan_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 3716 (class 2606 OID 16486)
-- Name: ulasan ulasan_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_id_user_fkey FOREIGN KEY (id_anggota) REFERENCES public.users(id_user) ON DELETE CASCADE;


-- Completed on 2026-01-16 16:40:50 WIB

--
-- PostgreSQL database dump complete
--

\unrestrict 7OOPRyVn5N2eLlXCN8bb7WCaG7rWZhH4DTeb1wMAIa4eZHd3PxVbO5XGfTmrMUu

