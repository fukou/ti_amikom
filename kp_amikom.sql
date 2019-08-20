-- phpMyAdmin SQL Dump
<<<<<<< HEAD
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1


-- Waktu pembuatan: 09 Agu 2019 pada 08.18
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7
=======
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13 Agu 2019 pada 08.41
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 7.1.7
>>>>>>> Finishing the project (finally)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kp_amikom`
--

-- --------------------------------------------------------

--
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> Finishing the project (finally)
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< HEAD
----------------------------------------------------------

--
-- Struktur dari tabel `tb_hak_akses`

=======
-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hak_akses`
--

CREATE TABLE `tb_hak_akses` (
  `id_user` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
>>>>>>> Finishing the project (finally)
-- Dumping data untuk tabel `tb_hak_akses`
--

INSERT INTO `tb_hak_akses` (`id_user`, `status`) VALUES
(1, ' tidak aktif'),
(8, 'aktif'),
(9, 'aktif'),
(15, 'tidak aktif'),
(16, 'aktif'),
(23, 'aktif'),
(25, 'aktif'),
(26, 'aktif'),
(27, 'aktif'),
(28, 'aktif'),
(29, 'aktif'),
(30, 'aktif'),
(31, 'aktif'),
(32, 'aktif'),
(34, 'aktif'),
(35, 'aktif'),
(36, 'aktif'),
(37, 'aktif'),
(38, 'aktif'),
(39, 'aktif'),
(40, 'aktif'),
(41, 'aktif'),
(43, 'aktif'),
(44, 'aktif'),
(45, 'aktif'),
(46, 'aktif'),
(47, 'aktif'),
(48, 'aktif'),
(49, 'tidak aktif'),
(50, 'aktif'),
(51, 'aktif'),
(52, 'aktif'),
(57, 'aktif'),
(60, 'aktif'),
(61, 'aktif'),
(62, 'aktif'),
(63, 'aktif'),
(64, 'tidak aktif'),
(65, 'aktif'),
(66, 'aktif'),
(67, 'aktif'),
(69, 'aktif'),
(71, 'aktif'),
(72, 'tidak aktif'),
(74, 'aktif'),
<<<<<<< HEAD
(75, 'aktif');

-- Dumping data untuk tabel `tb_coba`
--

INSERT INTO `tb_coba` (`nama`, `nim`, `kelas`) VALUES
('A', '16.11.0137', 'SI18Z');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hak_akses`
--
-- Kesalahan membaca struktur untuk tabel kp_amikom.tb_hak_akses: #1034 - Index for table 'tb_hak_akses' is corrupt; try to repair it
-- Kesalahan membaca data untuk tabel kp_amikom.tb_hak_akses: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `kp_amikom`.`tb_hak_akses`' at line 1
=======
(75, 'aktif'),
(414, 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengumuman`
--

CREATE TABLE `tb_pengumuman` (
  `id` int(11) NOT NULL,
  `judul_pengumuman` varchar(100) NOT NULL,
  `isi_pengumuman` text NOT NULL,
  `tanggal` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengumuman`
--

INSERT INTO `tb_pengumuman` (`id`, `judul_pengumuman`, `isi_pengumuman`, `tanggal`, `id_user`) VALUES
(1, 'tet', 'sadasda', '2019-08-13', 2),
(2, 'tesss', 'asdasdasd', '2019-08-13', 64),
(3, 'tesss', 'asdasdasd', '2019-08-13', 67);
>>>>>>> Finishing the project (finally)

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_post`
--

CREATE TABLE `tb_post` (
  `id` int(30) NOT NULL,
  `title_post` varchar(350) NOT NULL,
  `body_post` text NOT NULL,
  `date` date NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `gambar` varchar(300) NOT NULL,
  `full_gambar` text NOT NULL,
  `type_gambar` text NOT NULL,
  `id_user` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_post`
--

INSERT INTO `tb_post` (`id`, `title_post`, `body_post`, `date`, `kategori`, `gambar`, `full_gambar`, `type_gambar`, `id_user`) VALUES
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> Finishing the project (finally)
(1032, 'STMIK Amikom Purwokerto Terima Kunjungan AKRB dan ABA Sinema Yogyakarta', '<p><strong>STMIK Amikom Purwokerto</strong>&nbsp;menerima kunjungan studi banding dari AKRB Yogyakarta dan ABA Sinema Yogyakarta, Sabtu (8/12/2018) kemarin. Kunjungan tersebut disambut hangat pihak STMIK Amikom Purwokerto.</p><p><br></p><p>Ketua STMIK Amikom Purwokerto, Dr Berlilana MKom MSi mengucapkan selamat datang kepada kedua kampus asal Yogyakarta tersebut. Ia menceritakan proses berdirinya kampus ungu yang dipimpinnya hingga menjadi seperti saat ini&nbsp;“STMIK Amikom Purwokerto ini dibangun tahun 2009. Saat ini, kampus ini sudah menjadi kampus ideal sejak dua tahun terakhir,” katanya.</p><p>Ia pun berharap, AKRB dan AKBA Sinema Yogyakarta pun akan menjadi kampus ideal. Semua hal kata dia,&nbsp;ada prosesnya.&nbsp;“Semoga setelah kunjungan ini, paling tidak ada inspirasi yang didapatkan. Dulu kampus kami juga kecil lebih kecil dari kampus AKRB dan AKBA Sinema Yogyakarta. Alhamdulillah, bisa bermetamorfosa seperti saat ini,” katanya.</p><p>Ia mengungkapkan, dulu kondisi STMIK Amikom Purwokerto hampir sama dengan AKRB dan AKBA Sinema Yogyakarta. Hanya persoalan semangat untuk berubah kata dia harus dimunculkan. Sehingga, perubahan menjadi sangat signifikan. “Kita juga kini tengah bersemangat untuk berubah menjadi universitas. Agar kita tidak hanya berhenti di titik ini saja. Tapi harus berkreativitas, berinovasi untuk memajukan lembaga,” kata dia.</p><p><br></p><p>Sementara itu, Direktur AKRB Yogyakarta, Arif Budiman SE MM mengatakan studi banding tersebut dengan niat silaturahmi. “Kami ingin sekali membawa energi positif yang bisa membawa kami berkembang seperti STMIK Amikom Purwokerto. Kami ingin&nbsp;<em>sinau bareng</em>. Banyak yang kami ingin tahu, mulai pengelolaan hingga tri dharma perguruan tinggi. Semoga bisa memberikan inspirasi dari sisi marketing, kemahasiswaan, dosen dan lainnya. Dan semoga teman-teman tidak hanya berhenti di kunjungan ini tapi juga tidak keberatan masih akan ada akses komunikasi ke depannya,” katanya.</p><p><br></p><p>Sementara itu, Ketua Yayasan STMIK Amikom Purwokerto dan AKRB dan AKBA Sinema Yogyakarta, Hari Purwidiantoro ST MM mengatakan, pihaknya berharap AKRB dan AKBA Sinema juga mulai meniru apa yang dilakukan STMIK Amikom Purwokerto. “Belajarlah, minta&nbsp;<em>kawruh</em>. STMIK Amikom Purwokerto tengah menuju universitas, syarat-syaratnya sudah memenuhi. Dan AKRB serta AKBA Sinema Yogyakarta juga mau melangkah menuju politeknik. Semoga ada banyak yang bisa dipelajari dari studi banding ini,” katanya. Dalam studi banding tersebut, AKRB dan AKBA Sinema Yogyakarta diajak melihat kondisi masing-masing elemen di STMIK Amikom Purwokerto untuk saling bertukar informasi</p>', '2019-08-08', 'Berita', 'Berita_08-08-2019_1565279735.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_08-08-2019_1565279735.jpeg', 'image/jpeg', 9),
(1020, 'AMIKOM TERIMA SK PRODI BARU (SIAP MENUJU UNIVERSITAS)', '<p>STMIK Amikom Purwokerto menerima SK dari Kementrian Riset Teknologi dan Pendidikan Tinggi RI (Kemenristekdikti) untuk Program Studi Baru “Teknologi Informasi”. SK&nbsp;Prodi baru tersebut diserahkan langsung oleh kepala LLDIKTI wilayah 6 Jawa Tengah, Prof. Dr. DYP Sugiharto, M.Pd., Kons di ruang Eksekutif&nbsp;kampus STMIK Amikom Purwokerto (17/12).</p><p><br></p><p>Selain penyerahan SK Prodi baru tersebut juga digelar WORKSHOP penguatan SDM dalam rangka alih status STMIK Amikom Purwokerto menjadi Universitas Amikom Purwokerto (UAP) dengan pembicara kepala LLDIKTI wilayah 6 Jawa Tengah. Ketua STMIK Amikom Purwokerto, Dr. Berlilana, M.Kom, M.Si mengucapkan terima kasih atas kepercayaan diserahkannya SK prodi baru tersebut. Ia mengatakan penyerahan SK prodi baru tersebut membawa energi positif untuk STMIK&nbsp;Amikom Purwokerto.</p><p>“Tahun 2018 ini Alhamdulillah sudah mendapatkan akreditasi institusi B. Semoga dengan adanya prodi baru ini akan semakin meningkatkan akreditasi institusi dan juga prodinya., serta semakin mendekatkan untuk beralih status menjadi Universitas Amikom Purwokerto”.</p><p><br></p><p>Dengan diserahkannya SK prodi baru tersebut, STMIK&nbsp;Amikom Purwokerto langsung membuka kesempatan calon mahasiswa baru tahun 2019/2020, sehingga untuk tahun ajaran baru ini stmik amikom purwokerto membuka tiga program studi, yaitu teknik informatika, sistem informasi dan Teknologi Informasi. Untuk pendaftaran Mahasiswa Baru Tahun Akademik 2019/2020&nbsp;<strong>GELOMBANG KHUSUS</strong>&nbsp;akan dimulai tanggal 2 Januari 2019.</p>', '2019-08-02', 'Berita', 'Berita_02-08-2019_1564744576.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_02-08-2019_1564744576.jpeg', 'image/jpeg', 9),
(1021, 'AMIKOM PURWOKERTO LANTIK KAPRODI BARU', '<p>Ketua STMIK AMIKOM Purwokerto, Dr.Berlilana, M.Kom., M.Si melantik Dr. Imam Tahyudin, S.Si, MM, M.Eng sebagai Kepala Program Studi Teknologi Informasi periode 2019-2023 di Ruang Eksekutif STMIK AMIKOM Purwokerto, Sabtu (22/12). Dr. Imam Tahyudin merupakan dosen STMIK AMIKOM Purwokerto yang dipandang memenuhi syarat sebagai Kaprodi Teknologi Informasi. Ia merupakan doktor lulusan dari Kanazawa University Jepang. Ketua STMIK AMIKOM Purwokerto mengatakan SK Prodi Baru tersebut telah resmi diberikan, pihaknya berharap prodi Teknologi Informasi dapat langsung menyesuaikan diri mencontoh kedua prodi sebelumnya, yaitu Teknik Informatika dan Sistem Informasi.</p><p><br></p><p>Sementara itu, Kaprodi terlantik, Imam Tahyudin mengatakan pihaknya akan melakukan yang terbaik untuk Prodi dan STMIK AMIKOM Purwokerto. Selain itu ia juga mengaku akan terus mengasah sikap kritis dan proaktif di prodinya. Kami akan mendukung sepenuhnya kebijakan pimpinan, terbuka menerima kritikan, ujarnya.</p><p><br></p>', '2019-08-02', 'Berita', 'Berita_02-08-2019_1564744646.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_02-08-2019_1564744646.jpeg', 'image/jpeg', 9),
(1022, 'MAHASISWA AMIKOM PURWOKERTO RAIH 2 EMAS', '<p>Dipenghujung tahun 2018 mahasiswa amikom berhasil mempersempahkan 2 emas dalam kejuaraan Makzom Cup Taekwondo Championship. Kejuaraan ini berlangsung Jumat – sabtu 21 – 22 Desember 2018 bertempat di Universitas Budi Luhur Jakarta. 2 Mahasiswa STMIK AMIKOM Purwokerto yang berhasil meraih medali Emas yaitu Jaka Satria Permana dan Adnan Dwi Prasetyo. Keduanya merupakan mahasiswa aktif di STMIK AMIKOM Purwokerto.</p><p><br></p><p>Ketua STMIK AMIKOM Purwokerto, Dr. Berlilana, M.Kom, M.Si mengucapkan selamat atas pencapain yang begitu luar biasa di akhir tahun 2018. “tahun 2018 Alhamdulillah telah dilewati dengan pencapaian luar biasa, selain prestasi dosen dan mahasiswa ditingkat&nbsp;nasional maupun internasional, juga telah diterimanya SK Prodi Baru, yaitu Teknologi Informasi, serta ditambah kado istimewa dari cabang Taekwondo. Semoga kado indah ini akan menjadikan support/modal untuk mengarungi perjalanan STMIK AMIKOM Purwokerto ditahun 2019 yang tinggal menghitung hari lagi.</p>', '2019-08-02', 'Prestasi', 'Prestasi_02-08-2019_1564744676.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Prestasi_02-08-2019_1564744676.jpeg', 'image/jpeg', 9),
(1023, 'Agenda pertama', '<p>Ini adalah agenda pertama</p><p>Pada tanggal 02 Agustus 2019</p><p><br></p><p>Agenda dimulai pada jam: 14.00</p><p>Dan selesai pada: 16.00</p>', '2019-08-02', 'Event', 'Event_02-08-2019_1564744760.', 'http://localhost/kp_amikom/uploads_artikel/Event_02-08-2019_1564744760.', '', 9),
(1024, 'Agenda kedua', '<p>Agenda kedua, pada tanggal 03 Agustus 2019</p><p><br></p><p>Dimulai pada jam: 11.50</p><p>Sampai jam: 14.00</p>', '2019-08-02', 'Event', 'Event_02-08-2019_1564744806.', 'http://localhost/kp_amikom/uploads_artikel/Event_02-08-2019_1564744806.', '', 9),
(1025, 'STMIK Amikom Purwokerto Juara 1 Krenova', '<p><strong>PURWOKERTO, SATELITPOST</strong> - Mahasiswa STMIK Amikom Purwokerto kembali mengharumkan nama baik kampus dengan teknologi yang diciptakan. Kali ini, enam mahasiswa bimbingan Kuat Indartono ST MEng yang telah menorehkan prestasinya di tingkat Kabupaten Banyumas.</p><p>Mereka yakni, M Taufik NH, Desi Rahmawati, Resni Novelalita, Renita Isnaeni dan Ulvah Windi Rahayu. Keenam mahasiswa tersebut berhasil membawa pulang juara 1 dalam ajang komp?etisi Kreativitas dan Inovasi (Kreanova) yang digelar di Alun-alun Purwokerto, Sabtu-Minggu (25-26/11).</p><p>Juara pertama berhasil diraih karena teknologi karya enam mahasiswa tersebut. Yakni, Autes Tech (<em>Automatic Electric Scarescrow Technology</em>). Teknologi tersebut yakni sebuah alat pengusir hama burung secara otomatis.</p><p><br></p><p>“<em>Alhamdulillah</em>&nbsp;dari 10 besar yang masuk, STMIK Amikom Purwokerto berhasil menjadi yang terbaik,” kata M Taufik NH.</p><p>Menurutnya, alat pengusir burung ini bergerak secara otomatis. Dengan bergerak lima menit menyala dan lima menit mati. Sementara untuk menghidupkan dan mematikannya, menggunakan saklar&nbsp;<em>on/off</em>.</p><p>Raihan prestasi ini membuat Taufik dan kelima anggota lainnya berhak membawa pulang hadiah uang pembinaan senilai ?Rp 14 juta. Dan akan mengikuti kompetisi serupa di tingkat selanjutnya, tingkat provinsi.</p><p>Alat pengusir burung otomatis yang telah diterapkan di Desa Pasinggrangan, Banyumas ini berhasil memikat Bupati Banyumas, Ir Achmad Husein. Dengan memberikan respons ketertarikannya yang sangat positif.</p><p><br></p><p>Sementara itu, Ketua STMIK Amikom Purwokerto, Berlilana SP SKom MSi sangat mengapresiasi prestasi yang terus ditorehkan mahasiswa STMIK Amikom Purwokerto. “Semoga prestasi-prestasi yang diraih dapat memberikan motivasi bagi mahasiswa lainnya untuk turut berprestasi. Baik akademik maupun non akademik. Terutama supaya dapat terus mengembangkan kemampuan dalam bidang teknologinya,” kata dia.&nbsp;</p>', '2019-08-05', 'Prestasi', 'Prestasi_02-08-2019_1564744836.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Prestasi_02-08-2019_1564744836.jpeg', 'image/jpeg', 0),
(1027, 'Ini adalah agenda ketiga', '<p>Deskripsi tentang agenda ketiga disini</p><p><br></p><p>Jam: 10.00 - 13.00</p><p>Acara: deskripsi acara disini</p><p><br></p><p><strong>Bold</strong>.<em> Italic. </em><s>Strikethrough</s></p>', '2019-08-05', 'Event', 'Event_05-08-2019_1565000164.', 'http://localhost/kp_amikom/uploads_artikel/Event_05-08-2019_1565000164.', '', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_surat`
--

CREATE TABLE `tb_surat` (
  `id` int(30) NOT NULL,
  `judul_surat` varchar(100) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `tanggal` varchar(30) NOT NULL,
  `file_surat` text NOT NULL,
  `isi_surat` text NOT NULL,
<<<<<<< HEAD
=======
  `type_file` text NOT NULL,
>>>>>>> Finishing the project (finally)
  `id_user` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_surat`
--

INSERT INTO `tb_surat` (`id`, `judul_surat`, `jenis_surat`, `tanggal`, `file_surat`, `isi_surat`, `type_file`, `id_user`) VALUES
(45, 'sdffd', 'SK Penguji', '2019-07-27', 'http://localhost/kp_amikom/uploads_surat/SK Penguji_27-07-2019_1564206426.pdf', 'SK Penguji_27-07-2019_1564206426.pdf', '', 16),
(44, 'hey', 'SK Mengajar', '2019-07-27', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_27-07-2019_1564201926.docx', 'SK Mengajar_27-07-2019_1564201926.docx', '', 8),
(43, 'hey', 'SK Mengajar', '2019-07-27', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_27-07-2019_1564201885.pdf', 'SK Mengajar_27-07-2019_1564201885.pdf', '', 7),
(46, 'Surat mengajar kelas TI 16 D', 'SK Mengajar', '2019-08-02', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_02-08-2019_1564745384.pdf', 'SK Mengajar_02-08-2019_1564745384.pdf', '', 16),
(47, 'Surat Mengajar kelas TI 19 A', 'SK Mengajar', '2019-08-05', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_05-08-2019_1565020035.pdf', 'SK Mengajar_05-08-2019_1565020035.pdf', '', 25),
(48, 'Surat mengajar kelas TI 19 A', 'SK Mengajar', '2019-08-06', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_06-08-2019_1565079992.pdf', 'SK Mengajar_06-08-2019_1565079992.pdf', '', 26),
(49, 'Surat menguji KP Fendi Kurniawan', 'SK Penguji', '2019-08-06', 'http://localhost/kp_amikom/uploads_surat/SK Penguji_06-08-2019_1565080554.pdf', 'SK Penguji_06-08-2019_1565080554.pdf', '', 27),
(50, 'Surat Mengajar kelas TI 19 A', 'SK Mengajar', '2019-08-06', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_06-08-2019_1565098209.pdf', 'SK Mengajar_06-08-2019_1565098209.pdf', '', 31),
(51, 'Surat mengajar kelas TI 19 A', 'SK Mengajar', '2019-08-08', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_08-08-2019_1565247866.pdf', 'SK Mengajar_08-08-2019_1565247866.pdf', '', 37),
(52, 'Surat mengajar kelas SI', 'SK Mengajar', '2019-08-09', 'http://localhost/kp_amikom/uploads_surat/SK Mengajar_09-08-2019_1565330107.pdf', 'SK Mengajar_09-08-2019_1565330107.pdf', '', 49),
(53, 'Surat keputusan DPL KKL 2018', 'SK Dosen Pembimbing', '2019-08-09', 'http://localhost/kp_amikom/uploads_surat/SK Dosen Pembimbing_09-08-2019_1565337103.pdf', 'SK Dosen Pembimbing_09-08-2019_1565337103.pdf', '', 64),
<<<<<<< HEAD
(54, 'Judul surat pertama', 'SK Dosen Pembimbing', '2019-08-09', 'http://localhost/kp_amikom/uploads_surat/SK Dosen Pembimbing_09-08-2019_1565358785.pdf', 'SK Dosen Pembimbing_09-08-2019_1565358785.pdf', '', 67);

=======
(54, 'Judul surat pertama', 'SK Dosen Pembimbing', '2019-08-09', 'http://localhost/kp_amikom/uploads_surat/SK Dosen Pembimbing_09-08-2019_1565358785.pdf', 'SK Dosen Pembimbing_09-08-2019_1565358785.pdf', '', 67),
(55, 'test judul', 'test jenis', '2019-08-13', '', '', '', 1),
(56, 'test judul', 'test jenis', '2019-08-13', '', '', '', 2),
(57, 'test judul', 'test jenis', '2019-08-13', '', '', '', 3),
(58, 'test judul', 'test jenis', '2019-08-13', '', '', '', 4),
(59, 'test judul', 'test jenis', '2019-08-13', '', '', '', 5),
(60, 'tesss', 'SK Penguji', '2019-08-13', 'http://localhost/kp_amikom/uploads_surat/SK Penguji_13-08-2019_1565666302.pdf', 'SK Penguji_13-08-2019_1565666302.pdf', '', 62),
(61, 'tesss', 'SK Penguji', '2019-08-13', 'http://localhost/kp_amikom/uploads_surat/SK Penguji_13-08-2019_1565666302.pdf', 'SK Penguji_13-08-2019_1565666302.pdf', '', 64);
>>>>>>> Finishing the project (finally)

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nidn` int(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `nidn`, `email`, `password`, `kategori`) VALUES
(9, 'Faiz Ichsan  Jaya', 16110000, 'fukuo@gmail.com', '0192023a7bbd73250516f069df18b500', 'Prodi'),
(67, 'Septi Fajarwati', 623098304, 'septi@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
(64, 'Fiby Nur Afiana', 628019003, 'fiby@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
(62, 'Sitaresmi Wahyu Handani', 620028401, 'sita@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
(72, 'Hendra Marcos', 616037701, 'marcos@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
(73, 'Farel Adrian Encrico', 2147483647, 'farel@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
(65, 'Andi Dwi Riyanto', 620018601, 'andi@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
<<<<<<< HEAD
(66, 'Kuat Indarto', 629068105, 'kuat@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen');
=======
(66, 'Kuat Indarto', 629068105, 'kuat@amikompurwokerto.ac.id', '25d55ad283aa400af464c76d713c07ad', 'Dosen'),
(414, 'zaenur', 12131, 'zaenur@amikompurwokerto.ac.id', '0192023a7bbd73250516f069df18b500', 'Admin');
>>>>>>> Finishing the project (finally)

--
-- Indexes for dumped tables
--

--
<<<<<<< HEAD
-- Indeks untuk tabel `tb_admin`
=======
-- Indexes for table `tb_admin`
>>>>>>> Finishing the project (finally)
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- Indeks untuk tabel `tb_hak_akses`
--
ALTER TABLE `tb_coba`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_post`
=======
-- Indexes for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_post`
>>>>>>> Finishing the project (finally)
--
ALTER TABLE `tb_post`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- Indeks untuk tabel `tb_surat`
=======
-- Indexes for table `tb_surat`
>>>>>>> Finishing the project (finally)
--
ALTER TABLE `tb_surat`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- Indeks untuk tabel `tb_user`
=======
-- Indexes for table `tb_user`
>>>>>>> Finishing the project (finally)
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_post`
--
ALTER TABLE `tb_post`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1034;

--
-- AUTO_INCREMENT untuk tabel `tb_surat`
--
ALTER TABLE `tb_surat`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

=======
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_post`
--
ALTER TABLE `tb_post`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1034;
--
-- AUTO_INCREMENT for table `tb_surat`
--
ALTER TABLE `tb_surat`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;COMMIT;
>>>>>>> Finishing the project (finally)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
