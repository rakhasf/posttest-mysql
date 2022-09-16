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
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `nama_outlet` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`id`, `id_user`, `nama_outlet`, `alamat`, `nomor_telepon`, `created_at`, `updated_at`) VALUES
(1, 1, 'outletprivateer', 'transportship', 'telp1', '2022-09-16 02:27:49', '2022-09-16 02:27:49'),
(2, 2, 'outletpowdermonkey', 'currasier', 'telp2', '2022-09-16 02:27:49', '2022-09-16 02:27:49'),
(3, 3, 'outletkapitan', 'flagship', 'telp3', '2022-09-16 02:27:49', '2022-09-16 02:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'paket prajurit', '1111', '1111', '2022-09-16 02:19:48', '2022-09-16 02:19:48'),
(2, 'paket sersan', '2222', '2222', '2022-09-16 02:19:48', '2022-09-16 02:19:48'),
(3, 'paket brigadir', '3333', '3333', '2022-09-16 02:19:48', '2022-09-16 02:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `id_user`, `no_telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, '1111', '1street', '2022-09-16 02:25:02', '2022-09-16 02:25:02'),
(2, 2, '2222', '12street', '2022-09-16 02:25:02', '2022-09-16 02:25:02'),
(3, 3, '3333', '13street', '2022-09-16 02:25:02', '2022-09-16 02:25:02');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pesanan` int(10) UNSIGNED DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jumlah_paket` varchar(255) DEFAULT NULL,
  `subtotal` varchar(255) DEFAULT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `tanggal_bayar`, `jumlah_paket`, `subtotal`, `bukti_transfer`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-16', 'satu', 'total1', 'ril', '2022-09-16 02:32:43', '2022-09-16 02:32:43'),
(2, 2, '2022-09-16', 'dua', 'total2', 'rilmaybe', '2022-09-16 02:32:43', '2022-09-16 02:32:43'),
(3, 3, '2022-09-16', 'tiga', 'total3', 'ril', '2022-09-16 02:32:43', '2022-09-16 02:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `id_outlet` int(10) UNSIGNED DEFAULT NULL,
  `id_paket` int(10) UNSIGNED DEFAULT NULL,
  `status_pesanan` enum('diproses','selesai') DEFAULT NULL,
  `status_pembayaran` enum('lunas','belum lunas') DEFAULT NULL,
  `tanggal_pemesanan` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_user`, `id_outlet`, `id_paket`, `status_pesanan`, `status_pembayaran`, `tanggal_pemesanan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '', '', '2022-09-16', '2022-09-16 02:29:53', '2022-09-16 02:29:53'),
(2, 2, 2, 2, '', '', '2022-09-16', '2022-09-16 02:29:53', '2022-09-16 02:29:53'),
(3, 3, 3, 3, '', '', '2022-09-16', '2022-09-16 02:29:53', '2022-09-16 02:29:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `level` enum('admin','petugas','pelanggan') DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `passwords` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `level`, `email_verified_at`, `passwords`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Richard', 'RichardMail', 'RichardName', 'pelanggan', '2022-09-16 02:23:05', 'RichardPassword', 'RichardToken', '2022-09-16 02:23:05', '2022-09-16 02:23:05'),
(2, 'Tony', 'TonyMail', 'TonyName', 'petugas', '2022-09-16 02:23:05', 'TonyPassword', 'TonyToken', '2022-09-16 02:23:05', '2022-09-16 02:23:05'),
(3, 'Yahya', 'YahyaMail', 'YahyaName', 'admin', '2022-09-16 02:23:05', 'YahyaPassword', 'YahyaToken', '2022-09-16 02:23:05', '2022-09-16 02:23:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_outlet` (`id_user`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pelanggan` (`id_user`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_pesanan` (`id_pesanan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_user` (`id_user`),
  ADD KEY `fk_id_outlet` (`id_outlet`),
  ADD KEY `fk_id_paket` (`id_paket`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `fk_outlet` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_id_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_id_outlet` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id`),
  ADD CONSTRAINT `fk_id_paket` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
