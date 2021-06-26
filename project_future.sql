-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2021 at 06:38 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_future`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add image', 1, 'add_image'),
(2, 'Can change image', 1, 'change_image'),
(3, 'Can delete image', 1, 'delete_image'),
(4, 'Can view image', 1, 'view_image'),
(5, 'Can add labels', 2, 'add_labels'),
(6, 'Can change labels', 2, 'change_labels'),
(7, 'Can delete labels', 2, 'delete_labels'),
(8, 'Can view labels', 2, 'view_labels'),
(9, 'Can add languages', 3, 'add_languages'),
(10, 'Can change languages', 3, 'change_languages'),
(11, 'Can delete languages', 3, 'delete_languages'),
(12, 'Can view languages', 3, 'view_languages'),
(13, 'Can add objects', 4, 'add_objects'),
(14, 'Can change objects', 4, 'change_objects'),
(15, 'Can delete objects', 4, 'delete_objects'),
(16, 'Can view objects', 4, 'view_objects'),
(17, 'Can add rating', 5, 'add_rating'),
(18, 'Can change rating', 5, 'change_rating'),
(19, 'Can delete rating', 5, 'delete_rating'),
(20, 'Can view rating', 5, 'view_rating'),
(21, 'Can add image objects', 6, 'add_imageobjects'),
(22, 'Can change image objects', 6, 'change_imageobjects'),
(23, 'Can delete image objects', 6, 'delete_imageobjects'),
(24, 'Can view image objects', 6, 'view_imageobjects'),
(25, 'Can add image labels', 7, 'add_imagelabels'),
(26, 'Can change image labels', 7, 'change_imagelabels'),
(27, 'Can delete image labels', 7, 'delete_imagelabels'),
(28, 'Can view image labels', 7, 'view_imagelabels'),
(29, 'Can add log entry', 8, 'add_logentry'),
(30, 'Can change log entry', 8, 'change_logentry'),
(31, 'Can delete log entry', 8, 'delete_logentry'),
(32, 'Can view log entry', 8, 'view_logentry'),
(33, 'Can add permission', 9, 'add_permission'),
(34, 'Can change permission', 9, 'change_permission'),
(35, 'Can delete permission', 9, 'delete_permission'),
(36, 'Can view permission', 9, 'view_permission'),
(37, 'Can add group', 10, 'add_group'),
(38, 'Can change group', 10, 'change_group'),
(39, 'Can delete group', 10, 'delete_group'),
(40, 'Can view group', 10, 'view_group'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'admin', 'logentry'),
(10, 'auth', 'group'),
(9, 'auth', 'permission'),
(11, 'auth', 'user'),
(12, 'contenttypes', 'contenttype'),
(1, 'main', 'image'),
(7, 'main', 'imagelabels'),
(6, 'main', 'imageobjects'),
(2, 'main', 'labels'),
(3, 'main', 'languages'),
(4, 'main', 'objects'),
(5, 'main', 'rating'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-09 14:17:58.333003'),
(2, 'auth', '0001_initial', '2021-06-09 14:17:58.528769'),
(3, 'admin', '0001_initial', '2021-06-09 14:17:58.576753'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-06-09 14:17:58.581755'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-09 14:17:58.587756'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-06-09 14:17:58.613669'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-06-09 14:17:58.635674'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-06-09 14:17:58.645675'),
(9, 'auth', '0004_alter_user_username_opts', '2021-06-09 14:17:58.650677'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-06-09 14:17:58.668680'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-06-09 14:17:58.670681'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-06-09 14:17:58.676683'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-06-09 14:17:58.686684'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-06-09 14:17:58.695686'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-06-09 14:17:58.705688'),
(16, 'auth', '0011_update_proxy_permissions', '2021-06-09 14:17:58.711691'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-06-09 14:17:58.720693'),
(18, 'main', '0001_initial', '2021-06-09 14:17:58.877068'),
(19, 'sessions', '0001_initial', '2021-06-09 14:17:58.893071'),
(20, 'main', '0002_auto_20210609_1727', '2021-06-09 14:27:34.761333'),
(21, 'main', '0003_auto_20210609_1728', '2021-06-09 14:28:10.003110');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `main_image`
--

CREATE TABLE `main_image` (
  `id` bigint(20) NOT NULL,
  `user` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `login` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `main_imagelabels`
--

CREATE TABLE `main_imagelabels` (
  `id` bigint(20) NOT NULL,
  `score` double NOT NULL,
  `img_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_imagelabels`
--


-- --------------------------------------------------------

--
-- Table structure for table `main_imageobjects`
--

CREATE TABLE `main_imageobjects` (
  `id` bigint(20) NOT NULL,
  `score` double NOT NULL,
  `img_id` bigint(20) NOT NULL,
  `obj_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_imageobjects`
--


-- --------------------------------------------------------

--
-- Table structure for table `main_labels`
--

CREATE TABLE `main_labels` (
  `id` bigint(20) NOT NULL,
  `label_name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_labels`
--


-- --------------------------------------------------------

--
-- Table structure for table `main_languages`
--

CREATE TABLE `main_languages` (
  `id` bigint(20) NOT NULL,
  `language` longtext NOT NULL,
  `name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_languages`
--

INSERT INTO `main_languages` (`id`, `language`, `name`) VALUES
(1, 'af', 'Afrikaans'),
(2, 'sq', 'Albanian'),
(3, 'am', 'Amharic'),
(4, 'ar', 'Arabic'),
(5, 'hy', 'Armenian'),
(6, 'az', 'Azerbaijani'),
(7, 'eu', 'Basque'),
(8, 'be', 'Belarusian'),
(9, 'bn', 'Bengali'),
(10, 'bs', 'Bosnian'),
(11, 'bg', 'Bulgarian'),
(12, 'ca', 'Catalan'),
(13, 'ceb', 'Cebuano'),
(14, 'ny', 'Chichewa'),
(15, 'zh-CN', 'Chinese (Simplified)'),
(16, 'zh-TW', 'Chinese (Traditional)'),
(17, 'co', 'Corsican'),
(18, 'hr', 'Croatian'),
(19, 'cs', 'Czech'),
(20, 'da', 'Danish'),
(21, 'nl', 'Dutch'),
(22, 'en', 'English'),
(23, 'eo', 'Esperanto'),
(24, 'et', 'Estonian'),
(25, 'tl', 'Filipino'),
(26, 'fi', 'Finnish'),
(27, 'fr', 'French'),
(28, 'fy', 'Frisian'),
(29, 'gl', 'Galician'),
(30, 'ka', 'Georgian'),
(31, 'de', 'German'),
(32, 'el', 'Greek'),
(33, 'gu', 'Gujarati'),
(34, 'ht', 'Haitian Creole'),
(35, 'ha', 'Hausa'),
(36, 'haw', 'Hawaiian'),
(37, 'iw', 'Hebrew'),
(38, 'hi', 'Hindi'),
(39, 'hmn', 'Hmong'),
(40, 'hu', 'Hungarian'),
(41, 'is', 'Icelandic'),
(42, 'ig', 'Igbo'),
(43, 'id', 'Indonesian'),
(44, 'ga', 'Irish'),
(45, 'it', 'Italian'),
(46, 'ja', 'Japanese'),
(47, 'jw', 'Javanese'),
(48, 'kn', 'Kannada'),
(49, 'kk', 'Kazakh'),
(50, 'km', 'Khmer'),
(51, 'rw', 'Kinyarwanda'),
(52, 'ko', 'Korean'),
(53, 'ku', 'Kurdish (Kurmanji)'),
(54, 'ky', 'Kyrgyz'),
(55, 'lo', 'Lao'),
(56, 'la', 'Latin'),
(57, 'lv', 'Latvian'),
(58, 'lt', 'Lithuanian'),
(59, 'lb', 'Luxembourgish'),
(60, 'mk', 'Macedonian'),
(61, 'mg', 'Malagasy'),
(62, 'ms', 'Malay'),
(63, 'ml', 'Malayalam'),
(64, 'mt', 'Maltese'),
(65, 'mi', 'Maori'),
(66, 'mr', 'Marathi'),
(67, 'mn', 'Mongolian'),
(68, 'my', 'Myanmar (Burmese)'),
(69, 'ne', 'Nepali'),
(70, 'no', 'Norwegian'),
(71, 'or', 'Odia (Oriya)'),
(72, 'ps', 'Pashto'),
(73, 'fa', 'Persian'),
(74, 'pl', 'Polish'),
(75, 'pt', 'Portuguese'),
(76, 'pa', 'Punjabi'),
(77, 'ro', 'Romanian'),
(78, 'ru', 'Russian'),
(79, 'sm', 'Samoan'),
(80, 'gd', 'Scots Gaelic'),
(81, 'sr', 'Serbian'),
(82, 'st', 'Sesotho'),
(83, 'sn', 'Shona'),
(84, 'sd', 'Sindhi'),
(85, 'si', 'Sinhala'),
(86, 'sk', 'Slovak'),
(87, 'sl', 'Slovenian'),
(88, 'so', 'Somali'),
(89, 'es', 'Spanish'),
(90, 'su', 'Sundanese'),
(91, 'sw', 'Swahili'),
(92, 'sv', 'Swedish'),
(93, 'tg', 'Tajik'),
(94, 'ta', 'Tamil'),
(95, 'tt', 'Tatar'),
(96, 'te', 'Telugu'),
(97, 'th', 'Thai'),
(98, 'tr', 'Turkish'),
(99, 'tk', 'Turkmen'),
(100, 'uk', 'Ukrainian'),
(101, 'ur', 'Urdu'),
(102, 'ug', 'Uyghur'),
(103, 'uz', 'Uzbek'),
(104, 'vi', 'Vietnamese'),
(105, 'cy', 'Welsh'),
(106, 'xh', 'Xhosa'),
(107, 'yi', 'Yiddish'),
(108, 'yo', 'Yoruba'),
(109, 'zu', 'Zulu'),
(110, 'he', 'Hebrew'),
(111, 'zh', 'Chinese (Simplified)');

-- --------------------------------------------------------

--
-- Table structure for table `main_objects`
--

CREATE TABLE `main_objects` (
  `id` bigint(20) NOT NULL,
  `obj_name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_objects`
--

-- --------------------------------------------------------

--
-- Table structure for table `main_rating`
--

CREATE TABLE `main_rating` (
  `id` bigint(20) NOT NULL,
  `score` double NOT NULL,
  `img_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_rating`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_image`
--
ALTER TABLE `main_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_imagelabels`
--
ALTER TABLE `main_imagelabels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_imagelabels_img_id_51aded90_fk_main_image_id` (`img_id`),
  ADD KEY `main_imagelabels_label_id_836feaff_fk_main_labels_id` (`label_id`);

--
-- Indexes for table `main_imageobjects`
--
ALTER TABLE `main_imageobjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_imageobjects_img_id_c74d741b_fk_main_image_id` (`img_id`),
  ADD KEY `main_imageobjects_obj_id_42f1dc1f_fk_main_objects_id` (`obj_id`);

--
-- Indexes for table `main_labels`
--
ALTER TABLE `main_labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_name` (`label_name`) USING HASH;

--
-- Indexes for table `main_languages`
--
ALTER TABLE `main_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `language` (`language`) USING HASH;

--
-- Indexes for table `main_objects`
--
ALTER TABLE `main_objects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `obj_name` (`obj_name`) USING HASH;

--
-- Indexes for table `main_rating`
--
ALTER TABLE `main_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_rating_img_id_a284430e_fk_main_image_id` (`img_id`),
  ADD KEY `main_rating_user_id_e6b859a6_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `main_image`
--
ALTER TABLE `main_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `main_imagelabels`
--
ALTER TABLE `main_imagelabels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `main_imageobjects`
--
ALTER TABLE `main_imageobjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `main_labels`
--
ALTER TABLE `main_labels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `main_languages`
--
ALTER TABLE `main_languages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `main_objects`
--
ALTER TABLE `main_objects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `main_rating`
--
ALTER TABLE `main_rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_imagelabels`
--
ALTER TABLE `main_imagelabels`
  ADD CONSTRAINT `main_imagelabels_img_id_51aded90_fk_main_image_id` FOREIGN KEY (`img_id`) REFERENCES `main_image` (`id`),
  ADD CONSTRAINT `main_imagelabels_label_id_836feaff_fk_main_labels_id` FOREIGN KEY (`label_id`) REFERENCES `main_labels` (`id`);

--
-- Constraints for table `main_imageobjects`
--
ALTER TABLE `main_imageobjects`
  ADD CONSTRAINT `main_imageobjects_img_id_c74d741b_fk_main_image_id` FOREIGN KEY (`img_id`) REFERENCES `main_image` (`id`),
  ADD CONSTRAINT `main_imageobjects_obj_id_42f1dc1f_fk_main_objects_id` FOREIGN KEY (`obj_id`) REFERENCES `main_objects` (`id`);

--
-- Constraints for table `main_rating`
--
ALTER TABLE `main_rating`
  ADD CONSTRAINT `main_rating_img_id_a284430e_fk_main_image_id` FOREIGN KEY (`img_id`) REFERENCES `main_image` (`id`),
  ADD CONSTRAINT `main_rating_user_id_e6b859a6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
