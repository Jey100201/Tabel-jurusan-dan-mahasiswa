-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2021 at 03:06 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataprodi`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(10) NOT NULL,
  `judul_buku` varchar(20) NOT NULL,
  `deskripsi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `deskripsi`) VALUES
(1, 'Pemograman Web', 'HTML, CSS, PHP, MYSQ');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam_buku`
--

CREATE TABLE `detail_pinjam_buku` (
  `id_detail_pinjam_buku` int(11) NOT NULL,
  `id_pinjam_buku` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pinjam_buku`
--

INSERT INTO `detail_pinjam_buku` (`id_detail_pinjam_buku`, `id_pinjam_buku`, `id_buku`, `qty`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(20) NOT NULL,
  `angkatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `angkatan`) VALUES
(1, 'Sistem Informasi', '2020'),
(3, 'Teknik Informatika', '2019'),
(5, 'Teknik Mesin', '2019'),
(7, 'Akuntansi', '2021'),
(8, 'Manajemen', '2017'),
(9, 'Psikologi', '2015');

-- --------------------------------------------------------

--
-- Table structure for table `kembali_buku`
--

CREATE TABLE `kembali_buku` (
  `id_kembali_buku` int(11) NOT NULL,
  `id_pinjam_buku` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kembali_buku`
--

INSERT INTO `kembali_buku` (`id_kembali_buku`, `id_pinjam_buku`, `tanggal_kembali`, `denda`) VALUES
(1, 1, '2021-12-17', 0),
(2, 1, '2021-12-17', 0),
(3, 1, '2021-12-17', 0),
(4, 1, '2021-12-17', 0),
(5, 1, '2021-12-17', 0),
(6, 1, '2021-12-17', 0),
(7, 2, '2021-12-17', 0),
(8, 2, '2021-12-17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nama`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `username`, `password`, `id_jurusan`) VALUES
(4, 'Muhammad Jefry Purnomo', '2001-02-10', 'L', 'Surabaya', '20510010', 'qwwewreree', 1),
(5, 'Purnomo Jefry ', '1999-12-12', 'L', 'Madura', 'Jey', 'qwerrtyy', 5),
(6, 'Fatimah', '2005-11-22', 'P', 'Batu', 'Fatimatus Zahra', 'qwerfdsa', 8),
(7, 'Nur Nafisah', '2000-04-22', 'P', 'Jakarta', 'nafisah456', 'qwerdsa', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_buku`
--

CREATE TABLE `pinjam_buku` (
  `id_pinjam_buku` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam_buku`
--

INSERT INTO `pinjam_buku` (`id_pinjam_buku`, `tanggal_pinjam`, `id_mhs`, `tanggal_kembali`) VALUES
(1, '2021-12-17', 5, '2021-12-22'),
(2, '2021-12-17', 5, '2021-12-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `detail_pinjam_buku`
--
ALTER TABLE `detail_pinjam_buku`
  ADD PRIMARY KEY (`id_detail_pinjam_buku`),
  ADD KEY `id_pinjam_buku` (`id_pinjam_buku`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kembali_buku`
--
ALTER TABLE `kembali_buku`
  ADD PRIMARY KEY (`id_kembali_buku`),
  ADD KEY `id_pinjam_buku` (`id_pinjam_buku`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `pinjam_buku`
--
ALTER TABLE `pinjam_buku`
  ADD PRIMARY KEY (`id_pinjam_buku`),
  ADD KEY `id_mhs` (`id_mhs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_pinjam_buku`
--
ALTER TABLE `detail_pinjam_buku`
  MODIFY `id_detail_pinjam_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kembali_buku`
--
ALTER TABLE `kembali_buku`
  MODIFY `id_kembali_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pinjam_buku`
--
ALTER TABLE `pinjam_buku`
  MODIFY `id_pinjam_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pinjam_buku`
--
ALTER TABLE `detail_pinjam_buku`
  ADD CONSTRAINT `detail_pinjam_buku_ibfk_1` FOREIGN KEY (`id_pinjam_buku`) REFERENCES `pinjam_buku` (`id_pinjam_buku`),
  ADD CONSTRAINT `detail_pinjam_buku_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `kembali_buku`
--
ALTER TABLE `kembali_buku`
  ADD CONSTRAINT `kembali_buku_ibfk_1` FOREIGN KEY (`id_pinjam_buku`) REFERENCES `pinjam_buku` (`id_pinjam_buku`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `pinjam_buku`
--
ALTER TABLE `pinjam_buku`
  ADD CONSTRAINT `pinjam_buku_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `mahasiswa` (`id_mhs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
