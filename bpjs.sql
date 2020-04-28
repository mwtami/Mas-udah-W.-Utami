-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 10:50 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bpjs`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_ambil_quota`
--

CREATE TABLE `tb_ambil_quota` (
  `id_ambil_quota` int(8) NOT NULL,
  `nik_pegawai` varchar(100) NOT NULL,
  `nama_pengguna` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL COMMENT 'L = laki-laki, P = perempuan ',
  `ket_pengguna` enum('1','2','3','4','5','6') NOT NULL COMMENT '1=Suami, 2=Istri, 3=Anak pertama, 4=Anak kedua, 5=Anak ketiga, 6=Diri Sendiri ',
  `ket_dokter` enum('1','2') NOT NULL COMMENT '1=Non spesialis, 2=Spesialis',
  `ket_obat` enum('1','2') NOT NULL COMMENT '1=Engenerik, 2=Nonengenerik',
  `tgl_berobat` date NOT NULL,
  `foto_bukti` varchar(100) NOT NULL,
  `tgl_ambil_quota` datetime NOT NULL,
  `ambil_quota` int(10) NOT NULL,
  `status_quota` enum('0','1') NOT NULL COMMENT '0 = Belum Diterima, 1 = Sudah Diterima',
  `tgl_terima_quota` date DEFAULT NULL,
  `kode_bukti` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ambil_quota`
--

INSERT INTO `tb_ambil_quota` (`id_ambil_quota`, `nik_pegawai`, `nama_pengguna`, `jenis_kelamin`, `ket_pengguna`, `ket_dokter`, `ket_obat`, `tgl_berobat`, `foto_bukti`, `tgl_ambil_quota`, `ambil_quota`, `status_quota`, `tgl_terima_quota`, `kode_bukti`) VALUES
(1, '3333333', 'Indah pertiwi', 'P', '2', '2', '2', '2016-06-25', 'cassette-tape-bob-dylan.jpg', '2016-06-25 07:39:09', 300000, '1', '2016-06-26', '3333333160001'),
(2, '3333333', 'dika', 'L', '3', '2', '1', '2016-06-23', 'petrucci_lick.jpg', '2016-06-25 06:04:02', 120000, '1', '2016-06-26', '3333333160002'),
(3, '3333333', 'Indah pertiwi', 'P', '2', '1', '1', '2016-06-21', 'egg-14534_640.jpg', '2016-06-26 01:13:07', 210000, '1', '2016-06-26', '3333333160003'),
(4, '1301174656', 'Tressy M', 'P', '6', '2', '2', '2020-04-01', 'egg-14534_6401.jpg', '2020-04-23 09:30:40', 1500000, '1', '2020-04-23', '1301174656200001'),
(5, '1301174662', 'Julian', 'L', '1', '2', '2', '2020-04-01', 'egg-14534_6402.jpg', '2020-04-23 10:43:27', 2500000, '1', '2020-04-23', '1301174662200001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jabatan`
--

CREATE TABLE `tb_jabatan` (
  `id_jabatan` int(4) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  `quota` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jabatan`
--

INSERT INTO `tb_jabatan` (`id_jabatan`, `nama_jabatan`, `quota`) VALUES
(1, 'Super Administrator', '5000000'),
(3, 'Pegawai Swasta', '5000000'),
(2, 'Pegawai Pemerintah', '10000000'),
(4, 'Investor', '3500000'),
(5, 'PBI Jaminan Kesehatan', '7500000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login_admin`
--

CREATE TABLE `tb_login_admin` (
  `id_login_admin` int(4) NOT NULL,
  `nik_pegawai` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '0=tidak aktif, 1=aktif'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login_admin`
--

INSERT INTO `tb_login_admin` (`id_login_admin`, `nik_pegawai`, `password`, `status`) VALUES
(1, '1234567', 'admin', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login_super_admin`
--

CREATE TABLE `tb_login_super_admin` (
  `id_login_super_admin` int(5) NOT NULL,
  `nik_pegawai` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login_super_admin`
--

INSERT INTO `tb_login_super_admin` (`id_login_super_admin`, `nik_pegawai`, `password`) VALUES
(1, '1234567', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login_user`
--

CREATE TABLE `tb_login_user` (
  `id_login_user` int(4) NOT NULL,
  `nik_pegawai` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1=aktif, 2=tidak aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login_user`
--

INSERT INTO `tb_login_user` (`id_login_user`, `nik_pegawai`, `password`, `status`) VALUES
(1, '1301174662', 'agnes', '1'),
(2, '1301174702', 'uut', '1'),
(3, '1301174668', 'shafira', '1'),
(4, '1301174656', 'ling', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL COMMENT 'L = laki-laki, P = perempuan',
  `telepon` varchar(100) NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1=Lajang, 2=Sudah menikah',
  `foto` varchar(100) NOT NULL,
  `level_pegawai` int(3) NOT NULL,
  `tgl_mulai_kerja` date NOT NULL,
  `no_bpjs` varchar(100) NOT NULL,
  `quota_pegawai` decimal(10,0) NOT NULL,
  `tgl_update_quota` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`nik`, `nama`, `alamat`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `telepon`, `status`, `foto`, `level_pegawai`, `tgl_mulai_kerja`, `no_bpjs`, `quota_pegawai`, `tgl_update_quota`) VALUES
('1234567', 'Tubagus Ibrohim A', 'Kings Landing', 'Kings Landing', '1998-03-24', 'L', '08961212126', '2', '6D6372F6-824E-4250-97F7-50B47CCB1834_(2)1.jpg', 1, '2016-01-03', '11111111', '10000000', '2016-06-14'),
('1301174702', 'Masudah Wisnu Utami', 'Ponorego', 'Jawa Tengah', '1999-04-14', 'P', '0812141214', '1', 'uut1.jpg', 4, '2017-03-12', '00000014', '3500000', '2020-04-23'),
('1301174668', 'Shafira Salsabilla Pradina Putri', 'Sukabirus', 'Jakarta', '2000-05-01', 'P', '081221653142', '1', 'shafira1.jpg', 5, '2017-10-10', '00000001', '7500000', '2020-04-23'),
('1301174662', 'Agnes Zahrani', 'Sukabirus', 'Jakarta', '1999-03-02', 'P', '08123131311', '1', 'agnes1.jpg', 3, '2017-06-01', '00000002', '2500000', '2020-04-23'),
('1301174656', 'Tressy M. Setiawan', '221B Baker Street', 'London', '1999-12-02', 'P', '0812211221', '1', 'ling1.jpg', 2, '2017-12-12', '00000012', '8500000', '2020-04-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_ambil_quota`
--
ALTER TABLE `tb_ambil_quota`
  ADD PRIMARY KEY (`id_ambil_quota`);

--
-- Indexes for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `tb_login_admin`
--
ALTER TABLE `tb_login_admin`
  ADD PRIMARY KEY (`id_login_admin`);

--
-- Indexes for table `tb_login_super_admin`
--
ALTER TABLE `tb_login_super_admin`
  ADD PRIMARY KEY (`id_login_super_admin`);

--
-- Indexes for table `tb_login_user`
--
ALTER TABLE `tb_login_user`
  ADD PRIMARY KEY (`id_login_user`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_ambil_quota`
--
ALTER TABLE `tb_ambil_quota`
  MODIFY `id_ambil_quota` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_login_admin`
--
ALTER TABLE `tb_login_admin`
  MODIFY `id_login_admin` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_login_super_admin`
--
ALTER TABLE `tb_login_super_admin`
  MODIFY `id_login_super_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_login_user`
--
ALTER TABLE `tb_login_user`
  MODIFY `id_login_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
