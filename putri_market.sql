-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 03:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `putri_market`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `stok`, `created_at`, `updated_at`) VALUES
('BR001', 'Pensil Joyko 1 Packs', 25000.00, 100000, '2025-06-22 12:28:49', '2025-06-22 12:28:49'),
('BR002', 'Sabun Mandi', 5000.00, 100, '2025-06-22 13:36:10', '2025-06-22 13:36:10'),
('BR003', 'Pasta Gigi', 12000.00, 50, '2025-06-22 13:36:10', '2025-06-22 13:36:10'),
('BR004', 'Shampo', 15000.00, 30, '2025-06-22 13:36:10', '2025-06-22 13:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(10) NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
('KS001', 'Putri', '083213121232', 'Jl. Nangka Raya', '2025-06-22 13:06:55', '2025-06-22 13:07:07'),
('KS002', 'Andi', '081111111111', 'Jl. Mawar No.1', '2025-06-22 13:37:01', '2025-06-22 13:37:01'),
('KS003', 'Bunga', '082222222222', 'Jl. Melati No.2', '2025-06-22 13:37:01', '2025-06-22 13:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `no_nota` varchar(20) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `id_pelanggan` varchar(10) DEFAULT NULL,
  `id_kasir` varchar(10) DEFAULT NULL,
  `total` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `no_nota`, `tanggal`, `id_pelanggan`, `id_kasir`, `total`, `created_at`, `updated_at`) VALUES
(1, 'NOTA001', '2025-06-22 20:09:52', 'PG001', 'KS001', 200000.00, '2025-06-22 13:09:52', '2025-06-22 13:09:52'),
(2, 'NOTA002', '2025-06-22 20:38:05', 'PG003', 'KS001', 25000.00, '2025-06-22 13:38:05', '2025-06-22 13:38:05'),
(3, 'NOTA003', '2025-06-22 20:38:05', 'PG002', 'KS002', 30000.00, '2025-06-22 13:38:05', '2025-06-22 13:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
('PG001', 'Januar Hendrawan', 'Laki-laki', '08382131234', 'Jl. Kaos Kaki', '2025-06-22 12:12:04', '2025-06-22 12:12:04'),
('PG002', 'Budi Santoso', 'Laki-laki', '081234567890', 'Jl. Merdeka No.1', '2025-06-22 13:35:41', '2025-06-22 13:35:41'),
('PG003', 'Siti Aminah', 'Perempuan', '085612345678', 'Jl. Melati No.5', '2025-06-22 13:35:41', '2025-06-22 13:35:41'),
('PG004', 'Agus Salim', 'Laki-laki', '082298765432', 'Jl. Anggrek No.10', '2025-06-22 13:35:41', '2025-06-22 13:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','kasir') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'putri', 'admin', 'admin', '2025-06-22 11:28:59', '2025-06-22 11:28:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD UNIQUE KEY `no_nota` (`no_nota`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
