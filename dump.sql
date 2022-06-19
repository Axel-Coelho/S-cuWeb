-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 19 juin 2022 à 14:04
-- Version du serveur : 10.7.3-MariaDB
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mdproject-ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Le Rolltop', 'rolltop', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(2, 'Le Casual', 'casual', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(3, 'Le Huron', 'huron', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(4, 'Le Tote Bag', 'totebag', '2022-05-24 19:57:37', '2022-05-24 19:57:37');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(24, 4, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(25, 4, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(27, 4, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(28, 4, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(29, 4, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(30, 4, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(31, 4, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(32, 4, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(33, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(34, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(35, 4, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(36, 4, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(37, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(38, 5, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(39, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(40, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(41, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(42, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(43, 5, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(44, 5, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(45, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(46, 5, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(47, 5, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(48, 5, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(49, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(50, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(51, 6, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 3),
(52, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(53, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(54, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(55, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(56, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 3),
(57, 7, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, '{}', 4),
(58, 7, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(59, 7, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 6),
(60, 7, 'category_id', 'select_dropdown', 'Category Id', 1, 1, 1, 1, 1, 1, '{\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 7),
(61, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 8),
(62, 7, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{}', 9),
(63, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-05-24 19:56:59', '2022-05-24 19:56:59'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-05-24 19:56:59', '2022-05-24 19:56:59'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-05-24 19:56:59', '2022-05-24 19:56:59'),
(4, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(5, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(6, 'category', 'category', 'Category', 'Categories', 'voyager-categories', 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-24 19:58:39', '2022-05-24 19:58:39'),
(7, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-24 19:59:02', '2022-05-24 20:27:18');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-05-24 19:56:59', '2022-05-24 19:56:59');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-05-24 19:56:59', '2022-05-24 19:56:59', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-05-24 19:56:59', '2022-05-24 19:56:59', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-05-24 19:57:00', '2022-05-24 19:57:00', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-05-24 19:57:00', '2022-05-24 19:57:00', 'voyager.settings.index', NULL),
(11, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2022-05-24 19:57:37', '2022-05-24 19:57:37', 'voyager.posts.index', NULL),
(12, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2022-05-24 19:57:37', '2022-05-24 19:57:37', 'voyager.pages.index', NULL),
(13, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 15, '2022-05-24 19:58:39', '2022-05-24 19:58:39', 'voyager.category.index', NULL),
(14, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 16, '2022-05-24 19:59:02', '2022-05-24 19:59:02', 'voyager.products.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2022_05_23_094425_create_categories_table', 1),
(145, '2014_10_12_000000_create_users_table', 2),
(146, '2014_10_12_100000_create_password_resets_table', 2),
(147, '2016_01_01_000000_add_voyager_user_fields', 2),
(148, '2016_01_01_000000_create_data_types_table', 2),
(149, '2016_01_01_000000_create_pages_table', 2),
(150, '2016_01_01_000000_create_posts_table', 2),
(151, '2016_02_15_204651_create_categories_table', 2),
(152, '2016_05_19_173453_create_menu_table', 2),
(153, '2016_10_21_190000_create_roles_table', 2),
(154, '2016_10_21_190000_create_settings_table', 2),
(155, '2016_11_30_135954_create_permission_table', 2),
(156, '2016_11_30_141208_create_permission_role_table', 2),
(157, '2016_12_26_201236_data_types__add__server_side', 2),
(158, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(159, '2017_01_14_005015_create_translations_table', 2),
(160, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(161, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(162, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(163, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(164, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(165, '2017_08_05_000000_add_group_to_settings_table', 2),
(166, '2017_11_26_013050_add_user_role_relationship', 2),
(167, '2017_11_26_015000_create_user_roles_table', 2),
(168, '2018_03_11_000000_add_user_settings', 2),
(169, '2018_03_14_000000_add_details_to_data_types_table', 2),
(170, '2018_03_16_000000_make_settings_value_nullable', 2),
(171, '2022_05_20_122247_create_products_table', 2),
(172, '2022_05_23_094425_create_category_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-05-24 19:57:37', '2022-05-24 19:57:37');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(2, 'browse_bread', NULL, '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(3, 'browse_database', NULL, '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(4, 'browse_media', NULL, '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(5, 'browse_compass', NULL, '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(6, 'browse_menus', 'menus', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(7, 'read_menus', 'menus', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(8, 'edit_menus', 'menus', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(9, 'add_menus', 'menus', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(10, 'delete_menus', 'menus', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(11, 'browse_roles', 'roles', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(12, 'read_roles', 'roles', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(13, 'edit_roles', 'roles', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(14, 'add_roles', 'roles', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(15, 'delete_roles', 'roles', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(16, 'browse_users', 'users', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(17, 'read_users', 'users', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(18, 'edit_users', 'users', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(19, 'add_users', 'users', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(20, 'delete_users', 'users', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(21, 'browse_settings', 'settings', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(22, 'read_settings', 'settings', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(23, 'edit_settings', 'settings', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(24, 'add_settings', 'settings', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(25, 'delete_settings', 'settings', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(26, 'browse_posts', 'posts', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(27, 'read_posts', 'posts', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(28, 'edit_posts', 'posts', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(29, 'add_posts', 'posts', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(30, 'delete_posts', 'posts', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(31, 'browse_pages', 'pages', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(32, 'read_pages', 'pages', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(33, 'edit_pages', 'pages', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(34, 'add_pages', 'pages', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(35, 'delete_pages', 'pages', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(36, 'browse_category', 'category', '2022-05-24 19:58:39', '2022-05-24 19:58:39'),
(37, 'read_category', 'category', '2022-05-24 19:58:39', '2022-05-24 19:58:39'),
(38, 'edit_category', 'category', '2022-05-24 19:58:39', '2022-05-24 19:58:39'),
(39, 'add_category', 'category', '2022-05-24 19:58:39', '2022-05-24 19:58:39'),
(40, 'delete_category', 'category', '2022-05-24 19:58:39', '2022-05-24 19:58:39'),
(41, 'browse_products', 'products', '2022-05-24 19:59:02', '2022-05-24 19:59:02'),
(42, 'read_products', 'products', '2022-05-24 19:59:02', '2022-05-24 19:59:02'),
(43, 'edit_products', 'products', '2022-05-24 19:59:02', '2022-05-24 19:59:02'),
(44, 'add_products', 'products', '2022-05-24 19:59:02', '2022-05-24 19:59:02'),
(45, 'delete_products', 'products', '2022-05-24 19:59:02', '2022-05-24 19:59:02');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-05-24 19:57:37', '2022-05-24 19:57:37');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_index` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `category_id`, `image`, `images`, `created_at`, `updated_at`) VALUES
(11, 'ROLLTOP KAKI', 'rolltop_kaki', 'Avec du chanvre et des lanières en cuir. Intérieur en coton.', 150, 'Avec du chanvre et des lanières en cuir. Intérieur en coton.', 1, 'products\\June2022\\QRT2kbWTKbCli7eDeJD6.jpg', '[\"products\\\\June2022\\\\JWFm2FOEypUObnyyQ4H6.jpg\"]', '2022-06-14 07:53:38', '2022-06-14 07:53:38'),
(15, 'ROLLTOP KAKI 2', 'rolltop_kaki_2', 'Avec du chanvre et des lanières en cuir. Intérieur en coton.', 150, 'Avec du chanvre et des lanières en cuir. Intérieur en coton.', 1, 'products\\June2022\\6jUBfhnYF2FPmAwro005.jpg', '[\"products\\\\June2022\\\\5mgwmKlEluyF7MwDXAOH.jpg\"]', '2022-06-14 07:54:56', '2022-06-14 07:54:56'),
(16, 'ROLLTOP KAKI 3', 'rolltop_kaki_3', 'Avec du chanvre et des lanières en cuir. Intérieur en coton.', 150, 'Avec du chanvre et des lanières en cuir. Intérieur en coton.', 1, 'products\\June2022\\ateUe6McNJZIf3WlfXi9.jpg', '[\"products\\\\June2022\\\\0FEGQHc4nQt1aKMU3lXB.jpg\"]', '2022-06-14 07:55:19', '2022-06-14 07:55:19');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-05-24 19:57:00', '2022-05-24 19:57:00'),
(2, 'user', 'Normal User', '2022-05-24 19:57:00', '2022-05-24 19:57:00');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 4, 'pt', 'Post', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(2, 'data_types', 'display_name_singular', 5, 'pt', 'Página', '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-05-24 19:57:37', '2022-05-24 19:57:37');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$G.LZIHSb89yew.DgYh1WUO0/pjs3ocU3fEzg92/aBuJ84i2aoJuNC', 'dKixMZeWQTCHK4Rc5m4FmpQXHNYkvCesPSxKT3TF7QJF88taCOnrA0CTgZyO', NULL, '2022-05-24 19:57:37', '2022-05-24 19:57:37'),
(2, 2, 'Axel Coelho', 'coelho.axel.pro@gmail.com', 'users/default.png', '$2y$10$MV.QRR7yaqfM2XUGfHtBLO7C/SaM3ewzDX9v20GAye9r0floIUnWi', 'pCSGa5kcmaeAHrJ7xz7UJl5iy2CRscK13G4548w3IxCRCWvPc6tprGo3O5kZ', NULL, '2022-05-25 09:35:32', '2022-05-25 12:39:26'),
(3, 2, 'Test', 'axel.coelho1@hotmail.fr', 'users/default.png', '$2y$10$kNliuDkn.aDNkp7D02aa7eOwf.qR/NmlV8EAT6ukNdlfwpUeAjvi6', '0ST15GOLA5x7KD0v07nQrKfMhKJi50z9KR0FaNMxPkRPzstbbxn9W9WkX3gk', '{\"locale\":\"fr\"}', '2022-05-27 10:32:14', '2022-05-27 10:32:14'),
(4, 2, 'TestTest', 'a.coelho.sin@gmail.com', 'users/default.png', '$2y$10$sIjWguyzI1WexDu.HY6ayOhbU1NjSW83vCVzTrCS2Gp7crYzkdhZO', NULL, NULL, '2022-05-27 10:54:52', '2022-05-27 10:54:52'),
(5, 2, 'naoobrd', 'naome.bornand@gmail.com', 'users/default.png', '$2y$10$UkxJVdwvD2ZOUEzWYmTIbuGS56C/KA0G39fEmX1/h6F5SUW13hyc2', 'xTvNlHfNRflLSzwBzqV3MdV10Z4ByUnBFN2QGCkeJzofqHQmFDonneHly3eT', NULL, '2022-05-29 10:18:19', '2022-05-29 10:18:19'),
(6, 2, 'juliabayonetta', 'e.ferreira.sin@gmail.com', 'users/default.png', '$2y$10$MbuZXg/UWU0Rq3i1lLYvWuGY4FzzZTG/d/eNn.ya4e2mDXEtKT.WC', 'ukyydz2ZRx3vZW9dBrzesVtmroCcByymM9xyCXvyGMsNh45EW2UjSQm7DMUC', NULL, '2022-05-29 11:13:53', '2022-05-29 11:13:53'),
(7, 2, 'Emma', 'emmacroziernoel69@gmail.com', 'users/default.png', '$2y$10$6UVZ00g0IVTbTeNngmZk9./0z2KqX8ydh1HynNl9Aj9iwRlqTwWiG', 'Cz3RKctbtvvIU6LK2gOZt2wRPUmKIRhixn529oJjxwL1P9f89H1Y2lyPu9Mn', NULL, '2022-05-29 11:42:20', '2022-05-29 11:42:20'),
(8, 2, 'Hugo Juannito', 'Hugoleplusbeau@gmail.com', 'users/default.png', '$2y$10$7xoGp0KTBeVI0ys1Y9Z/B.7rKGE5qgOXrk6BDZql/NLUwoidsB30e', 'vyXtdkW7MguJc8qrXS8DLiIn9r0RjX8W6RPeyQ47tTj5LKxYD4kaOhjo1M39', NULL, '2022-05-31 12:22:39', '2022-05-31 12:22:40'),
(9, 2, 'SecuWeb', 'secuweb@test.com', 'users/default.png', 'motdepasse', 'Abnp4MjH2FD4cwh1HfS2NDh144bcVQQhVrjIuL7wmkXnNLcDWTM9OkjRiJ6s', NULL, '2022-06-19 10:43:00', '2022-06-19 10:43:00'),
(11, 2, 'SécuWebTestAdmin', 'secuwebadmin@test.com', 'users/default.png', 'motdepasseenclair', 'vSX194OR1hnczpICTgL2aHZKazHrJHDea0Ltm6h5WerE8oJQk0gYe7uAgt9K', NULL, '2022-06-19 11:02:19', '2022-06-19 11:02:19'),
(12, 2, 'testcrsf', 'testcrsf@test.com', 'users/default.png', 'password', 'X7OdiE98BG3En4jHqjnPnEPVXP9Nre4FXDc2zhSlXZBJbZlp0wHBHemrJUk8', NULL, '2022-06-19 11:51:10', '2022-06-19 11:51:10');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
