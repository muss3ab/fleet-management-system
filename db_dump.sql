-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2025 at 03:11 PM
-- Server version: 8.0.42-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fleet_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `trip_schedule_id` bigint UNSIGNED NOT NULL,
  `bus_seat_id` bigint UNSIGNED NOT NULL,
  `start_city_id` bigint UNSIGNED NOT NULL,
  `end_city_id` bigint UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `booking_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','confirmed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `trip_schedule_id`, `bus_seat_id`, `start_city_id`, `end_city_id`, `price`, `booking_reference`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 3, 50.00, 'BK68751188EB0E5', 'confirmed', '2025-07-14 11:17:44', '2025-07-14 11:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint UNSIGNED NOT NULL,
  `bus_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_seats` int NOT NULL DEFAULT '12',
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `bus_number`, `total_seats`, `model`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BUS001', 12, 'Mercedes Travego', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(2, 'BUS002', 12, 'Volvo 9700', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(3, 'BUS003', 12, 'Scania Touring', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(4, 'BUS004', 12, 'MAN Lion\'s Coach', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(5, 'BUS005', 12, 'Iveco Magelys', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `bus_seats`
--

CREATE TABLE `bus_seats` (
  `id` bigint UNSIGNED NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `seat_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bus_seats`
--

INSERT INTO `bus_seats` (`id`, `bus_id`, `seat_number`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '01', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(2, 1, '02', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(3, 1, '03', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(4, 1, '04', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(5, 1, '05', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(6, 1, '06', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(7, 1, '07', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(8, 1, '08', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(9, 1, '09', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(10, 1, '10', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(11, 1, '11', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(12, 1, '12', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(13, 2, '01', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(14, 2, '02', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(15, 2, '03', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(16, 2, '04', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(17, 2, '05', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(18, 2, '06', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(19, 2, '07', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(20, 2, '08', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(21, 2, '09', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(22, 2, '10', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(23, 2, '11', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(24, 2, '12', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(25, 3, '01', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(26, 3, '02', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(27, 3, '03', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(28, 3, '04', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(29, 3, '05', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(30, 3, '06', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(31, 3, '07', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(32, 3, '08', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(33, 3, '09', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(34, 3, '10', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(35, 3, '11', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(36, 3, '12', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(37, 4, '01', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(38, 4, '02', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(39, 4, '03', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(40, 4, '04', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(41, 4, '05', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(42, 4, '06', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(43, 4, '07', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(44, 4, '08', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(45, 4, '09', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(46, 4, '10', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(47, 4, '11', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(48, 4, '12', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(49, 5, '01', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(50, 5, '02', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(51, 5, '03', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(52, 5, '04', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(53, 5, '05', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(54, 5, '06', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(55, 5, '07', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(56, 5, '08', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(57, 5, '09', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(58, 5, '10', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(59, 5, '11', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(60, 5, '12', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Cairo', 'CAI', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(2, 'Giza', 'GIZ', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(3, 'AlFayyum', 'FAY', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(4, 'AlMinya', 'MIN', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(5, 'Asyut', 'ASY', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(6, 'Sohag', 'SOH', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(7, 'Luxor', 'LUX', '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(8, 'Aswan', 'ASW', '2025-07-14 10:01:28', '2025-07-14 10:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_14_114623_create_cities_table', 1),
(5, '2025_07_14_114645_create_trips_table', 1),
(6, '2025_07_14_114708_create_trip_schedules_table', 1),
(7, '2025_07_14_114744_create_buses_table', 1),
(8, '2025_07_14_114804_create_bus_seats_table', 1),
(9, '2025_07_14_114824_create_trip_bus_assignments_table', 1),
(10, '2025_07_14_114855_create_bookings_table', 1),
(11, '2025_07_14_120326_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '49340ee5e89fe469e99152ebc3ca75452c883aee6ff9d1dc3d3dfb5b424e8902', '[\"*\"]', NULL, NULL, '2025-07-14 10:08:27', '2025-07-14 10:08:27'),
(2, 'App\\Models\\User', 1, 'auth_token', '2d883cb40e1a8927556943dea1ca356d11cf03fb079cc41dced97dff8c55ffcb', '[\"*\"]', NULL, NULL, '2025-07-14 10:08:50', '2025-07-14 10:08:50'),
(3, 'App\\Models\\User', 1, 'auth_token', '0134a4413ed549f688cf56cdc0f06cd067c060fdb36a8a4c858bf636170a9b9a', '[\"*\"]', '2025-07-14 12:09:01', NULL, '2025-07-14 10:19:40', '2025-07-14 12:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AucR6Gxc5ytZ3MgC7RCtUJkIaRm4h3furDqTRVfg', NULL, '127.0.0.1', 'PostmanRuntime/7.44.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmE1c09iQTVZTHJsblYxMUEwR1dvNm12NUxpMzA5SnNYRmFtaGR6UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752499684);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` json NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `name`, `route`, `base_price`, `departure_time`, `arrival_time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Cairo to Asyut Express', '[1, 3, 4, 5]', 50.00, '08:00:00', '14:00:00', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(2, 'Cairo to Luxor Deluxe', '[1, 3, 4, 5, 6, 7]', 40.00, '10:00:00', '18:00:00', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28'),
(3, 'Giza to AlMinya Direct', '[2, 3, 4]', 60.00, '12:00:00', '16:00:00', 1, '2025-07-14 10:01:28', '2025-07-14 10:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `trip_bus_assignments`
--

CREATE TABLE `trip_bus_assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `trip_schedule_id` bigint UNSIGNED NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trip_bus_assignments`
--

INSERT INTO `trip_bus_assignments` (`id`, `trip_schedule_id`, `bus_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-07-14 10:35:40', '2025-07-14 10:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `trip_schedules`
--

CREATE TABLE `trip_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `trip_id` bigint UNSIGNED NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trip_schedules`
--

INSERT INTO `trip_schedules` (`id`, `trip_id`, `travel_date`, `departure_time`, `arrival_time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-07-15', '08:00:00', '14:00:00', 1, '2025-07-14 10:35:40', '2025-07-14 10:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mosab', 'muss3ab.1994@gmail.com', NULL, '$2y$12$0/6yrXHURWnkowiJGe1zjuleXKyRtI7O/9Fj.epn8SpnQTfodUnDK', NULL, '2025-07-14 10:08:27', '2025-07-14 10:08:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_seat_city_unique` (`trip_schedule_id`,`bus_seat_id`,`start_city_id`,`end_city_id`),
  ADD UNIQUE KEY `bookings_booking_reference_unique` (`booking_reference`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_bus_seat_id_foreign` (`bus_seat_id`),
  ADD KEY `bookings_start_city_id_foreign` (`start_city_id`),
  ADD KEY `bookings_end_city_id_foreign` (`end_city_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buses_bus_number_unique` (`bus_number`);

--
-- Indexes for table `bus_seats`
--
ALTER TABLE `bus_seats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bus_seats_bus_id_seat_number_unique` (`bus_id`,`seat_number`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_name_unique` (`name`),
  ADD UNIQUE KEY `cities_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_bus_assignments`
--
ALTER TABLE `trip_bus_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trip_bus_assignments_trip_schedule_id_bus_id_unique` (`trip_schedule_id`,`bus_id`),
  ADD KEY `trip_bus_assignments_bus_id_foreign` (`bus_id`);

--
-- Indexes for table `trip_schedules`
--
ALTER TABLE `trip_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trip_schedules_trip_id_travel_date_unique` (`trip_id`,`travel_date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bus_seats`
--
ALTER TABLE `bus_seats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trip_bus_assignments`
--
ALTER TABLE `trip_bus_assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trip_schedules`
--
ALTER TABLE `trip_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_bus_seat_id_foreign` FOREIGN KEY (`bus_seat_id`) REFERENCES `bus_seats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_end_city_id_foreign` FOREIGN KEY (`end_city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_start_city_id_foreign` FOREIGN KEY (`start_city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_trip_schedule_id_foreign` FOREIGN KEY (`trip_schedule_id`) REFERENCES `trip_schedules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bus_seats`
--
ALTER TABLE `bus_seats`
  ADD CONSTRAINT `bus_seats_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trip_bus_assignments`
--
ALTER TABLE `trip_bus_assignments`
  ADD CONSTRAINT `trip_bus_assignments_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trip_bus_assignments_trip_schedule_id_foreign` FOREIGN KEY (`trip_schedule_id`) REFERENCES `trip_schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trip_schedules`
--
ALTER TABLE `trip_schedules`
  ADD CONSTRAINT `trip_schedules_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
