-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2023 at 10:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `first_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachmentable`
--

CREATE TABLE `attachmentable` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachmentable_type` varchar(255) NOT NULL,
  `attachmentable_id` int(10) UNSIGNED NOT NULL,
  `attachment_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `original_name` text NOT NULL,
  `mime` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `path` text NOT NULL,
  `description` text DEFAULT NULL,
  `alt` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `disk` varchar(255) NOT NULL DEFAULT 'public',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `name`, `original_name`, `mime`, `extension`, `size`, `sort`, `path`, `description`, `alt`, `hash`, `disk`, `user_id`, `group`, `created_at`, `updated_at`) VALUES
(1, 'fcef021a68e2ed1b2867287dbf9ddbda5af3e8fc', 'powerlines1.jpeg', 'image/jpeg', 'jpeg', 61179, 0, '2023/08/09/', NULL, NULL, '4b0dda5eb3becbd5e5d1f9e665ef6d9ef9fcc796', 'public', 1, NULL, '2023-08-09 05:07:52', '2023-08-09 05:07:52'),
(2, '1762c0fb163a5d9d187dbd836f8041dbaca39a5c', 'p.jpg', 'image/jpeg', 'jpg', 22702239, 0, '2023/08/09/', NULL, NULL, '0dfe66e3663a7de4934fdf7d21be0e923c74679a', 'public', 1, NULL, '2023-08-09 05:12:41', '2023-08-09 05:12:41'),
(3, '5b25251fd71be59ff81d9eacd56036f38d93d24b', '20220628_173533.jpg', 'image/jpeg', 'jpg', 20687473, 0, '2023/08/09/', NULL, NULL, 'f5e5c80b6bceb5b2d3ec6cf7a8e9c7a76316b096', 'public', 1, NULL, '2023-08-09 06:06:53', '2023-08-09 06:06:53'),
(4, '9a06c4543c7a59e7ec7dc473bb6f7022d06e21f9', '20.jpg', 'image/jpeg', 'jpg', 140623, 0, '2023/08/09/', NULL, NULL, 'f87dffb96874bf6545026294b49f3a1abee2690d', 'public', 1, NULL, '2023-08-09 09:00:17', '2023-08-09 09:00:17'),
(5, '9a06c4543c7a59e7ec7dc473bb6f7022d06e21f9', '20.jpg', 'image/jpeg', 'jpg', 140623, 0, '2023/08/09/', NULL, NULL, 'f87dffb96874bf6545026294b49f3a1abee2690d', 'public', 1, NULL, '2023-08-14 11:30:22', '2023-08-14 11:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `path`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Hellena', 'http://localhost:8000/storage/2023/08/09/1762c0fb163a5d9d187dbd836f8041dbaca39a5c.jpg', 'New category', '2023-08-09 05:12:44', '2023-08-09 05:12:44'),
(2, 'Honey Bottles', 'http://localhost:8000/storage/2023/08/09/5b25251fd71be59ff81d9eacd56036f38d93d24b.jpg', 'blaaa blaaaa', '2023-08-09 06:07:01', '2023-08-09 06:07:01'),
(3, 'Bee Shell', 'whatever path', 'thise a dj dandahf duasdh', '2023-08-09 10:31:09', '2023-08-09 10:31:09'),
(4, 'Bee Shell', 'whatever path', 'thise a dj dandahf duasdh', '2023-08-09 10:41:35', '2023-08-09 10:41:35'),
(5, 'askdsakgg', 'whatever path', 'thise a dj dandahf duasdh', '2023-08-10 04:05:48', '2023-08-10 04:05:48'),
(6, 'askdsakgg', 'whatever path', 'thise a dj dandahf duasdh', '2023-08-10 04:27:18', '2023-08-10 04:27:18'),
(7, 'askdsakgg', 'whatever path', 'thise a dj dandahf duasdh', '2023-08-29 03:34:30', '2023-08-29 03:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2021_10_12_000000_create_news_tags_table', 1),
(18, '2021_10_12_000001_create_attachments_table', 1),
(19, '2021_10_12_000002_create_roles_table', 1),
(20, '2021_10_12_000003_create_password_resets_table', 1),
(21, '2021_10_12_000005_create_notifications_table', 1),
(22, '2021_10_12_000007_create_failed_jobs_table', 1),
(23, '2021_10_12_000008_create_news_table', 1),
(24, '2021_10_12_000009_create_users_table', 1),
(25, '2021_10_12_000010_create_attachmentable_table', 1),
(26, '2021_10_12_000011_create_role_users_table', 1),
(27, '2021_12_15_201359_create_faqs_table', 1),
(28, '2023_08_07_090049_create_projects_table', 1),
(29, '2023_08_07_091451_create_categories_table', 1),
(30, '2023_08_07_091834_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_tags`
--

CREATE TABLE `news_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `project_id`, `amount`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'yuda', 1, 1000, 2, '2023-08-09 08:09:06', '2023-08-09 08:09:06'),
(2, 'hellena', 1, 300, 2000, '2023-08-10 04:36:44', '2023-08-10 04:36:44'),
(3, 'hellena', 1, 300, 2000, '2023-08-11 05:56:56', '2023-08-11 05:56:56'),
(4, 'hellena', 1, 200, 2000, '2023-08-11 05:57:25', '2023-08-11 05:57:25'),
(5, 'hellena', 1, 200, 2000, '2023-08-11 07:27:45', '2023-08-11 07:27:45'),
(6, 'Jude', 1, 1000, 1, '2023-08-16 05:53:28', '2023-08-16 05:53:28'),
(7, 'hellena', 1, 200, 2000, '2023-08-16 06:35:48', '2023-08-16 06:35:48'),
(8, 'ayuba', 1, 6000, 3, '2023-08-16 07:43:10', '2023-08-16 07:43:10'),
(9, 'gee', 1, 10000, 5, '2023-08-16 07:45:38', '2023-08-16 07:45:38'),
(10, 'gee', 1, 10000, 5, '2023-08-16 07:48:31', '2023-08-16 07:48:31'),
(11, 'gee', 1, 10000, 5, '2023-08-16 07:51:05', '2023-08-16 07:51:05'),
(12, 'gee', 1, 10000, 5, '2023-08-16 07:51:54', '2023-08-16 07:51:54'),
(13, 'gee', 1, 10000, 5, '2023-08-16 07:54:00', '2023-08-16 07:54:00'),
(14, 'gee', 1, 10000, 5, '2023-08-16 07:56:03', '2023-08-16 07:56:03'),
(15, 'gee', 1, 10000, 5, '2023-08-16 07:57:18', '2023-08-16 07:57:18'),
(16, 'gee', 1, 10000, 5, '2023-08-16 07:59:02', '2023-08-16 07:59:02'),
(17, 'gee', 1, 10000, 5, '2023-08-16 08:00:50', '2023-08-16 08:00:50'),
(18, 'gee', 1, 10000, 5, '2023-08-16 08:01:28', '2023-08-16 08:01:28'),
(19, 'gee', 1, 10000, 5, '2023-08-16 08:02:01', '2023-08-16 08:02:01'),
(20, 'gee', 1, 10000, 5, '2023-08-16 08:02:55', '2023-08-16 08:02:55'),
(21, 'gee', 1, 10000, 5, '2023-08-16 08:03:38', '2023-08-16 08:03:38'),
(22, 'gee', 1, 10000, 5, '2023-08-16 08:04:30', '2023-08-16 08:04:30'),
(23, 'gee', 1, 10000, 5, '2023-08-16 08:05:35', '2023-08-16 08:05:35'),
(24, 'hellena', 1, 200, 2000, '2023-08-16 08:06:03', '2023-08-16 08:06:03'),
(25, 'gee', 1, 10000, 5, '2023-08-16 08:06:17', '2023-08-16 08:06:17'),
(26, 'gee', 1, 10000, 5, '2023-08-16 08:07:03', '2023-08-16 08:07:03'),
(27, 'gee', 1, 10000, 5, '2023-08-16 08:07:36', '2023-08-16 08:07:36'),
(28, 'hellena', 1, 0, 0, '2023-08-16 09:46:28', '2023-08-16 09:46:28'),
(29, 'hellena', 1, 0, 0, '2023-08-16 09:46:30', '2023-08-16 09:46:30'),
(30, 'William', 1, 4000, 2, '2023-08-16 09:50:37', '2023-08-16 09:50:37'),
(31, 'William', 1, 4000, 2, '2023-08-16 09:51:29', '2023-08-16 09:51:29'),
(32, 'hellena', 2, 1500, 3, '2023-08-16 09:57:01', '2023-08-16 09:57:01'),
(33, 'william', 3, 0, 0, '2023-08-16 09:58:23', '2023-08-16 09:58:23'),
(34, 'gfdss', 2, 1000, 2, '2023-08-16 10:09:04', '2023-08-16 10:09:04'),
(35, 'honey', 1, 10000, 5, '2023-08-29 03:45:20', '2023-08-29 03:45:20'),
(36, 'hellena', 1, 6000, 3, '2023-08-30 06:05:20', '2023-08-30 06:05:20'),
(37, 'home', 1, 12000, 6, '2023-08-30 07:10:43', '2023-08-30 07:10:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `organic` enum('Yes','No') NOT NULL,
  `local_bee_keeper` enum('Yes','No') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `path`, `description`, `price`, `rating`, `weight`, `organic`, `local_bee_keeper`, `created_at`, `updated_at`) VALUES
(1, 'hellena', 'http://localhost:8000/storage/2023/08/09/fcef021a68e2ed1b2867287dbf9ddbda5af3e8fc.jpeg', 'gfetrsrt gfty', 2000, 1000, 3000, 'Yes', 'Yes', '2023-08-09 05:08:00', '2023-08-09 05:08:00'),
(2, 'patrick', 'http://localhost:8000/storage/2023/08/09/9a06c4543c7a59e7ec7dc473bb6f7022d06e21f9.jpg', 'description', 500, 300, 3000, 'No', 'Yes', '2023-08-09 09:00:23', '2023-08-09 09:00:23'),
(3, 'yuda', 'http://localhost:8000/storage/2023/08/09/9a06c4543c7a59e7ec7dc473bb6f7022d06e21f9.jpg', 'msaliti', 300, 45, 3000, 'Yes', 'No', '2023-08-14 11:30:25', '2023-08-14 11:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$.D2gOFZ331fEOra5XvAKIuzHCU.xTPPe8ZVpDCB0agJYMK8xcMAJO', 'Eg9VXRpopOHN0keZqTFfTq62rjXMr7z7QxAWn92K1n8eRKA616a44cBbOUmD', '{\"platform.systems.roles\":true,\"platform.systems.users\":true,\"platform.systems.attachment\":true,\"platform.index\":true}', '2023-08-08 03:24:37', '2023-08-08 03:24:37'),
(2, 'Admin', 'admin@admin12.com', NULL, '$2y$10$.Q8jc7tLhLTbs6md7CqN6uxw7oP82vz/4r5Wd55cuO1Dpfv3l/50G', NULL, '{\"platform.systems.roles\":true,\"platform.systems.users\":true,\"platform.systems.attachment\":true,\"platform.index\":true}', '2023-08-29 03:23:48', '2023-08-29 03:23:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachmentable`
--
ALTER TABLE `attachmentable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachmentable_attachment_id_foreign` (`attachment_id`),
  ADD KEY `attachmentable_attachmentable_type_attachmentable_id_index` (`attachmentable_type`,`attachmentable_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_tags`
--
ALTER TABLE `news_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_orders_fx` (`project_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_users_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `attachmentable`
--
ALTER TABLE `attachmentable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_tags`
--
ALTER TABLE `news_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachmentable`
--
ALTER TABLE `attachmentable`
  ADD CONSTRAINT `attachmentable_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `projects_orders_fx` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
