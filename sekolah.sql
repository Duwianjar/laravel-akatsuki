-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table laravel-akatsuki.kelas
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kelas` int NOT NULL,
  `namakelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kelas` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_kelas_foreign` (`id_kelas`),
  CONSTRAINT `users_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `mapel`;
CREATE TABLE IF NOT EXISTS `mapel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `namamapel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_guru` bigint unsigned NOT NULL,
  `id_kelas` bigint unsigned DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mapel_id_guru_foreign` (`id_guru`),
  KEY `mapel_id_kelas_foreign` (`id_kelas`),
  CONSTRAINT `mapel_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mapel_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping data for table laravel-akatsuki.kelas: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.mapel

-- Dumping data for table laravel-akatsuki.mapel: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.migrations

-- Dumping structure for table laravel-akatsuki.nilai
DROP TABLE IF EXISTS `nilai`;
CREATE TABLE IF NOT EXISTS `nilai` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nilai` int NOT NULL,
  `id_mapel` bigint unsigned NOT NULL,
  `id_murid` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nilai_id_mapel_foreign` (`id_mapel`),
  KEY `nilai_id_murid_foreign` (`id_murid`),
  CONSTRAINT `nilai_id_mapel_foreign` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `nilai_id_murid_foreign` FOREIGN KEY (`id_murid`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel-akatsuki.nilai: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel-akatsuki.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.sampah_kelas
DROP TABLE IF EXISTS `sampah_kelas`;
CREATE TABLE IF NOT EXISTS `sampah_kelas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kelas` int NOT NULL,
  `kelas` int NOT NULL,
  `namakelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_penghapus` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel-akatsuki.sampah_kelas: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.sampah_mapel
DROP TABLE IF EXISTS `sampah_mapel`;
CREATE TABLE IF NOT EXISTS `sampah_mapel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_mapel` int NOT NULL,
  `namamapel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_guru` bigint unsigned NOT NULL,
  `id_kelas` bigint unsigned DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_penghapus` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sampah_mapel_id_guru_foreign` (`id_guru`),
  KEY `sampah_mapel_id_kelas_foreign` (`id_kelas`),
  CONSTRAINT `sampah_mapel_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sampah_mapel_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel-akatsuki.sampah_mapel: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.sampah_nilai
DROP TABLE IF EXISTS `sampah_nilai`;
CREATE TABLE IF NOT EXISTS `sampah_nilai` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_nilai` int NOT NULL,
  `nilai` int NOT NULL,
  `id_mapel` bigint unsigned NOT NULL,
  `id_murid` bigint unsigned NOT NULL,
  `id_penghapus` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sampah_nilai_id_mapel_foreign` (`id_mapel`),
  KEY `sampah_nilai_id_murid_foreign` (`id_murid`),
  CONSTRAINT `sampah_nilai_id_mapel_foreign` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sampah_nilai_id_murid_foreign` FOREIGN KEY (`id_murid`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel-akatsuki.sampah_nilai: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.sampah_users
DROP TABLE IF EXISTS `sampah_users`;
CREATE TABLE IF NOT EXISTS `sampah_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_users` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_penghapus` int NOT NULL,
  `id_kelas` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sampah_users_email_unique` (`email`),
  KEY `sampah_users_id_kelas_foreign` (`id_kelas`),
  CONSTRAINT `sampah_users_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel-akatsuki.sampah_users: ~0 rows (approximately)

-- Dumping structure for table laravel-akatsuki.users

-- Dumping data for table laravel-akatsuki.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
