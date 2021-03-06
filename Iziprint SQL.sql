-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 04, 2021 at 02:15 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `iziprint`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `int_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `int_btn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_btn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_on_right` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `page_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_uploads`
--

CREATE TABLE `image_uploads` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_uploads`
--

INSERT INTO `image_uploads` (`id`, `created_at`, `updated_at`, `name`, `original_name`, `alt_tag`, `title_tag`, `url`, `thumb_url`, `block_id`, `page_id`) VALUES
('186b7388-18dd-474e-b4d6-91e45e8a5021', '2021-08-03 12:57:08', '2021-08-03 12:57:08', 'a6f0_100660212_1152049821816304_8643786330771292160_n.jpg', '100660212_1152049821816304_8643786330771292160_n.jpg', NULL, NULL, '/image_uploads/a6f0_100660212_1152049821816304_8643786330771292160_n.jpg', '/image_uploads/thumb_a6f0_100660212_1152049821816304_8643786330771292160_n.jpg', NULL, NULL),
('285379e2-7a0d-475d-846b-c082c7242ecb', '2021-07-30 09:41:29', '2021-07-30 09:41:29', '8e9a_61592646_877884645899491_3422420302993293312_n.jpg', '61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/8e9a_61592646_877884645899491_3422420302993293312_n.jpg', 'http://localhost:3000/image_uploads/thumb_8e9a_61592646_877884645899491_3422420302993293312_n.jpg', NULL, 'c617c8b6-ff71-47ab-9016-80b5a51867a0'),
('9ca1626b-0204-4067-a7fd-9d617465b315', '2021-08-03 12:58:04', '2021-08-03 12:58:04', '7590_148698606_1355952418092709_2422744174360802143_n.jpg', '148698606_1355952418092709_2422744174360802143_n.jpg', NULL, NULL, '/image_uploads/7590_148698606_1355952418092709_2422744174360802143_n.jpg', '/image_uploads/thumb_7590_148698606_1355952418092709_2422744174360802143_n.jpg', NULL, NULL),
('a03a9a5a-b980-44c5-aed1-8221a5a555de', '2021-08-03 12:54:44', '2021-08-03 12:54:44', '2bc2_106264734_1179176062437013_6733725970548230913_n2.jpg', '106264734_1179176062437013_6733725970548230913_n2.jpg', NULL, NULL, '/image_uploads/2bc2_106264734_1179176062437013_6733725970548230913_n2.jpg', '/image_uploads/thumb_2bc2_106264734_1179176062437013_6733725970548230913_n2.jpg', NULL, NULL),
('e166be11-1900-4894-b0c5-d7438330a227', '2021-08-03 12:58:26', '2021-08-03 12:58:26', '5bb4_139276403_1338805723140712_106717721434514691_n.jpg', '139276403_1338805723140712_106717721434514691_n.jpg', NULL, NULL, '/image_uploads/5bb4_139276403_1338805723140712_106717721434514691_n.jpg', '/image_uploads/thumb_5bb4_139276403_1338805723140712_106717721434514691_n.jpg', NULL, NULL),
('ffc47f49-6462-4f84-81a4-a2a9a9cd0092', '2021-08-03 12:55:33', '2021-08-03 12:55:33', 'f74d_137627329_1335251793496105_8088037201883222347_n.jpg', '137627329_1335251793496105_8088037201883222347_n.jpg', NULL, NULL, '/image_uploads/f74d_137627329_1335251793496105_8088037201883222347_n.jpg', '/image_uploads/thumb_f74d_137627329_1335251793496105_8088037201883222347_n.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_07_07_132408_create_pages_table', 1),
(6, '2021_07_07_133053_create_image_uploads_table', 1),
(7, '2021_07_07_135748_add_pages_to_pages_table', 1),
(8, '2021_07_20_123154_create_blocks_table', 1),
(9, '2021_07_21_132329_add_block_foreign_key_to_image_uploads_table', 1),
(10, '2021_07_26_080731_add_page_foreign_key_to_image_uploads_table', 1),
(11, '2021_07_30_095412_add_users_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `created_at`, `updated_at`, `key`, `name`, `title`, `description`, `order`) VALUES
('086efa2c-e4eb-4f05-a7b7-fdae9e92c376', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'contact', 'Contact', 'TITRE Contact', 'Description Contact. Ceci est une tr??s longue description pour le r??f??rencement de google.', 9),
('36ffc993-0132-41cf-a789-14d3e5b30a6f', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'signaletique', 'Signal??tique', 'TITRE Signal??tique', 'Description Signal??tique. Ceci est une tr??s longue description pour le r??f??rencement de google.', 4),
('4cc0c711-07e8-4d8c-a73c-804b27d77e84', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'enseignes', 'Enseignes', 'TITRE Enseignes', 'Description Enseignes. Ceci est une tr??s longue description pour le r??f??rencement de google.', 2),
('602168a5-8e7f-4947-b6a4-5ddf36ff8404', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'about_us', 'A propos', 'TITRE A propos', 'Description A propos. Ceci est une tr??s longue description pour le r??f??rencement de google.', 7),
('6fb931c8-5d65-4474-ae52-8b096db48511', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'devis', 'Devis', 'TITRE Devis', 'Description Devis. Ceci est une tr??s longue description pour le r??f??rencement de google.', 8),
('8dd760f7-4c47-45ca-83c4-071c8041baa3', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'packaging', 'Packaging', 'TITRE Packaging', 'Description Packaging. Ceci est une tr??s longue description pour le r??f??rencement de google.', 5),
('9485c969-21f5-40f3-ac30-dffd01bb9a40', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'vehicules', 'V??hicules', 'TITRE V??hicules', 'Description V??hicules. Ceci est une tr??s longue description pour le r??f??rencement de google.', 3),
('c617c8b6-ff71-47ab-9016-80b5a51867a0', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'home', 'Accueil', 'TITRE Accueil', 'Description Accueil. Ceci est une tr??s longue description pour le r??f??rencement de google.', 1),
('e48271c2-a40e-42b1-99ec-5d3e086a85f7', '2021-07-30 08:50:26', '2021-07-30 08:50:26', 'plv', 'PLV', 'TITRE PLV', 'Description PLV. Ceci est une tr??s longue description pour le r??f??rencement de google.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'info@iziprint.re', NULL, '$2y$10$yX74cUvqRmHqpuMPBn0eiu6SAwOzPqW3gw5D9rbiMXn1EWu2ipmne', NULL, '2021-07-30 08:50:26', '2021-07-30 08:50:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_page_id_index` (`page_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `image_uploads`
--
ALTER TABLE `image_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_uploads_block_id_index` (`block_id`),
  ADD KEY `image_uploads_page_id_index` (`page_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);

--
-- Constraints for table `image_uploads`
--
ALTER TABLE `image_uploads`
  ADD CONSTRAINT `image_uploads_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`),
  ADD CONSTRAINT `image_uploads_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);
