-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2022 at 09:35 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rab`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` varchar(191) NOT NULL,
  `beginner_level_point` int(11) NOT NULL,
  `intermediate_level_point` int(11) NOT NULL,
  `expert_level_point` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `category_id`, `title`, `image`, `beginner_level_point`, `intermediate_level_point`, `expert_level_point`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Skiing', '50101658237659365.jpg', 0, 0, 0, '1', '2022-03-24 04:33:38', '2022-07-19 13:34:19'),
(2, 1, 'Hot Air Ballooning', '57931658237639562.jpeg', 0, 0, 0, '1', '2022-03-25 16:59:56', '2022-07-19 13:33:59'),
(3, 1, 'Paragliding', '64061658237618966.jpg', 0, 0, 0, '1', '2022-03-25 17:01:25', '2022-07-19 13:33:38'),
(4, 2, 'Bike', '14651658237512540.jpg', 0, 0, 0, '1', '2022-03-26 13:51:18', '2022-07-19 13:31:52'),
(5, 2, 'Car', '94431658237505997.jpg', 0, 0, 0, '1', '2022-03-26 13:51:26', '2022-07-19 13:31:45'),
(6, 2, 'Cycle', '22571658237373682.jpg', 0, 0, 0, '1', '2022-03-26 13:51:56', '2022-07-27 09:45:35'),
(14, 1, 'River Rafting', '81271658237609814.jpg', 0, 0, 0, '1', '2022-04-22 12:48:14', '2022-07-19 13:33:29'),
(15, 1, 'Surfing', '35911658237554814.jpg', 0, 0, 0, '1', '2022-04-22 12:49:15', '2022-07-19 13:32:34'),
(16, 1, 'Bungee Jumping', '83781658237543379.jpg', 5, 10, 15, '1', '2022-04-22 12:49:33', '2022-07-28 07:44:04'),
(17, 1, 'Water Sports', '68301658237530817.jpg', 10, 20, 30, '1', '2022-04-22 12:49:58', '2022-07-27 07:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `activity_add_ons`
--

CREATE TABLE `activity_add_ons` (
  `id` int(11) NOT NULL,
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `item_name` varchar(191) NOT NULL,
  `item_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_add_on_histories`
--

CREATE TABLE `activity_add_on_histories` (
  `id` int(11) NOT NULL,
  `activity_share_history_fk` int(11) NOT NULL COMMENT 'adventure_activity_histories, rental_activity_histories tables (pk)',
  `activity_add_on_id` int(11) NOT NULL COMMENT 'activity_add_ons table (pk)',
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `item_name` varchar(191) NOT NULL,
  `item_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `activity_adventure_list_dates`
--

CREATE TABLE `activity_adventure_list_dates` (
  `id` int(11) NOT NULL,
  `adventure_activity_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_adventure_list_date_histories`
--

CREATE TABLE `activity_adventure_list_date_histories` (
  `id` int(11) NOT NULL,
  `adventure_activity_history_id` int(11) NOT NULL COMMENT 'adventure_activity_histories table (pk)',
  `activity_adventure_list_date_id` int(11) NOT NULL COMMENT 'activity_adventure_list_dates table (pk)',
  `adventure_activity_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_adventure_types`
--

CREATE TABLE `activity_adventure_types` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity_adventure_types`
--

INSERT INTO `activity_adventure_types` (`id`, `activity_id`, `name`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Alpine or downhill skiing', '1', '2022-04-18 13:14:30', '2022-04-22 12:52:23'),
(2, 3, 'First paraglider: Supair EONA', '1', '2022-04-22 09:48:42', '2022-04-22 12:42:21'),
(3, 3, 'Progression paraglider: Skywalk TEQUILA 4', '1', '2022-04-22 10:02:55', '2022-04-22 12:42:35'),
(4, 3, 'XC paraglider: Advance IOTA', '1', '2022-04-22 12:42:47', '2022-04-22 12:42:47'),
(5, 3, 'Sports paraglider: Niviuk Artik 4', '1', '2022-04-22 12:42:59', '2022-04-22 12:42:59'),
(6, 3, 'Performance paraglider: Gin GTO 2', '1', '2022-04-22 12:43:07', '2022-04-22 12:43:07'),
(7, 2, 'Montgolfier Hot Air Balloon', '1', '2022-04-22 12:44:31', '2022-04-22 12:44:31'),
(8, 2, 'Sky Lanterns', '1', '2022-04-22 12:44:43', '2022-04-22 12:44:43'),
(9, 2, 'Long Distance And Roziere Hot Air Balloons', '1', '2022-04-22 12:44:53', '2022-04-22 12:44:53'),
(10, 2, 'Tourism Hot Air Balloons', '1', '2022-04-22 12:45:03', '2022-04-22 12:45:03'),
(11, 2, 'Racing Hot Air Balloons', '1', '2022-04-22 12:45:11', '2022-04-22 12:45:11'),
(12, 2, 'Observation Balloons', '1', '2022-04-22 12:45:20', '2022-04-22 12:45:20'),
(13, 2, 'Artillery Balloons', '1', '2022-04-22 12:45:30', '2022-04-22 12:45:30'),
(14, 2, 'Novelty Hot Air Balloons', '1', '2022-04-22 12:45:39', '2022-04-22 12:45:39'),
(15, 2, 'Marketing Hot Air Balloons', '1', '2022-04-22 12:45:49', '2022-04-22 12:45:49'),
(16, 1, 'Cross-country skiing', '1', '2022-04-22 12:52:38', '2022-04-22 12:52:38'),
(17, 1, 'Freestyle skiing', '1', '2022-04-22 12:52:48', '2022-04-22 12:52:48'),
(18, 1, 'Snowboarding', '1', '2022-04-22 12:52:58', '2022-04-22 12:52:58'),
(19, 1, 'Off-piste skiing', '1', '2022-04-22 12:53:06', '2022-04-22 12:53:06'),
(20, 1, 'Telemark Skiing', '1', '2022-04-22 12:53:15', '2022-04-22 12:53:15'),
(21, 1, 'Adaptive Skiing', '1', '2022-04-22 12:53:29', '2022-04-22 12:53:29'),
(22, 14, 'Paddle Boats', '1', '2022-04-22 12:55:00', '2022-04-22 12:55:00'),
(23, 14, 'R-2 (raft- 2 people)', '1', '2022-04-22 12:55:19', '2022-04-22 12:55:19'),
(24, 14, 'Oar/paddle Combos (Stern Mounts)', '1', '2022-04-22 12:55:29', '2022-04-22 12:55:29'),
(25, 14, 'Gear Boat', '1', '2022-04-22 12:55:41', '2022-04-22 12:55:41'),
(26, 14, 'Oar Boat', '1', '2022-04-22 12:56:00', '2022-04-22 12:56:00'),
(27, 14, 'Catarafts', '1', '2022-04-22 12:56:15', '2022-04-22 12:56:15'),
(28, 14, 'Motor Rafts', '1', '2022-04-22 12:56:38', '2022-04-22 12:56:38'),
(29, 14, 'Dories', '1', '2022-04-22 12:56:46', '2022-04-22 12:56:46'),
(30, 15, 'Beach breaks', '1', '2022-04-22 12:57:55', '2022-04-22 12:57:55'),
(31, 15, 'Reef breaks', '1', '2022-04-22 12:58:04', '2022-04-22 12:58:04'),
(32, 15, 'Point breaks', '1', '2022-04-22 12:58:14', '2022-04-22 12:58:14'),
(33, 15, 'Rivermouth waves', '1', '2022-04-22 12:58:22', '2022-04-22 12:58:22'),
(34, 15, 'Reform waves', '1', '2022-04-22 12:58:32', '2022-04-22 12:58:32'),
(35, 15, 'Crumbly waves', '1', '2022-04-22 12:58:41', '2022-04-22 12:58:41'),
(36, 15, 'Double-up waves', '1', '2022-04-22 12:58:48', '2022-04-22 12:58:48'),
(37, 16, 'Bungee Jump', '1', '2022-04-22 13:00:40', '2022-04-22 13:00:40'),
(38, 16, 'Catapult', '1', '2022-04-22 13:00:48', '2022-04-28 10:48:25'),
(39, 16, 'Twin Tower', '1', '2022-04-22 13:01:07', '2022-04-22 13:01:07'),
(40, 16, 'Bungee Run', '1', '2022-04-22 13:01:17', '2022-04-22 13:01:17'),
(41, 16, 'Snow Bungee Canoe', '1', '2022-04-22 13:01:29', '2022-04-22 13:01:29'),
(42, 17, 'Surfing', '1', '2022-04-22 13:02:15', '2022-04-22 13:02:15'),
(43, 17, 'Sailing', '1', '2022-04-22 13:02:23', '2022-04-22 13:02:23'),
(44, 17, 'Swimming', '1', '2022-04-22 13:02:30', '2022-04-22 13:02:30'),
(45, 17, 'Wind Surfing', '1', '2022-04-22 13:02:37', '2022-04-22 13:02:37'),
(46, 17, 'Jet Skiing', '1', '2022-04-22 13:02:46', '2022-04-22 13:02:46'),
(47, 17, 'Wake Boarding', '1', '2022-04-22 13:02:59', '2022-04-22 13:02:59'),
(48, 17, 'Water Skiing', '1', '2022-04-22 13:03:06', '2022-06-24 19:02:34'),
(49, 17, 'Kite Surfing', '1', '2022-04-22 13:03:14', '2022-04-22 13:03:14'),
(50, 17, 'Skimboarding', '1', '2022-04-22 13:03:21', '2022-04-22 13:03:21'),
(51, 17, 'Bodyboarding', '1', '2022-04-22 13:03:30', '2022-04-22 13:03:30'),
(52, 17, 'Cliff Diving', '1', '2022-04-22 13:03:36', '2022-04-22 13:03:36'),
(53, 17, 'Scuba Diving', '1', '2022-04-22 13:03:44', '2022-04-22 13:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `activity_auto_time_sheets`
--

CREATE TABLE `activity_auto_time_sheets` (
  `id` int(11) NOT NULL,
  `activity_time_sheet_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `slot_time_duration` time NOT NULL,
  `day_slot` int(11) NOT NULL,
  `time_slot` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_auto_time_sheet_histories`
--

CREATE TABLE `activity_auto_time_sheet_histories` (
  `id` int(11) NOT NULL,
  `activity_time_sheet_history_id` int(11) NOT NULL COMMENT 'activity_auto_time_sheets table (pk)',
  `activity_auto_time_sheet_id` int(11) NOT NULL COMMENT 'activity_auto_time_sheets table (pk)',
  `activity_time_sheet_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `slot_time_duration` time NOT NULL,
  `day_slot` int(11) NOT NULL,
  `time_slot` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_day_sheets`
--

CREATE TABLE `activity_day_sheets` (
  `id` int(11) NOT NULL,
  `adventure_activity_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'Daily Duration',
  `start_date` date NOT NULL,
  `no_of_spot` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active	',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_day_sheet_days`
--

CREATE TABLE `activity_day_sheet_days` (
  `id` int(11) NOT NULL,
  `activity_day_sheet_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `itinerary` text NOT NULL,
  `copy_day_sheet_day_id` int(11) DEFAULT NULL COMMENT 'Activity repeat in future',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_day_sheet_day_histories`
--

CREATE TABLE `activity_day_sheet_day_histories` (
  `id` int(11) NOT NULL,
  `activity_day_sheet_history_id` int(11) NOT NULL COMMENT 'activity_day_sheet_histories table (pk)',
  `activity_day_sheet_day_id` int(11) NOT NULL COMMENT 'activity_day_sheet_days table (pk)',
  `activity_day_sheet_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `itinerary` text NOT NULL,
  `copy_day_sheet_day_id` int(11) DEFAULT NULL COMMENT 'Activity repeat in future',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_day_sheet_histories`
--

CREATE TABLE `activity_day_sheet_histories` (
  `id` int(11) NOT NULL,
  `adventure_activity_history_id` int(11) NOT NULL COMMENT 'adventure_activity_histories table (pk)',
  `activity_day_sheet_id` int(11) NOT NULL COMMENT 'activity_day_sheets table (pk)',
  `adventure_activity_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'Daily Duration',
  `start_date` date NOT NULL,
  `no_of_spot` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active	',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_flexd_time_sheets`
--

CREATE TABLE `activity_flexd_time_sheets` (
  `id` int(11) NOT NULL,
  `activity_time_sheet_id` int(11) NOT NULL,
  `duration` time NOT NULL,
  `start_time` time NOT NULL,
  `day_quantity` int(111) NOT NULL,
  `duration_quantity` int(11) NOT NULL,
  `itinerary` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_flexd_time_sheet_histories`
--

CREATE TABLE `activity_flexd_time_sheet_histories` (
  `id` int(11) NOT NULL,
  `activity_time_sheet_history_id` int(11) NOT NULL COMMENT 'activity_time_sheet_histories table (pk)',
  `activity_flexd_time_sheet_id` int(11) NOT NULL COMMENT 'activity_flexd_time_sheets table (pk)',
  `activity_time_sheet_id` int(11) NOT NULL,
  `duration` time NOT NULL,
  `start_time` time NOT NULL,
  `day_quantity` int(11) NOT NULL,
  `duration_quantity` int(11) NOT NULL,
  `itinerary` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_media`
--

CREATE TABLE `activity_media` (
  `id` int(11) NOT NULL,
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` int(11) NOT NULL COMMENT '1 = Adventure, 2 = Rental',
  `media_type` enum('1','2') NOT NULL COMMENT '1 = Image, 2 = Video',
  `media_path` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_media_histories`
--

CREATE TABLE `activity_media_histories` (
  `id` int(11) NOT NULL,
  `activity_share_history_fk` int(11) NOT NULL COMMENT 'adventure_activity_histories, rental_activity_histories tables (pk)',
  `activity_media_id` int(11) NOT NULL COMMENT 'activity_media tables (pk)',
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` int(11) NOT NULL COMMENT '1 = Adventure, 2 = Rental',
  `media_type` enum('1','2') NOT NULL COMMENT '1 = Image, 2 = Video',
  `media_path` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_meeting_points`
--

CREATE TABLE `activity_meeting_points` (
  `id` int(11) NOT NULL,
  `adventure_activity_id` int(11) NOT NULL,
  `is_extra_charges` enum('0','1') NOT NULL COMMENT '0 => No, 1 => Yes',
  `address_line_one` varchar(191) NOT NULL,
  `address_line_two` varchar(191) DEFAULT NULL,
  `landmark` varchar(191) NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pin_code` int(11) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_meeting_point_histories`
--

CREATE TABLE `activity_meeting_point_histories` (
  `id` int(11) NOT NULL,
  `adventure_activity_history_id` int(11) NOT NULL COMMENT 'adventure_activity_histories table (pk)',
  `activity_meeting_point_id` int(11) NOT NULL COMMENT 'activity_meeting_points table (pk)',
  `adventure_activity_id` int(11) NOT NULL,
  `is_extra_charges` enum('0','1') NOT NULL COMMENT '0 => No, 1 => Yes',
  `address_line_one` varchar(191) NOT NULL,
  `address_line_two` varchar(191) DEFAULT NULL,
  `landmark` varchar(191) NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pin_code` int(11) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_prices`
--

CREATE TABLE `activity_prices` (
  `id` int(11) NOT NULL,
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `rate_type` enum('1','2','3') NOT NULL COMMENT '1 => /hour, 2 => /day, 3 =>/person',
  `no_of_person` int(11) DEFAULT NULL,
  `vendor_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_price_histories`
--

CREATE TABLE `activity_price_histories` (
  `id` int(11) NOT NULL,
  `activity_share_history_fk` int(11) NOT NULL COMMENT 'adventure_activity_histories, rental_activity_histories tables (pk)',
  `activity_price_id` int(11) NOT NULL COMMENT 'activity_prices tables (pk)',
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `rate_type` enum('1','2','3') NOT NULL COMMENT '1 => /hour, 2 => /day, 3 =>/person',
  `no_of_person` int(11) DEFAULT NULL,
  `vendor_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_require_accessories`
--

CREATE TABLE `activity_require_accessories` (
  `id` int(11) NOT NULL,
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '	1 => Adventure, 2 => Rental',
  `accessories_medium` enum('1','2') NOT NULL COMMENT '1 => What to take, 2 => Things & services included',
  `name` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_require_accessory_histories`
--

CREATE TABLE `activity_require_accessory_histories` (
  `id` int(11) NOT NULL,
  `activity_share_history_fk` int(11) NOT NULL COMMENT 'adventure_activity_histories, rental_activity_histories tables (pk)',
  `activity_require_accessory_id` int(11) NOT NULL COMMENT 'activity_require_accessories tables (pk)',
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '	1 => Adventure, 2 => Rental',
  `accessories_medium` enum('1','2') NOT NULL COMMENT '1 => What to take, 2 => Things & services included',
  `name` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_time_sheets`
--

CREATE TABLE `activity_time_sheets` (
  `id` int(11) NOT NULL,
  `adventure_activity_id` int(11) NOT NULL,
  `slot_type` enum('1','2','3','4','5') NOT NULL COMMENT '1 => Auto, 2 => Manual, 3 => Morning, 4 => Afternoon, 5 => Evening',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_time_sheet_histories`
--

CREATE TABLE `activity_time_sheet_histories` (
  `id` int(11) NOT NULL,
  `adventure_activity_history_id` int(11) NOT NULL COMMENT 'adventure_activity_histories table (pk)',
  `activity_time_sheet_id` int(11) NOT NULL COMMENT 'activity_time_sheets table (pk)',
  `adventure_activity_id` int(11) NOT NULL,
  `slot_type` enum('1','2','3','4','5') NOT NULL COMMENT '1 => Auto, 2 => Manual, 3 => Morning, 4 => Afternoon, 5 => Evening',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_time_sheet_times`
--

CREATE TABLE `activity_time_sheet_times` (
  `id` int(11) NOT NULL,
  `activity_time_sheet_id` int(11) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_time_sheet_time_histories`
--

CREATE TABLE `activity_time_sheet_time_histories` (
  `id` int(11) NOT NULL,
  `activity_time_sheet_history_id` int(11) NOT NULL COMMENT 'activity_time_sheet_histories table (pk)',
  `activity_time_sheet_id` int(11) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_vehicle_details`
--

CREATE TABLE `activity_vehicle_details` (
  `id` int(11) NOT NULL,
  `activity_share_fk` int(11) NOT NULL COMMENT 'rental_activities table (pk)	',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `year` year(4) NOT NULL,
  `registration_no` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_vehicle_detail_histories`
--

CREATE TABLE `activity_vehicle_detail_histories` (
  `id` int(11) NOT NULL,
  `activity_share_history_fk` int(11) NOT NULL COMMENT 'rental_activities table (pk)',
  `activity_vehicle_detail_id` int(11) NOT NULL COMMENT 'activity_vehicle_details tables (pk)',
  `activity_share_fk` int(11) NOT NULL COMMENT 'rental_activities table (pk)	',
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `year` year(4) NOT NULL,
  `registration_no` varchar(191) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adventure_activities`
--

CREATE TABLE `adventure_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `activity_adventure_type_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `level` enum('1','2','3') NOT NULL COMMENT '1 => Beginner, 2 => Intermediate, 3 => Expert',
  `altitude_depth_height` decimal(10,3) NOT NULL,
  `age_from` int(2) NOT NULL,
  `age_to` int(2) NOT NULL,
  `language` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `warning` text NOT NULL,
  `is_pickup` enum('0','1') NOT NULL,
  `activity_type` enum('1','2') NOT NULL COMMENT '1 => Single Day, 2 => Multiple Day',
  `single_day_categories` enum('1','2','3') DEFAULT NULL COMMENT '1 => Fixed, 2 => Flexd, 3 => No ',
  `is_provide_all_parts` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `is_website` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `website_link` varchar(191) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_vendor_discount` enum('0','1') NOT NULL DEFAULT '0',
  `is_approved` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => Not Approved , 1 => Approved',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adventure_activity_histories`
--

CREATE TABLE `adventure_activity_histories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `adventure_activity_id` int(11) NOT NULL COMMENT 'adventure_activities table (pk)',
  `activity_adventure_type_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `level` enum('1','2','3') NOT NULL COMMENT '1 => Beginner, 2 => Intermediate, 3 => Expert',
  `altitude_depth_height` decimal(10,3) NOT NULL,
  `age_from` int(11) NOT NULL,
  `age_to` int(11) NOT NULL,
  `language` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `warning` text NOT NULL,
  `is_pickup` enum('0','1') NOT NULL,
  `activity_type` enum('1','2') NOT NULL COMMENT '1 => Single Day, 2 => Multiple Day',
  `single_day_categories` enum('1','2','3') DEFAULT NULL COMMENT '1 => Fixed, 2 => Flexd, 3 => No ',
  `is_provide_all_parts` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `is_website` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `website_link` varchar(191) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_vendor_discount` enum('0','1') NOT NULL DEFAULT '0',
  `is_approved` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => Not Approved , 1 => Approved',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `is_skip` enum('0','1') NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_holder_name` varchar(50) NOT NULL,
  `account_no` varchar(50) NOT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfer_transactions`
--

CREATE TABLE `bank_transfer_transactions` (
  `id` int(11) NOT NULL,
  `razorpay_account_id` int(11) NOT NULL,
  `transaction_payment_ref` varchar(191) NOT NULL,
  `entity` varchar(20) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `method` varchar(20) NOT NULL,
  `customer_id` varchar(191) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_share_type` enum('1','2') NOT NULL COMMENT '1 => Adventure, 2 => Rental',
  `activity_share_fk` int(11) NOT NULL COMMENT 'adventure_activities, rental_activities tables (pk)',
  `activity_history_share_fk` int(11) DEFAULT NULL COMMENT 'adventure_activity_histories, rental_activity_histories tables (pk)',
  `quantity` int(11) NOT NULL,
  `price_type` enum('1','2','3') NOT NULL COMMENT '1 => /person , 2 => /hour , 3 => /day',
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_pickup` enum('0','1') NOT NULL DEFAULT '0',
  `activity_slot_sheet_share_fk` int(11) DEFAULT NULL COMMENT 'activity_time_sheet_times, activity_day_sheets tables (pk)',
  `status` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '1 => pending , 2 => in-progress , 3 => abandoned , 4 => completed , 5 => cancelled',
  `is_skip` enum('0','1') NOT NULL DEFAULT '0',
  `is_referral_code` enum('0','1') NOT NULL DEFAULT '0',
  `level_points` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_add_ons`
--

CREATE TABLE `booking_add_ons` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `activity_add_on_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_payments`
--

CREATE TABLE `booking_payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `taxi_booking_id` int(11) DEFAULT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_referrals`
--

CREATE TABLE `booking_referrals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `referral_code` varchar(191) NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active, 2 => Abandoned',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_refunds`
--

CREATE TABLE `booking_refunds` (
  `id` int(11) NOT NULL,
  `booking_payment_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_user_details`
--

CREATE TABLE `booking_user_details` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Bajaj', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'CHEVROLET', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DATSUN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Fiat', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Ford', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Hero', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'HONDA', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'KIA', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Mahindra', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'MARUTI SUZUKI', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'NISSAN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'RENAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Royal Enfield', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'SKODA', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'TATA', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'TVS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Toyota', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Volkswagen', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Yamaha', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `brand_vehicle_types`
--

CREATE TABLE `brand_vehicle_types` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '	0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand_vehicle_types`
--

INSERT INTO `brand_vehicle_types` (`id`, `brand_id`, `activity_id`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 2, 5, '1', '2022-04-04 14:36:26', '2022-04-04 14:36:26'),
(2, 3, 5, '1', '2022-04-04 15:49:51', '2022-04-04 15:49:51'),
(3, 4, 5, '1', '2022-04-22 23:24:00', '2022-04-22 23:24:00'),
(4, 5, 5, '1', '2022-04-22 23:24:00', '2022-04-22 23:24:00'),
(5, 7, 5, '1', '2022-04-22 23:24:57', '2022-04-22 23:24:57'),
(6, 8, 5, '1', '2022-04-22 23:24:57', '2022-04-22 23:24:57'),
(7, 9, 5, '1', '2022-04-22 23:25:27', '2022-04-22 23:25:27'),
(8, 10, 5, '1', '2022-04-22 23:25:27', '2022-04-22 23:25:27'),
(9, 11, 5, '1', '2022-04-22 23:25:59', '2022-04-22 23:25:59'),
(10, 12, 5, '1', '2022-04-22 23:25:59', '2022-04-22 23:25:59'),
(11, 14, 5, '1', '2022-04-22 23:26:19', '2022-04-22 23:26:19'),
(12, 15, 5, '1', '2022-04-22 23:46:22', '2022-04-22 23:46:22'),
(13, 17, 5, '1', '2022-04-22 23:46:22', '2022-04-22 23:46:22'),
(14, 18, 5, '1', '2022-04-22 23:47:43', '2022-04-22 23:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Adventure', '1', '2022-02-08 05:44:53', '2022-04-22 09:48:31'),
(2, 'Rental', '1', '2022-02-08 05:44:53', '2022-02-08 05:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `message` longtext NOT NULL,
  `reply_message` longtext DEFAULT NULL,
  `is_reply` enum('0','1') NOT NULL COMMENT '0 => No, 1 => Yes',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_business_details`
--

CREATE TABLE `hotel_business_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_name` varchar(191) NOT NULL,
  `aletrnate_country_iso` varchar(10) NOT NULL,
  `aletrnate_country_code` varchar(10) NOT NULL,
  `aletrnate_mobile_no` bigint(20) NOT NULL,
  `location` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `gst_no` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Vendor',
  `identity` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location_images`
--

CREATE TABLE `location_images` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `brand_id`, `name`, `type`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 5, 'Aspire', 'Compact Sedan', '1', '2022-02-08 05:44:54', '2022-04-04 12:21:20'),
(2, 5, 'Eco Sport', 'Compact SUV', '1', '2022-02-08 05:44:54', '2022-02-08 05:44:54'),
(3, 5, 'Endeavour', 'SUV', '1', '2022-02-08 05:44:54', '2022-02-08 05:44:54'),
(4, 5, 'Figo', 'Hatchback', '1', '2022-02-08 05:44:54', '2022-02-08 05:44:54'),
(5, 5, 'Freestyle', 'Hatchback', '1', '2022-02-08 05:44:54', '2022-02-08 05:44:54'),
(6, 7, 'Amaze', 'Sedan', '1', '2022-02-08 05:44:54', '2022-02-08 05:44:54'),
(7, 7, 'CITY', 'Sedan', '1', '2022-03-25 07:51:36', '2022-03-25 07:51:36'),
(8, 7, 'JAZZ', 'Compact SUV', '1', '2022-03-25 07:54:17', '2022-03-25 07:54:17'),
(9, 7, 'WR-V', 'Compact SUV', '1', '2022-03-25 07:55:06', '2022-03-25 07:55:06'),
(10, 8, 'Carens', 'Compact SUV', '1', '2022-03-25 08:02:40', '2022-03-25 08:02:40'),
(11, 8, 'Seltos', 'Compact SUV', '1', '2022-03-25 08:02:40', '2022-03-25 08:02:40'),
(12, 8, 'Sonet', 'Compact SUV', '1', '2022-03-25 08:03:51', '2022-03-25 08:03:51'),
(13, 9, 'Alturas G4', 'SUV', '1', '2022-03-25 08:05:30', '2022-03-25 08:05:30'),
(14, 9, 'Bolero', 'SUV', '1', '2022-03-25 08:06:33', '2022-03-25 08:06:33'),
(15, 9, 'Bolero Neo', 'SUV', '1', '2022-03-25 08:07:43', '2022-03-25 08:07:43'),
(16, 9, 'KUV100 NXT', 'Hatchback', '1', '2022-03-25 08:09:06', '2022-03-25 08:09:06'),
(17, 9, 'Marazzo', 'SUV', '1', '2022-03-25 08:12:24', '2022-03-25 08:12:24'),
(18, 9, 'Thar', 'Compact SUV', '1', '2022-03-25 10:10:21', '2022-03-25 10:10:21'),
(19, 9, 'XUV300', 'Compact SUV', '1', '2022-03-25 10:10:59', '2022-03-25 10:10:59'),
(20, 9, 'XUV700', 'SUV', '1', '2022-03-25 10:12:12', '2022-03-25 10:12:12'),
(21, 2, 'Beat', 'Hatchback', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(22, 2, 'Cruze', 'Sedan', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(23, 2, 'Enjoy', 'SUV', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(24, 2, 'Sail', 'Sedan', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(25, 2, 'Sail U-VA', 'Hatchback', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(26, 2, 'Spark', 'Hatchback', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(27, 2, 'Tavera Neo 3', 'SUV', '1', '2022-04-23 00:20:06', '2022-04-23 00:20:06'),
(28, 3, 'Datsun GO', 'Hatchback', '1', '2022-04-23 00:24:15', '2022-04-23 00:24:15'),
(29, 3, 'Datsun GO+', 'Compact SUV', '1', '2022-04-23 00:24:15', '2022-04-23 00:24:15'),
(30, 3, 'Datsun redi-GO', 'Hatchback', '1', '2022-04-23 00:24:15', '2022-04-23 00:24:15'),
(31, 4, 'Adventure', 'Hatchback', '1', '2022-04-23 00:31:33', '2022-04-23 00:31:33'),
(32, 4, 'Abarth Avventura', 'Hatchback', '1', '2022-04-23 00:31:33', '2022-04-23 00:31:33'),
(33, 4, 'Linea', 'Sedan', '1', '2022-04-23 00:31:33', '2022-04-23 00:31:33'),
(34, 4, 'Palio', 'Hatchback', '1', '2022-04-23 00:31:33', '2022-04-23 00:31:33'),
(35, 4, 'Petra', 'Sedan', '1', '2022-04-23 00:31:33', '2022-04-23 00:31:33'),
(36, 4, 'Punto', 'Hatchback', '1', '2022-04-23 00:31:33', '2022-04-23 00:31:33'),
(37, 10, 'Alto', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(38, 10, 'Baleno', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(39, 10, 'Celerio', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(40, 10, 'Ciaz', 'Sedan', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(41, 10, 'Dzire', 'Sedan', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(42, 10, 'Echo', 'Mini Van', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(43, 10, 'Ertiga', 'SUV', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(44, 10, 'Ignis', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(45, 10, 'S-Cross', 'Compact SUV', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(46, 10, 'S-Presso', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(47, 10, 'Swift', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(48, 10, 'Vitara Brezza', 'Compact SUV', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(49, 10, 'Wagon R', 'Hatchback', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(50, 10, 'XL6', 'Compact SUV', '1', '2022-04-23 00:43:28', '2022-04-23 00:43:28'),
(51, 11, 'Kicks', 'Compact SUV', '1', '2022-04-23 21:06:40', '2022-04-23 21:06:40'),
(52, 11, 'Micra', 'Hatchback', '1', '2022-04-23 21:06:40', '2022-04-23 21:06:40'),
(53, 11, 'Sunny', 'Sedan', '1', '2022-04-23 21:06:40', '2022-04-23 21:06:40'),
(54, 11, 'Terrano', 'Compact SUV', '1', '2022-04-23 21:06:40', '2022-04-23 21:06:40'),
(55, 12, 'Duster', 'Compact SUV', '1', '2022-04-23 21:07:12', '2022-04-23 21:07:12'),
(56, 12, 'Kiger', 'Compact SUV', '1', '2022-04-23 21:07:12', '2022-04-23 21:07:12'),
(57, 12, 'Kwid', 'Hatchback', '1', '2022-04-23 21:07:12', '2022-04-23 21:07:12'),
(58, 12, 'Triber', 'Compact SUV', '1', '2022-04-23 21:07:12', '2022-04-23 21:07:12'),
(59, 14, 'Kodiaq', 'SUV', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(60, 14, 'Kushaq', 'Compact SUV', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(61, 14, 'Kushaq Monte Carlo', 'Compact SUV', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(62, 14, 'Octavia', 'Sedan', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(63, 14, 'Rapid TSI', 'Sedan', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(64, 14, 'Slavia', 'Sedan', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(65, 14, 'Superb', 'Sedan', '1', '2022-04-23 21:13:25', '2022-04-23 21:13:25'),
(66, 15, 'Altroz', 'Hatchback', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(67, 15, 'Harrier', 'Compact SUV', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(68, 15, 'Nexon', 'Compact SUV', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(69, 15, 'Safari', 'SUV', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(70, 15, 'Tiago', 'Hatchback', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(71, 15, 'Tigor', 'Compact Sedan', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(72, 15, 'Punch', 'Hatchback', '1', '2022-04-23 21:20:26', '2022-04-23 21:20:26'),
(73, 17, 'Camry', 'Sedan', '1', '2022-04-23 21:25:17', '2022-04-23 21:25:17'),
(74, 17, 'Fortuner', 'SUV', '1', '2022-04-23 21:25:17', '2022-04-23 21:25:17'),
(75, 17, 'Glanza', 'Hatchback', '1', '2022-04-23 21:25:17', '2022-04-23 21:25:17'),
(76, 17, 'Hilux', 'SUV', '1', '2022-04-23 21:25:17', '2022-04-23 21:25:17'),
(77, 17, 'Innova Crysta', 'SUV', '1', '2022-04-23 21:25:17', '2022-04-23 21:25:17'),
(78, 17, 'Urban Cruiser', 'Compact SUV', '1', '2022-04-23 21:25:17', '2022-04-23 21:25:17'),
(79, 18, 'Polo', 'Hatchback', '1', '2022-04-23 21:29:04', '2022-04-23 21:29:04'),
(80, 18, 'Taigun', 'Compact SUV', '1', '2022-04-23 21:29:04', '2022-04-23 21:29:04'),
(81, 18, ' Tiguan', 'Compact SUV', '1', '2022-04-23 21:29:04', '2022-04-23 21:29:04'),
(82, 18, 'Vento', 'Sedan', '1', '2022-04-23 21:29:04', '2022-04-23 21:29:04'),
(83, 18, 'Virtus', 'Sedan', '1', '2022-04-23 21:29:04', '2022-04-23 21:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `description`, `createdAt`, `updatedAt`) VALUES
(1, '<p>Hi i am privacy &amp; policy.</p>', '2022-04-04 15:29:44', '2022-08-01 10:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `rating_reviews`
--

CREATE TABLE `rating_reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `taxi_booking_id` int(11) DEFAULT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `review` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_accounts`
--

CREATE TABLE `razorpay_accounts` (
  `id` int(11) NOT NULL,
  `razorpay_customer_id` int(11) NOT NULL,
  `entity` varchar(20) NOT NULL,
  `account_id` varchar(191) NOT NULL,
  `event` varchar(50) NOT NULL,
  `json_response` longtext NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_bank_transfers`
--

CREATE TABLE `razorpay_bank_transfers` (
  `id` int(11) NOT NULL,
  `razorpay_account_id` int(11) NOT NULL,
  `bank_transfer_ref` varchar(191) NOT NULL,
  `entity` varchar(20) NOT NULL,
  `payment_id` varchar(191) NOT NULL,
  `mode` varchar(20) NOT NULL,
  `bank_reference` varchar(191) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `virtual_account_id` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_customers`
--

CREATE TABLE `razorpay_customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` varchar(191) NOT NULL,
  `entity` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_orders`
--

CREATE TABLE `razorpay_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `entity` varchar(50) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(8,2) NOT NULL DEFAULT 0.00,
  `amount_due` decimal(8,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(10) NOT NULL,
  `created_at` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_virtual_accounts`
--

CREATE TABLE `razorpay_virtual_accounts` (
  `id` int(11) NOT NULL,
  `razorpay_account_id` int(11) NOT NULL,
  `virtual_account_payment_ref` varchar(191) NOT NULL,
  `entity` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `amount_paid` decimal(8,2) NOT NULL DEFAULT 0.00,
  `customer_id` varchar(191) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sr_no` int(11) NOT NULL,
  `referral_code` varchar(191) NOT NULL,
  `qr_code` blob NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `referral_transactions`
--

CREATE TABLE `referral_transactions` (
  `id` int(11) NOT NULL,
  `referral_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rental_activities`
--

CREATE TABLE `rental_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Vendor',
  `activity_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `level` enum('1','2','3') NOT NULL COMMENT '1 => Beginner, 2 => Intermediate, 3 => Expert',
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `warning` text NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_vendor_discount` enum('0','1') NOT NULL DEFAULT '0',
  `is_approved` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => Not Approved , 1 => Approved',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rental_activity_histories`
--

CREATE TABLE `rental_activity_histories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Vendor',
  `activity_id` int(11) NOT NULL,
  `rental_activity_id` int(11) NOT NULL COMMENT 'rental_activities table (pk)',
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `level` enum('1','2','3') NOT NULL COMMENT '1 => Beginner, 2 => Intermediate, 3 => Expert',
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `warning` text NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_vendor_discount` enum('0','1') NOT NULL DEFAULT '0',
  `is_approved` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => Not Approved , 1 => Approved',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Super Admin', '2022-02-08 05:44:53', '2022-02-08 05:44:53'),
(2, 'Admin', '2022-02-08 05:44:53', '2022-02-08 05:44:53'),
(3, 'Vendor', '2022-02-08 05:44:53', '2022-02-08 05:44:53'),
(4, 'User', '2022-02-08 05:44:53', '2022-02-08 05:44:53'),
(5, 'Taxi Driver', '2022-02-08 05:44:53', '2022-02-08 05:44:53'),
(6, 'Hotel', '2022-03-15 13:48:36', '2022-03-15 13:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220201111115-create-role.js'),
('20220201111212-create-users.js'),
('20220201111319-create-category.js'),
('20220201153805-create-user-activity.js'),
('20220202072445-create-other-details.js'),
('20220202075029-create-driver-info.js'),
('20220202080307-create-kyc.js'),
('20220202080849-create-bank-details.js'),
('20220202082207-create-vehicle-details.js'),
('20220202083135-create-company.js'),
('20220202083659-create-model.js'),
('20220204134347-create-vehicles.js'),
('20220204154242-create-model-year.js'),
('20220204160848-create-vehicle-add-ons.js'),
('20220204161554-create-vehicle-category.js'),
('20220208104053-create-booking.js'),
('20220208144507-create-third-party-booking.js'),
('20220208150236-create-booking-adventurer.js'),
('20220208151744-create-booking-addons.js'),
('20220209094820-create-coupon.js'),
('20220211115704-create-comments.js'),
('20220221082312-create-activity.js'),
('20220223051405-create-activity-other.js'),
('20220223054548-create-activity-addons.js'),
('20220223054755-create-activity-list-dates.js'),
('20220228075334-create-help.js');

-- --------------------------------------------------------

--
-- Table structure for table `taxi_bookings`
--

CREATE TABLE `taxi_bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `pickup_latitude` varchar(191) NOT NULL,
  `pickup_longitude` varchar(191) NOT NULL,
  `drop_latitude` varchar(191) NOT NULL,
  `drop_longitude` varchar(191) NOT NULL,
  `pickup_location` varchar(191) NOT NULL,
  `drop_location` varchar(191) NOT NULL,
  `status` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '1 => pending , 2 => in-progress , 3 => abandoned , 4 => completed , 5 => cancelled',
  `is_skip` enum('0','1') NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `taxi_driver_business_details`
--

CREATE TABLE `taxi_driver_business_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Taxi Driver',
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `registration_no` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `driving_area_radius` varchar(10) NOT NULL,
  `license_no` varchar(191) NOT NULL,
  `license_expiry_date` date NOT NULL,
  `license_fornt_image` varchar(191) NOT NULL,
  `license_back_image` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `taxi_rate_lists`
--

CREATE TABLE `taxi_rate_lists` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `per_km_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taxi_rate_lists`
--

INSERT INTO `taxi_rate_lists` (`id`, `type`, `per_km_charge`, `createdAt`, `updatedAt`) VALUES
(1, 'Hatchback', '10.00', '2022-06-10 19:27:16', '2022-07-26 11:09:15'),
(2, 'Compact Sedan', '12.00', '2022-06-10 19:27:42', '2022-06-13 05:08:39'),
(3, 'Sedan', '15.00', '2022-06-10 19:28:20', '2022-06-13 05:09:37'),
(4, 'Compact SUV', '14.00', '2022-06-10 19:28:54', '2022-06-13 05:09:32'),
(5, 'SUV', '16.00', '2022-06-10 19:29:11', '2022-06-13 05:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `term_conditions`
--

CREATE TABLE `term_conditions` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `term_conditions`
--

INSERT INTO `term_conditions` (`id`, `description`, `createdAt`, `updatedAt`) VALUES
(1, '<p>Hi i am&nbsp;<span style=\"box-sizing: border-box; outline: none !important; font-weight: bolder;\">TERM &amp; CONDITIONS</span></p>', '2022-04-04 15:30:04', '2022-04-22 12:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `booking_payment_id` int(11) NOT NULL,
  `transaction_payment_ref` varchar(191) NOT NULL,
  `transaction_refund_ref` varchar(191) DEFAULT NULL,
  `entity` varchar(20) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `method` varchar(20) DEFAULT NULL,
  `json_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_response`)),
  `created_at` bigint(20) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country_iso` varchar(10) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(191) NOT NULL,
  `pin_code` int(11) NOT NULL,
  `landmark` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `is_otp_verified` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => No , 1 => Yes	',
  `is_approved` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => Not Approved , 1 => Approved ',
  `device_type` enum('Android','Ios','Web') NOT NULL,
  `level` enum('1','2','3') DEFAULT NULL COMMENT '1 => Beginner, 2 => Intermediate, 3 => Expert',
  `status` enum('0','1') DEFAULT '0' COMMENT '0 => Close , 1 => Active  ',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `email`, `password`, `country_iso`, `country_code`, `mobile_no`, `gender`, `dob`, `country`, `state`, `city`, `address`, `pin_code`, `landmark`, `image`, `otp`, `is_otp_verified`, `is_approved`, `device_type`, `level`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Super', 'Admin', 1, 'superadmin@yopmail.com', '$2b$10$osAp5mKsR90sBRND.LMZ6.ZVjBP6xsS0b2C1w47yFOOZgTNsObTVC', 'in', '+91', 8628988222, 'Male', '1995-07-14', 'India', 'Himachal Pradesh', 'Hamirpur', 'Hamirpur Himachal Pradesh India', 123456, 'Hamirpur Himachal Pradesh India', '', NULL, '1', '1', 'Web', NULL, '1', '2022-05-12 15:00:02', '2022-05-12 15:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_interested_activities`
--

CREATE TABLE `user_interested_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '	0 => Close , 1 => Active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_business_details`
--

CREATE TABLE `vendor_business_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Vendor',
  `business_name` varchar(191) NOT NULL,
  `aletrnate_country_iso` varchar(10) NOT NULL,
  `aletrnate_country_code` varchar(10) NOT NULL,
  `aletrnate_mobile_no` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `location_image_id` int(11) NOT NULL,
  `exact_location_name` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `gst_no` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_visiting_card` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => No , 1 => Yes ',
  `visiting_card_image` varchar(191) NOT NULL,
  `award_certification_image` varchar(191) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_add_ons`
--
ALTER TABLE `activity_add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_add_on_histories`
--
ALTER TABLE `activity_add_on_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_adventure_list_dates`
--
ALTER TABLE `activity_adventure_list_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_adventure_list_date_histories`
--
ALTER TABLE `activity_adventure_list_date_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_adventure_types`
--
ALTER TABLE `activity_adventure_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_auto_time_sheets`
--
ALTER TABLE `activity_auto_time_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_auto_time_sheet_histories`
--
ALTER TABLE `activity_auto_time_sheet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_day_sheets`
--
ALTER TABLE `activity_day_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_day_sheet_days`
--
ALTER TABLE `activity_day_sheet_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_day_sheet_day_histories`
--
ALTER TABLE `activity_day_sheet_day_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_day_sheet_histories`
--
ALTER TABLE `activity_day_sheet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_flexd_time_sheets`
--
ALTER TABLE `activity_flexd_time_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_flexd_time_sheet_histories`
--
ALTER TABLE `activity_flexd_time_sheet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_media`
--
ALTER TABLE `activity_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_media_histories`
--
ALTER TABLE `activity_media_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_meeting_points`
--
ALTER TABLE `activity_meeting_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_meeting_point_histories`
--
ALTER TABLE `activity_meeting_point_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_prices`
--
ALTER TABLE `activity_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_price_histories`
--
ALTER TABLE `activity_price_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_require_accessories`
--
ALTER TABLE `activity_require_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_require_accessory_histories`
--
ALTER TABLE `activity_require_accessory_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_time_sheets`
--
ALTER TABLE `activity_time_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_time_sheet_histories`
--
ALTER TABLE `activity_time_sheet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_time_sheet_times`
--
ALTER TABLE `activity_time_sheet_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_time_sheet_time_histories`
--
ALTER TABLE `activity_time_sheet_time_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_vehicle_details`
--
ALTER TABLE `activity_vehicle_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_vehicle_detail_histories`
--
ALTER TABLE `activity_vehicle_detail_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adventure_activities`
--
ALTER TABLE `adventure_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adventure_activity_histories`
--
ALTER TABLE `adventure_activity_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transfer_transactions`
--
ALTER TABLE `bank_transfer_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_add_ons`
--
ALTER TABLE `booking_add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_payments`
--
ALTER TABLE `booking_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_referrals`
--
ALTER TABLE `booking_referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_refunds`
--
ALTER TABLE `booking_refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_user_details`
--
ALTER TABLE `booking_user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_vehicle_types`
--
ALTER TABLE `brand_vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_business_details`
--
ALTER TABLE `hotel_business_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_images`
--
ALTER TABLE `location_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_reviews`
--
ALTER TABLE `rating_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_accounts`
--
ALTER TABLE `razorpay_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_bank_transfers`
--
ALTER TABLE `razorpay_bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_customers`
--
ALTER TABLE `razorpay_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_orders`
--
ALTER TABLE `razorpay_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_virtual_accounts`
--
ALTER TABLE `razorpay_virtual_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_transactions`
--
ALTER TABLE `referral_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental_activities`
--
ALTER TABLE `rental_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental_activity_histories`
--
ALTER TABLE `rental_activity_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `taxi_bookings`
--
ALTER TABLE `taxi_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxi_driver_business_details`
--
ALTER TABLE `taxi_driver_business_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxi_rate_lists`
--
ALTER TABLE `taxi_rate_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `term_conditions`
--
ALTER TABLE `term_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`);

--
-- Indexes for table `user_interested_activities`
--
ALTER TABLE `user_interested_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_business_details`
--
ALTER TABLE `vendor_business_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `activity_add_ons`
--
ALTER TABLE `activity_add_ons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_add_on_histories`
--
ALTER TABLE `activity_add_on_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_adventure_list_dates`
--
ALTER TABLE `activity_adventure_list_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_adventure_list_date_histories`
--
ALTER TABLE `activity_adventure_list_date_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_adventure_types`
--
ALTER TABLE `activity_adventure_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `activity_auto_time_sheets`
--
ALTER TABLE `activity_auto_time_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_auto_time_sheet_histories`
--
ALTER TABLE `activity_auto_time_sheet_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_day_sheets`
--
ALTER TABLE `activity_day_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_day_sheet_days`
--
ALTER TABLE `activity_day_sheet_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_day_sheet_day_histories`
--
ALTER TABLE `activity_day_sheet_day_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_day_sheet_histories`
--
ALTER TABLE `activity_day_sheet_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_flexd_time_sheets`
--
ALTER TABLE `activity_flexd_time_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_flexd_time_sheet_histories`
--
ALTER TABLE `activity_flexd_time_sheet_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_media`
--
ALTER TABLE `activity_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_media_histories`
--
ALTER TABLE `activity_media_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_meeting_points`
--
ALTER TABLE `activity_meeting_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_meeting_point_histories`
--
ALTER TABLE `activity_meeting_point_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_prices`
--
ALTER TABLE `activity_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_price_histories`
--
ALTER TABLE `activity_price_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_require_accessories`
--
ALTER TABLE `activity_require_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_require_accessory_histories`
--
ALTER TABLE `activity_require_accessory_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_time_sheets`
--
ALTER TABLE `activity_time_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_time_sheet_histories`
--
ALTER TABLE `activity_time_sheet_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_time_sheet_times`
--
ALTER TABLE `activity_time_sheet_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_time_sheet_time_histories`
--
ALTER TABLE `activity_time_sheet_time_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_vehicle_details`
--
ALTER TABLE `activity_vehicle_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_vehicle_detail_histories`
--
ALTER TABLE `activity_vehicle_detail_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adventure_activities`
--
ALTER TABLE `adventure_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adventure_activity_histories`
--
ALTER TABLE `adventure_activity_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transfer_transactions`
--
ALTER TABLE `bank_transfer_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_add_ons`
--
ALTER TABLE `booking_add_ons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_payments`
--
ALTER TABLE `booking_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_referrals`
--
ALTER TABLE `booking_referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_refunds`
--
ALTER TABLE `booking_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_user_details`
--
ALTER TABLE `booking_user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `brand_vehicle_types`
--
ALTER TABLE `brand_vehicle_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_business_details`
--
ALTER TABLE `hotel_business_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_images`
--
ALTER TABLE `location_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating_reviews`
--
ALTER TABLE `rating_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_accounts`
--
ALTER TABLE `razorpay_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_bank_transfers`
--
ALTER TABLE `razorpay_bank_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_customers`
--
ALTER TABLE `razorpay_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_orders`
--
ALTER TABLE `razorpay_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_virtual_accounts`
--
ALTER TABLE `razorpay_virtual_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_transactions`
--
ALTER TABLE `referral_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_activities`
--
ALTER TABLE `rental_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_activity_histories`
--
ALTER TABLE `rental_activity_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `taxi_bookings`
--
ALTER TABLE `taxi_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxi_driver_business_details`
--
ALTER TABLE `taxi_driver_business_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxi_rate_lists`
--
ALTER TABLE `taxi_rate_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `term_conditions`
--
ALTER TABLE `term_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_interested_activities`
--
ALTER TABLE `user_interested_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_business_details`
--
ALTER TABLE `vendor_business_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
