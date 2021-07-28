-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 27, 2021 at 06:34 AM
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

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `created_at`, `updated_at`, `title`, `subtitle`, `content`, `order`, `int_link`, `int_btn`, `ext_link`, `ext_btn`, `image_on_right`, `enabled`, `page_id`) VALUES
('0543bce8-2969-46b4-be2b-b7a5e22bef02', '2021-07-26 13:10:36', '2021-07-26 13:10:36', 'Nouveau Bloc 2', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio. Nunc mi ipsum faucibus vitae. Sagittis id consectetur purus ut faucibus pulvinar elementum. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Enim diam vulputate ut pharetra sit. Risus ultricies tristique nulla aliquet enim. Morbi tincidunt augue interdum velit euismod in pellentesque massa placerat. Gravida cum sociis natoque penatibus et magnis dis. Nibh tellus molestie nunc non blandit massa enim nec dui. Cras ornare arcu dui vivamus. Netus et malesuada fames ac turpis egestas maecenas pharetra. Aliquam ultrices sagittis orci a scelerisque. Condimentum lacinia quis vel eros donec ac odio. Sit amet volutpat consequat mauris nunc congue nisi. Sapien et ligula ullamcorper malesuada proin libero nunc. Orci sagittis eu volutpat odio facilisis mauris. Elit sed vulputate mi sit amet mauris commodo quis. Felis imperdiet proin fermentum leo vel. Facilisi cras fermentum odio eu. Lacus sed turpis tincidunt id aliquet. Dui vivamus arcu felis bibendum ut tristique. Mi sit amet mauris commodo quis imperdiet massa tincidunt. At tellus at urna condimentum mattis pellentesque id nibh. Sed euismod nisi porta lorem mollis aliquam ut porttitor leo. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Faucibus pulvinar elementum integer enim neque volutpat.', 1, NULL, NULL, NULL, NULL, 1, 1, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('6afdfae1-5556-4dd7-b424-18320844ac52', '2021-07-26 06:58:16', '2021-07-26 13:10:45', 'Nouveau Bloc 1', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio. Nunc mi ipsum faucibus vitae. Sagittis id consectetur purus ut faucibus pulvinar elementum. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Enim diam vulputate ut pharetra sit. Risus ultricies tristique nulla aliquet enim. Morbi tincidunt augue interdum velit euismod in pellentesque massa placerat. Gravida cum sociis natoque penatibus et magnis dis. Nibh tellus molestie nunc non blandit massa enim nec dui. Cras ornare arcu dui vivamus. Netus et malesuada fames ac turpis egestas maecenas pharetra. Aliquam ultrices sagittis orci a scelerisque. Condimentum lacinia quis vel eros donec ac odio. Sit amet volutpat consequat mauris nunc congue nisi. Sapien et ligula ullamcorper malesuada proin libero nunc. Orci sagittis eu volutpat odio facilisis mauris. Elit sed vulputate mi sit amet mauris commodo quis. Felis imperdiet proin fermentum leo vel. Facilisi cras fermentum odio eu. Lacus sed turpis tincidunt id aliquet. Dui vivamus arcu felis bibendum ut tristique. Mi sit amet mauris commodo quis imperdiet massa tincidunt. At tellus at urna condimentum mattis pellentesque id nibh. Sed euismod nisi porta lorem mollis aliquam ut porttitor leo. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Faucibus pulvinar elementum integer enim neque volutpat.', 0, NULL, NULL, NULL, NULL, 1, 1, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('d77d8e26-327f-4fe4-b8c1-c542c691d9e9', '2021-07-26 06:58:25', '2021-07-26 06:58:25', 'Nouveau Bloc 1', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio. Nunc mi ipsum faucibus vitae. Sagittis id consectetur purus ut faucibus pulvinar elementum. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Enim diam vulputate ut pharetra sit. Risus ultricies tristique nulla aliquet enim. Morbi tincidunt augue interdum velit euismod in pellentesque massa placerat. Gravida cum sociis natoque penatibus et magnis dis. Nibh tellus molestie nunc non blandit massa enim nec dui. Cras ornare arcu dui vivamus. Netus et malesuada fames ac turpis egestas maecenas pharetra. Aliquam ultrices sagittis orci a scelerisque. Condimentum lacinia quis vel eros donec ac odio. Sit amet volutpat consequat mauris nunc congue nisi. Sapien et ligula ullamcorper malesuada proin libero nunc. Orci sagittis eu volutpat odio facilisis mauris. Elit sed vulputate mi sit amet mauris commodo quis. Felis imperdiet proin fermentum leo vel. Facilisi cras fermentum odio eu. Lacus sed turpis tincidunt id aliquet. Dui vivamus arcu felis bibendum ut tristique. Mi sit amet mauris commodo quis imperdiet massa tincidunt. At tellus at urna condimentum mattis pellentesque id nibh. Sed euismod nisi porta lorem mollis aliquam ut porttitor leo. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Faucibus pulvinar elementum integer enim neque volutpat.', 0, NULL, NULL, NULL, NULL, 1, 1, 'f0c516a2-a470-4ed0-a235-0cdb1dea9307');

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
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `page_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `gallery_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_uploads`
--

INSERT INTO `image_uploads` (`id`, `created_at`, `updated_at`, `name`, `original_name`, `alt_tag`, `title_tag`, `url`, `thumb_url`, `block_id`, `gallery_id`, `page_id`) VALUES
('047f165a-344c-4a5a-8af8-0b002bfb8f1b', '2021-07-26 09:07:16', '2021-07-26 10:46:47', '32c8_57395744_849435735411049_1470333769763258368_n.jpg', '57395744_849435735411049_1470333769763258368_n.jpg', 'test title', 'test alt', 'http://localhost:3000/image_uploads/32c8_57395744_849435735411049_1470333769763258368_n.jpg', 'http://localhost:3000/image_uploads/thumb_32c8_57395744_849435735411049_1470333769763258368_n.jpg', NULL, NULL, NULL),
('125baa31-8527-4211-ae1c-ab239d9da249', '2021-07-26 11:32:13', '2021-07-26 11:32:13', '65c9_68332682_917108391977116_154422452456259584_n.jpg', '68332682_917108391977116_154422452456259584_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/65c9_68332682_917108391977116_154422452456259584_n.jpg', 'http://localhost:3000/image_uploads/thumb_65c9_68332682_917108391977116_154422452456259584_n.jpg', NULL, NULL, '6726e594-ae9d-4b57-ad01-90ca586e0565'),
('166c0388-5f50-4b28-b6b0-44408954fc96', '2021-07-26 11:25:48', '2021-07-26 11:25:48', '3ac8_68332682_917108391977116_154422452456259584_n.jpg', '68332682_917108391977116_154422452456259584_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/3ac8_68332682_917108391977116_154422452456259584_n.jpg', 'http://localhost:3000/image_uploads/thumb_3ac8_68332682_917108391977116_154422452456259584_n.jpg', NULL, NULL, NULL),
('21756ae2-f609-4de3-a361-15db0313edc1', '2021-07-26 11:32:07', '2021-07-26 11:32:07', 'b927_61592646_877884645899491_3422420302993293312_n.jpg', '61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/b927_61592646_877884645899491_3422420302993293312_n.jpg', 'http://localhost:3000/image_uploads/thumb_b927_61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, '6726e594-ae9d-4b57-ad01-90ca586e0565'),
('2dbc5829-de88-427f-b121-0c319519e428', '2021-07-26 09:31:18', '2021-07-26 09:31:18', '9fff_72572506_970675266620428_3672928110233255936_n.jpg', '72572506_970675266620428_3672928110233255936_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/9fff_72572506_970675266620428_3672928110233255936_n.jpg', 'http://localhost:3000/image_uploads/thumb_9fff_72572506_970675266620428_3672928110233255936_n.jpg', NULL, NULL, NULL),
('2fb85d44-376a-4322-8e9d-4fb84c0ce231', '2021-07-26 07:54:14', '2021-07-26 07:54:14', '4f5c_57395744_849435735411049_1470333769763258368_n.jpg', '57395744_849435735411049_1470333769763258368_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/4f5c_57395744_849435735411049_1470333769763258368_n.jpg', 'http://localhost:3000/image_uploads/thumb_4f5c_57395744_849435735411049_1470333769763258368_n.jpg', NULL, NULL, NULL),
('359af9bd-b93f-4a27-8fe5-886a0c36e297', '2021-07-26 09:32:41', '2021-07-26 10:51:56', 'f83e_69397168_938351563186132_6431813340799959040_n.jpg', '69397168_938351563186132_6431813340799959040_n.jpg', 'eqwewq', 'qweqwe', 'http://localhost:3000/image_uploads/f83e_69397168_938351563186132_6431813340799959040_n.jpg', 'http://localhost:3000/image_uploads/thumb_f83e_69397168_938351563186132_6431813340799959040_n.jpg', NULL, NULL, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('591e88d4-e800-4d94-bf12-45cde9b6fdf9', '2021-07-26 09:36:58', '2021-07-26 09:36:58', 'f62c_57485341_849208932100396_8826658358833446912_n.jpg', '57485341_849208932100396_8826658358833446912_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/f62c_57485341_849208932100396_8826658358833446912_n.jpg', 'http://localhost:3000/image_uploads/thumb_f62c_57485341_849208932100396_8826658358833446912_n.jpg', NULL, NULL, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('693e2fcd-e59a-4b96-85a3-5327b4d62651', '2021-07-26 11:30:38', '2021-07-26 11:30:38', 'af09_61592646_877884645899491_3422420302993293312_n.jpg', '61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/af09_61592646_877884645899491_3422420302993293312_n.jpg', 'http://localhost:3000/image_uploads/thumb_af09_61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, NULL),
('94ec3246-bcea-4eea-91f1-cb2309fab9c6', '2021-07-26 06:20:04', '2021-07-26 06:28:03', '84ba_test_nom.jpg', '62604465_884906415197314_2045584818757959680_n.jpg', 'test alt_tag', 'test title_tag', 'http://localhost:3000/image_uploads/84ba_test_nom.jpg', 'http://localhost:3000/image_uploads/thumb_84ba_test_nom.jpg', NULL, NULL, 'd6e11224-4fae-4120-b01f-7559ff627873'),
('9c6b3ba1-aa30-45a1-8c4f-46c101f0b4aa', '2021-07-26 10:54:38', '2021-07-26 11:07:28', '123f_68332682_917108391977116_154422452456259584_n.jpg', '68332682_917108391977116_154422452456259584_n.jpg', 'ttttttt', NULL, 'http://localhost:3000/image_uploads/123f_68332682_917108391977116_154422452456259584_n.jpg', 'http://localhost:3000/image_uploads/thumb_123f_68332682_917108391977116_154422452456259584_n.jpg', NULL, NULL, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('ab36d678-f38b-4d4c-bd2d-7fcfb037afb2', '2021-07-26 10:50:58', '2021-07-26 10:52:17', 'fd7c_61592646_877884645899491_3422420302993293312_n.jpg', '61592646_877884645899491_3422420302993293312_n.jpg', 'qeqw', 'qwe', 'http://localhost:3000/image_uploads/fd7c_61592646_877884645899491_3422420302993293312_n.jpg', 'http://localhost:3000/image_uploads/thumb_fd7c_61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('b160f472-99c6-4fcd-a961-263d46adf9fc', '2021-07-27 04:26:15', '2021-07-27 04:26:15', '2ea2_qwe.jpg', '56931858_845253142495975_3282234816719749120_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/2ea2_qwe.jpg', 'http://localhost:3000/image_uploads/thumb_2ea2_qwe.jpg', NULL, NULL, '097e1979-65a5-4d89-956a-17b84bb446d9'),
('f3617945-7cfc-4da4-a55e-1908da7aab73', '2021-07-26 13:10:42', '2021-07-26 13:10:45', '63e6_57485341_849208932100396_8826658358833446912_n.jpg', '57485341_849208932100396_8826658358833446912_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/63e6_57485341_849208932100396_8826658358833446912_n.jpg', 'http://localhost:3000/image_uploads/thumb_63e6_57485341_849208932100396_8826658358833446912_n.jpg', '6afdfae1-5556-4dd7-b424-18320844ac52', NULL, NULL),
('f3c9ff7c-52df-43e8-8b98-656825843aef', '2021-07-26 11:23:15', '2021-07-26 11:23:15', 'bffb_61592646_877884645899491_3422420302993293312_n.jpg', '61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, 'http://localhost:3000/image_uploads/bffb_61592646_877884645899491_3422420302993293312_n.jpg', 'http://localhost:3000/image_uploads/thumb_bffb_61592646_877884645899491_3422420302993293312_n.jpg', NULL, NULL, '6726e594-ae9d-4b57-ad01-90ca586e0565');

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
(4, '2021_07_07_132408_create_pages_table', 1),
(5, '2021_07_07_133053_create_image_uploads_table', 1),
(6, '2021_07_07_135748_add_pages_to_pages_table', 1),
(7, '2021_07_20_123154_create_blocks_table', 1),
(8, '2021_07_21_132329_add_block_foreign_key_to_image_uploads_table', 1),
(9, '2021_07_26_070234_create_galleries_table', 1),
(10, '2021_07_26_070653_add_gallery_foreign_key_to_image_uploads_table', 1),
(11, '2021_07_26_080731_add_page_foreign_key_to_image_uploads_table', 1);

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
('097e1979-65a5-4d89-956a-17b84bb446d9', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'home', 'Accueil', 'TITRE Accueil', 'Description Accueil. Ceci est une très longue description pour le référencement de google.', 1),
('0dc7364a-d061-4e37-8433-dbf60d5c5196', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'devis', 'Devis', 'TITRE Devis', 'Description Devis. Ceci est une très longue description pour le référencement de google.', 8),
('5c32a70b-cf69-4879-b6c6-e3aa4878e607', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'contact', 'Contact', 'TITRE Contact', 'Description Contact. Ceci est une très longue description pour le référencement de google.', 9),
('6726e594-ae9d-4b57-ad01-90ca586e0565', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'enseignes', 'Enseignes', 'TITRE Enseignes', 'Description Enseignes. Ceci est une très longue description pour le référencement de google.', 2),
('d2d647ff-20ef-4536-bad9-c32736cbf6eb', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'packaging', 'Packaging', 'TITRE Packaging', 'Description Packaging. Ceci est une très longue description pour le référencement de google.', 5),
('d6e11224-4fae-4120-b01f-7559ff627873', '2021-07-26 06:08:26', '2021-07-26 06:22:17', 'plv', 'PLV2', 'TITRE PLV 2', 'Description PLV. Ceci est une très longue description pour le référencement de google.', 6),
('f0c516a2-a470-4ed0-a235-0cdb1dea9307', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'vehicules', 'Véhicules', 'TITRE Véhicules', 'Description Véhicules. Ceci est une très longue description pour le référencement de google.', 3),
('f96ec0c9-d511-46ee-a5d8-28b5cfe79420', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'about_us', 'A propos', 'TITRE A propos', 'Description A propos. Ceci est une très longue description pour le référencement de google.', 7),
('ffedf941-176b-4ec7-a8ea-cdab75894e1b', '2021-07-26 06:08:26', '2021-07-26 06:08:26', 'signaletique', 'Signalétique', 'TITRE Signalétique', 'Description Signalétique. Ceci est une très longue description pour le référencement de google.', 4);

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
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_page_id_foreign` (`page_id`);

--
-- Indexes for table `image_uploads`
--
ALTER TABLE `image_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_uploads_block_id_index` (`block_id`),
  ADD KEY `image_uploads_gallery_id_index` (`gallery_id`),
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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);

--
-- Constraints for table `image_uploads`
--
ALTER TABLE `image_uploads`
  ADD CONSTRAINT `image_uploads_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`),
  ADD CONSTRAINT `image_uploads_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  ADD CONSTRAINT `image_uploads_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);
