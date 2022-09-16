-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 04:54 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(4) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `passwords` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `name`, `email`, `alamat`, `telp`, `username`, `passwords`) VALUES
(1, 'Ron', 'Ronmail', 'silly street', '1111', 'Rondiredom', 'Wilhelmusvannassau'),
(2, 'Akhmed', 'Akhmail', 'dead district', '2222', 'HeilAkhmedi', 'JudgementDay'),
(3, 'Karolyn', 'Karolynatgmail', 'best block', '3333', 'LittleKaroline', 'Isinheretoo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_transaksi`
--

CREATE TABLE `tbl_detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_supir` int(7) DEFAULT NULL,
  `jasa_supir` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_detail_transaksi`
--

INSERT INTO `tbl_detail_transaksi` (`id_detail`, `id_transaksi`, `id_supir`, `jasa_supir`) VALUES
(1, 1, 1, 1111),
(2, 2, 2, 122111),
(3, 3, 3, 3333);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis`
--

CREATE TABLE `tbl_jenis` (
  `id_jenis` int(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jenis`
--

INSERT INTO `tbl_jenis` (`id_jenis`, `nama`) VALUES
(1, 'Light Tank'),
(2, 'Medium Tank'),
(3, 'Heavy Tank');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_konfirmasi`
--

CREATE TABLE `tbl_konfirmasi` (
  `id_konfirmasi` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `bukti` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_konfirmasi`
--

INSERT INTO `tbl_konfirmasi` (`id_konfirmasi`, `id_transaksi`, `bukti`) VALUES
(1, 1, 'RIL'),
(2, 2, 'RIL'),
(3, 3, 'FEK');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mobil`
--

CREATE TABLE `tbl_mobil` (
  `id_mobil` int(11) NOT NULL,
  `id_jenis` int(4) DEFAULT NULL,
  `no_mobil` varchar(10) DEFAULT NULL,
  `merk` varchar(20) DEFAULT NULL,
  `nama_mobil` varchar(30) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `harga` int(7) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mobil`
--

INSERT INTO `tbl_mobil` (`id_mobil`, `id_jenis`, `no_mobil`, `merk`, `nama_mobil`, `gambar`, `harga`, `status`) VALUES
(1, 1, '1', 'Wehrmacht', 'Kreuzer Panzerkampfwagen Mk IV', 'inserthere', 1000, '1'),
(2, 2, '2', 'Wehrmacht', 'Panzerkampfwagen 35', 'inserthere', 2000, '1'),
(3, 3, '3', 'Wehrmacht', 'Panzerkampfwagen 17R/18R 730', 'inserthere', 500, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `no_ktp` char(16) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_telp` char(12) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `passwords` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `no_ktp`, `nama`, `email`, `no_telp`, `alamat`, `username`, `passwords`) VALUES
(1, '1111', 'Quandao', 'gmail1', '1111', '1street', 'username1', 'password1'),
(2, '2222', 'Wehru', 'gmail2', '2222', '2street', 'username2', 'password2'),
(3, '3333', 'Echelon', 'gmail3', '3333', '3street', 'username3', 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supir`
--

CREATE TABLE `tbl_supir` (
  `id_supir` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `telp` char(12) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_supir`
--

INSERT INTO `tbl_supir` (`id_supir`, `nama`, `telp`, `alamat`, `status`) VALUES
(1, 'Heru', '1111', '1street', '1'),
(2, 'Aaron', '2222', '2street', '1'),
(3, 'Sop', '3333', '3street', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_mobil` int(11) DEFAULT NULL,
  `tgl_sewa` datetime DEFAULT NULL,
  `tgl_ambil` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `lama` tinyint(1) DEFAULT NULL,
  `total_harga` int(7) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `jaminan` varchar(30) DEFAULT NULL,
  `denda` int(7) DEFAULT NULL,
  `jatuh_tempo` datetime DEFAULT NULL,
  `konfirmasi` enum('0','1') DEFAULT NULL,
  `pembatalan` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `id_pelanggan`, `id_mobil`, `tgl_sewa`, `tgl_ambil`, `tgl_kembali`, `lama`, `total_harga`, `status`, `jaminan`, `denda`, `jatuh_tempo`, `konfirmasi`, `pembatalan`) VALUES
(1, 1, 1, '2022-09-16 00:00:00', '2022-09-16 00:00:00', '2022-09-16 00:00:00', 1, 1, '1', '1111', 1, '2022-09-16 00:00:00', '1', '1'),
(2, 2, 3, '2022-09-16 00:00:00', '2022-09-16 00:00:00', '2022-09-16 00:00:00', 1, 2, '1', '2111', 2, '2022-09-16 00:00:00', '0', '1'),
(3, 2, 3, '2022-09-16 00:00:00', '2022-09-16 00:00:00', '2022-09-16 00:00:00', 1, 3, '', '3111', 3, '2022-09-16 00:00:00', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_detail_transaksi`
--
ALTER TABLE `tbl_detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_detailtransaksi` (`id_transaksi`),
  ADD KEY `fk_detailsupir` (`id_supir`);

--
-- Indexes for table `tbl_jenis`
--
ALTER TABLE `tbl_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`),
  ADD KEY `fk_konfirmasi` (`id_transaksi`);

--
-- Indexes for table `tbl_mobil`
--
ALTER TABLE `tbl_mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `fk_mobil` (`id_jenis`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tbl_supir`
--
ALTER TABLE `tbl_supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_transaksipelanggan` (`id_pelanggan`),
  ADD KEY `fk_transaksimobil` (`id_mobil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_detail_transaksi`
--
ALTER TABLE `tbl_detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_jenis`
--
ALTER TABLE `tbl_jenis`
  MODIFY `id_jenis` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  MODIFY `id_konfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_mobil`
--
ALTER TABLE `tbl_mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_supir`
--
ALTER TABLE `tbl_supir`
  MODIFY `id_supir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_detail_transaksi`
--
ALTER TABLE `tbl_detail_transaksi`
  ADD CONSTRAINT `fk_detailsupir` FOREIGN KEY (`id_supir`) REFERENCES `tbl_supir` (`id_supir`),
  ADD CONSTRAINT `fk_detailtransaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id_transaksi`);

--
-- Constraints for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  ADD CONSTRAINT `fk_konfirmasi` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id_transaksi`);

--
-- Constraints for table `tbl_mobil`
--
ALTER TABLE `tbl_mobil`
  ADD CONSTRAINT `fk_mobil` FOREIGN KEY (`id_jenis`) REFERENCES `tbl_jenis` (`id_jenis`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `fk_transaksimobil` FOREIGN KEY (`id_mobil`) REFERENCES `tbl_mobil` (`id_mobil`),
  ADD CONSTRAINT `fk_transaksipelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `tbl_pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
