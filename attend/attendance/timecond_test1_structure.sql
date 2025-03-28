-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2025 at 07:13 AM
-- Server version: 8.0.41
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timecond_test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_type`
--

CREATE TABLE `accreditation_type` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_site`
--

CREATE TABLE `admin_role_site` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `resident_ids` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `series_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `project_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Active',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_cat`
--

CREATE TABLE `asset_cat` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `time_id` int NOT NULL,
  `location_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `image2` longblob NOT NULL,
  `image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `verify_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `verify_by` int NOT NULL DEFAULT '0',
  `revoke_by` int NOT NULL,
  `revoke_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verify_date` date DEFAULT NULL,
  `verify2_by` int DEFAULT '0',
  `punch_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salary` float NOT NULL,
  `pay_rate` float NOT NULL,
  `penalty_rate` int NOT NULL,
  `trade_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sync_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason_revoke` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reason_approve` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_manual`
--

CREATE TABLE `attendance_manual` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `sn` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `prayer` int NOT NULL,
  `punch_in_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `punch_out_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `specialCal` varchar(155) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reasonSpecial` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punch_in` time DEFAULT NULL,
  `punch_out` time DEFAULT NULL,
  `date` date NOT NULL,
  `punch_out_date` date NOT NULL,
  `salary` float NOT NULL,
  `actual_hour` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `normal_salary_hour` float NOT NULL,
  `OT_salary_hour` float NOT NULL,
  `special_salary_hour` float NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `punch_in_proof_img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `punch_out_proof_img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_manual_supervisor`
--

CREATE TABLE `attendance_manual_supervisor` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `sn` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `team_type_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `punch_in_image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `punch_out_image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'apps',
  `punch_in` time DEFAULT NULL,
  `punch_out` time DEFAULT NULL,
  `punch_out_date` date NOT NULL,
  `date` date NOT NULL,
  `actual_hour` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `normal_salary_hour` float NOT NULL,
  `OT_salary_hour` float NOT NULL,
  `special_salary_hour` float NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `punch_in_proof_img` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `punch_out_proof_img` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_manual_terminal`
--

CREATE TABLE `attendance_manual_terminal` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `sn` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `punch_in_image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punch_out_image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punch_in` time NOT NULL,
  `punch_out` time NOT NULL,
  `punch_out_date` date NOT NULL,
  `date` date NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_manual_terminal_supervisor`
--

CREATE TABLE `attendance_manual_terminal_supervisor` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `sn` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `punch_in_image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punch_out_image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punch_in` time NOT NULL,
  `punch_out` time NOT NULL,
  `punch_out_date` date NOT NULL,
  `date` date NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_supervisor`
--

CREATE TABLE `attendance_supervisor` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `image2` longblob NOT NULL,
  `image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `verify_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `verify_by` int NOT NULL,
  `revoke_by` int NOT NULL,
  `team_id` int NOT NULL,
  `time_id` int NOT NULL,
  `revoke_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `verify_date` date DEFAULT NULL,
  `verify2_by` int NOT NULL,
  `trade_id` int NOT NULL,
  `sync_date` datetime NOT NULL,
  `reason_revoke` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punch_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_terminal`
--

CREATE TABLE `attendance_terminal` (
  `id` int NOT NULL,
  `sn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enrollid` int NOT NULL COMMENT 'use this as user_id to join table',
  `user_id` int NOT NULL COMMENT 'use for retrieve set absence',
  `trade_id` int NOT NULL,
  `prayer` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  `mode` int NOT NULL,
  `in_out` int NOT NULL COMMENT '1=in\r\n2=out',
  `event` int NOT NULL,
  `verifymode` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `image` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_sn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `set_absent_date` date DEFAULT NULL,
  `set_absent_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_terminal_search`
--

CREATE TABLE `attendance_terminal_search` (
  `id` int NOT NULL,
  `sn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enrollid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  `mode` int NOT NULL,
  `in_out` int NOT NULL,
  `event` int NOT NULL,
  `verifymode` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `recog_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_sn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_terminal_user`
--

CREATE TABLE `attendance_terminal_user` (
  `id` int NOT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enrollid` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `backupnum` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `admin` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `record` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `isbank` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buffer_table`
--

CREATE TABLE `buffer_table` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `area_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `building_id` int NOT NULL,
  `unit_cat_id` int NOT NULL,
  `unit_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `floorplan_id` int NOT NULL,
  `area_id` int NOT NULL,
  `type` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `salary` float NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PM'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calculation_pattern`
--

CREATE TABLE `calculation_pattern` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `function_name` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_name` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lunch_start` time NOT NULL,
  `lunch_end` time NOT NULL,
  `OT_start` time NOT NULL,
  `OT_start_staff` time NOT NULL,
  `buffer_time` int NOT NULL,
  `maxWorkingHour` int NOT NULL,
  `SN` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_big_head`
--

CREATE TABLE `company_big_head` (
  `id` int NOT NULL,
  `subcon_company_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note`
--

CREATE TABLE `credit_note` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `credit_to_ref` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `from_resident_id` int NOT NULL,
  `credit_to_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_type_id` int DEFAULT NULL COMMENT 'award_id',
  `credit_to` int DEFAULT NULL COMMENT 'debit_to_type = subcon > subcon table id, debit_to_type = worker > details_worker user_id',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `sign_by` int DEFAULT NULL,
  `sign_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sign_date` timestamp NULL DEFAULT NULL,
  `total_SCNR` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `printed` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'RF,QS,Site',
  `previous_cn_id` int DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_requests`
--

CREATE TABLE `credit_note_requests` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `credit_to` int NOT NULL,
  `credit_to_award` int DEFAULT NULL,
  `credit_to_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1` int NOT NULL DEFAULT '0' COMMENT 'manager signed',
  `signature_2` int NOT NULL DEFAULT '0' COMMENT 'qs signed',
  `signature_1_date` date DEFAULT NULL,
  `signature_2_date` date DEFAULT NULL,
  `signature_3_date` date DEFAULT NULL,
  `signature_3` int NOT NULL DEFAULT '0' COMMENT 'director signed',
  `signature_1_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_2_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_3_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1_by` int DEFAULT NULL,
  `signature_2_by` int DEFAULT NULL,
  `signature_3_by` int DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reject_by` int NOT NULL,
  `CN_id` int DEFAULT NULL COMMENT 'credit_note table id',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_role` int NOT NULL DEFAULT '0' COMMENT '0=pic,1=manager,2=qs,3=director'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_hour`
--

CREATE TABLE `daily_hour` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `daily_hour` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `date_report`
--

CREATE TABLE `date_report` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daywork_generate`
--

CREATE TABLE `daywork_generate` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `worker_type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_id` int NOT NULL,
  `award_id` int NOT NULL,
  `day_from` int NOT NULL,
  `day_to` int NOT NULL,
  `salary` float NOT NULL COMMENT 'after deduction',
  `permit_deduct` float NOT NULL,
  `loan_deduct` float NOT NULL,
  `misc_deduct` float NOT NULL COMMENT 'non-permit',
  `dn_deduct` float NOT NULL COMMENT 'DN',
  `payment_made` float NOT NULL,
  `payment_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Cash/Bank/eWallet',
  `trade_id` int NOT NULL,
  `status` int NOT NULL COMMENT '0= unpaid\r\n1= paid',
  `ref_no` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `record_id` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_purpose` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int NOT NULL,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daywork_status`
--

CREATE TABLE `daywork_status` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `worker_type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_id` int NOT NULL,
  `award_id` int NOT NULL,
  `day_from` int NOT NULL,
  `day_to` int NOT NULL,
  `verify_by_site` int NOT NULL,
  `verify_by_permit` int NOT NULL,
  `verify_by_qs` int NOT NULL,
  `verify_by_site_date` datetime DEFAULT NULL,
  `verify_by_permit_date` datetime DEFAULT NULL,
  `verify_by_qs_date` datetime DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deactivation`
--

CREATE TABLE `deactivation` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `project_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `last_work_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `resign_reason_id` int NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'approved',
  `submit_date` datetime NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `worker_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Approved',
  `signature_1` int NOT NULL DEFAULT '0' COMMENT 'manager',
  `signature_2` int NOT NULL DEFAULT '0' COMMENT 'director',
  `signature_1_date` date DEFAULT NULL,
  `signature_2_date` date DEFAULT NULL,
  `signature_1_file` varchar(655) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_2_file` varchar(655) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1_by` int DEFAULT NULL,
  `signature_2_by` int DEFAULT NULL,
  `Mremark` varchar(512) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Dremark` varchar(512) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Mremark_id` int DEFAULT NULL,
  `Dremark_id` int DEFAULT NULL,
  `reject_reason` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reject_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debitnote_photo`
--

CREATE TABLE `debitnote_photo` (
  `id` int NOT NULL,
  `debit_id` int NOT NULL,
  `image` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debitnote_worker`
--

CREATE TABLE `debitnote_worker` (
  `id` int NOT NULL,
  `debit_id` int NOT NULL,
  `user_id` int NOT NULL,
  `team_id` int NOT NULL,
  `proof_pic` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debit_note`
--

CREATE TABLE `debit_note` (
  `id` int NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `from_resident_id` int NOT NULL,
  `trans_date` date NOT NULL,
  `debit_to_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_type_id` int DEFAULT NULL COMMENT 'award_id',
  `debit_to` int DEFAULT NULL COMMENT 'debit_to_type = subcon > subcon table id, debit_to_type = worker > details_worker user_id',
  `debit_to_ref` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `sign_by` int DEFAULT NULL,
  `sign_file` varchar(655) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sign_date` timestamp NULL DEFAULT NULL,
  `validate_date` date DEFAULT NULL,
  `validate_file` varchar(655) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_SDNR` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `printed` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'RF,QS,Site',
  `previous_dn_id` int DEFAULT NULL,
  `exclude_from_dayworks` int NOT NULL DEFAULT '0' COMMENT 'default = 0,\r\n\r\nto exclude from dayworks = 1',
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debit_note_checkifidle`
--

CREATE TABLE `debit_note_checkifidle` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `debitnote_type_id` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `area_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `building_id` int NOT NULL,
  `unit_cat_id` int NOT NULL,
  `unit_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `floorplan_id` int NOT NULL,
  `area_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debit_note_requests`
--

CREATE TABLE `debit_note_requests` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `submitted_date` date DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `prepared_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `debit_to` int NOT NULL,
  `debit_to_ref` int NOT NULL,
  `debit_to_head` int DEFAULT NULL,
  `debit_to_award` int DEFAULT NULL COMMENT 'award_id',
  `debit_to_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `signed_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `approved_DNR` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'qs sign',
  `approved_DNR_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'director sign',
  `debit_note` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DN` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `stamp_SDNR` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1` int NOT NULL DEFAULT '0' COMMENT 'manager signed',
  `signature_2` int NOT NULL DEFAULT '0' COMMENT 'director signed',
  `signature_2_date` date DEFAULT NULL,
  `signature_3` int NOT NULL DEFAULT '0' COMMENT 'qs signed / purchasing manager signed',
  `signature_1_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_2_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_3_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1_by` int DEFAULT NULL,
  `signature_2_by` int DEFAULT NULL,
  `signature_3_by` int DEFAULT NULL,
  `submission` int NOT NULL,
  `submission_date` date NOT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reject_by` int NOT NULL,
  `new_type` int NOT NULL COMMENT '0=old, 1=new',
  `DEB_id` int DEFAULT NULL COMMENT 'debit_note table id',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_qs` int NOT NULL COMMENT 'if created by qs thn 1 else 0',
  `requisition_form_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debit_note_type`
--

CREATE TABLE `debit_note_type` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `GL` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `company_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details_CNR`
--

CREATE TABLE `details_CNR` (
  `id` int NOT NULL,
  `occured_date` date DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PIC` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `SCNR_id` int NOT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Pending',
  `reject_by_manager` int NOT NULL DEFAULT '0',
  `reject_by_director` int NOT NULL DEFAULT '0',
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details_CNR_Sdoc`
--

CREATE TABLE `details_CNR_Sdoc` (
  `id` int NOT NULL,
  `details_CNR_id` int NOT NULL,
  `file` varchar(512) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details_DNR`
--

CREATE TABLE `details_DNR` (
  `id` int NOT NULL,
  `occured_date` date DEFAULT NULL,
  `DN_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'parent:type, child:item_type',
  `description` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'parent:description, child:item_name',
  `sl_worker_id` int NOT NULL COMMENT 'id of worker under sl',
  `PIC` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `charge_percentage` decimal(3,1) NOT NULL,
  `DNR_id` int NOT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Draft',
  `reject_by_manager` int NOT NULL DEFAULT '0',
  `reject_by_director` int NOT NULL DEFAULT '0',
  `reject_by_qs` int NOT NULL,
  `reject_by_pic` int NOT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rf_items_id` int DEFAULT NULL,
  `Parent` int NOT NULL COMMENT 'parent:0 , child:parents''ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details_DNR_photo`
--

CREATE TABLE `details_DNR_photo` (
  `id` int NOT NULL,
  `details_DNR_id` int NOT NULL,
  `photo` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details_DNR_Sdoc`
--

CREATE TABLE `details_DNR_Sdoc` (
  `id` int NOT NULL,
  `details_DNR_id` int NOT NULL,
  `file` varchar(512) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_daily_report`
--

CREATE TABLE `detail_daily_report` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `date` date NOT NULL,
  `ot_hour` float NOT NULL,
  `ot_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ot_status_by` int NOT NULL,
  `ot_status_date` datetime NOT NULL,
  `special_hour` float NOT NULL,
  `location` varchar(215) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `leave_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `change_time` int NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_director`
--

CREATE TABLE `detail_director` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_company_id` int NOT NULL,
  `worker_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_role` int NOT NULL DEFAULT '0' COMMENT 'QS personnel 1  = 1 '
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_loan`
--

CREATE TABLE `detail_loan` (
  `id` int NOT NULL,
  `loan_id` int NOT NULL,
  `user_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'approved',
  `verified_by` int DEFAULT NULL,
  `verified_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_manager`
--

CREATE TABLE `detail_manager` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_company_id` int NOT NULL,
  `superior_id` int NOT NULL,
  `worker_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `race` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `greenexp` date NOT NULL,
  `cidb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_exp` date NOT NULL,
  `cidb_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salary` float NOT NULL,
  `team_type_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `hq_id` int NOT NULL,
  `cost_center_id` int NOT NULL,
  `immino` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immino_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiexp` date NOT NULL,
  `immitype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_exp` date NOT NULL,
  `accreditation_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hireddate` date NOT NULL,
  `resigndate` date DEFAULT NULL,
  `socso` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `epf_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `introducer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ori_type` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `admin_role` int NOT NULL,
  `admin_role_site` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_slot` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '830',
  `card_sn` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `door_terminal_ids` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_sub`
--

CREATE TABLE `detail_sub` (
  `id` int NOT NULL,
  `sub_id` int NOT NULL COMMENT 'log_sub table id',
  `sub_id2` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `award_id` int NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'approved',
  `verified_by` int DEFAULT NULL,
  `verified_date` timestamp NULL DEFAULT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `subcon_company_id` int DEFAULT NULL,
  `gang_id` int NOT NULL,
  `assign_to` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_subcon`
--

CREATE TABLE `detail_subcon` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `subcon_company_id` int NOT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `worker_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gang` int NOT NULL,
  `trade_id` int NOT NULL,
  `prayer` int NOT NULL,
  `photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_exp` date NOT NULL,
  `cidb_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salary` float NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `race` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `religion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salary_special` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `greenexp` date DEFAULT NULL,
  `immino` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiexp` date DEFAULT NULL,
  `immitype` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_exp` date NOT NULL,
  `accreditation_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hireddate` date DEFAULT NULL,
  `resigndate` date DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kin_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `marital` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `spouse` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cost_center` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `section` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `occupational` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socso` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_fre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_subtotime`
--

CREATE TABLE `detail_subtotime` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `normal_salary_hour` int NOT NULL,
  `ot_salary_hour` int NOT NULL,
  `special_salary_hour` int NOT NULL,
  `subcon_company_id` int NOT NULL,
  `sub_to` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_supervisor`
--

CREATE TABLE `detail_supervisor` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_company_id` int NOT NULL,
  `superior_id` int NOT NULL,
  `worker_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `race` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `greenexp` date NOT NULL,
  `cidb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_exp` date NOT NULL,
  `cidb_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salary` float NOT NULL,
  `team_type_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `hq_id` int NOT NULL,
  `cost_center_id` int NOT NULL,
  `immino` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immino_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiexp` date NOT NULL,
  `immitype` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_exp` date NOT NULL,
  `accreditation_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hireddate` date DEFAULT NULL,
  `resigndate` date DEFAULT NULL,
  `socso` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `epf_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `introducer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ori_type` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `admin_role` int NOT NULL,
  `admin_role_site` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_slot` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '830',
  `card_sn` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `door_terminal_ids` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transfer`
--

CREATE TABLE `detail_transfer` (
  `id` int NOT NULL,
  `transfer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `team_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'approved',
  `verified_by` int DEFAULT NULL,
  `verified_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_worker`
--

CREATE TABLE `detail_worker` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `subcon_company_id` int NOT NULL,
  `superior_id` int NOT NULL,
  `superior_sl_id` int NOT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `worker_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `gang` int NOT NULL DEFAULT '1' COMMENT 'default to KSK',
  `sl_gang` int NOT NULL COMMENT '//ignore this column (looks like duplicated column of subcon_company_id)',
  `trade_id` int NOT NULL,
  `prayer` int NOT NULL,
  `photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nric_photo_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `greenexp` date DEFAULT NULL,
  `nric_renewing` tinyint(1) NOT NULL,
  `cidb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_photo_old` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidb_exp` date NOT NULL,
  `salary` float NOT NULL,
  `salary_s` float NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `race` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `religion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salary_special` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immino` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immino_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiphoto_old` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immitype` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `immiexp` date DEFAULT NULL,
  `immi_renewing` tinyint(1) NOT NULL,
  `accreditation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_old` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_photo_old` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_exp` date NOT NULL,
  `accreditation_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hireddate` date DEFAULT NULL,
  `resigndate` date DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kin_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `marital` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `spouse` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cost_center` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `section` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `occupational` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socso` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `epf_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_fre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `introducer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ori_type` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permit_by` int NOT NULL,
  `reactive_doc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_action` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_special_trade`
--

CREATE TABLE `document_special_trade` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `company_id` int NOT NULL,
  `document` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `filename` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `door_access`
--

CREATE TABLE `door_access` (
  `id` int NOT NULL,
  `door_terminal_id` int NOT NULL,
  `card_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `staff_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `access_date` date NOT NULL,
  `access_time` time NOT NULL,
  `reader` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `door_terminal`
--

CREATE TABLE `door_terminal` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gang`
--

CREATE TABLE `gang` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int NOT NULL COMMENT 'gang id',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icpassport` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sub_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `project_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gang_parent_log`
--

CREATE TABLE `gang_parent_log` (
  `id` int NOT NULL,
  `gang_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_cn_amount`
--

CREATE TABLE `history_cn_amount` (
  `id` int NOT NULL,
  `details_DNR_id` int NOT NULL,
  `edit_role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `first_amount` int NOT NULL,
  `original_amount` int NOT NULL,
  `edit_amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_dn_amount`
--

CREATE TABLE `history_dn_amount` (
  `id` int NOT NULL,
  `details_DNR_id` int NOT NULL,
  `edit_role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `first_amount` int NOT NULL,
  `original_amount` int NOT NULL,
  `edit_amount` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `update_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_type`
--

CREATE TABLE `job_type` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `job_type_cat_id` int NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_type_cat`
--

CREATE TABLE `job_type_cat` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_permit_type`
--

CREATE TABLE `kp_permit_type` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_approval`
--

CREATE TABLE `loan_approval` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `worker_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_company_id` int NOT NULL,
  `award_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `monthly_repay` float NOT NULL,
  `est_issuance` date DEFAULT NULL,
  `salary` float NOT NULL COMMENT 'ksk rate',
  `salary_s` float NOT NULL COMMENT 'sl rate',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `QSremark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` int DEFAULT NULL,
  `approved_status` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_date` date DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `worker_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Approved',
  `signature_1` int NOT NULL DEFAULT '0' COMMENT 'manager',
  `signature_2` int NOT NULL DEFAULT '0' COMMENT 'director',
  `signature_1_date` date DEFAULT NULL,
  `signature_2_date` date DEFAULT NULL,
  `signature_1_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_2_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1_by` int DEFAULT NULL,
  `signature_2_by` int DEFAULT NULL,
  `Mremark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Dremark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Mremark_id` int DEFAULT NULL,
  `Dremark_id` int DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reject_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_approval_Sdoc`
--

CREATE TABLE `loan_approval_Sdoc` (
  `id` int NOT NULL,
  `loan_approval_id` int NOT NULL,
  `file` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_photo`
--

CREATE TABLE `loan_photo` (
  `id` int NOT NULL,
  `loan_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `imagebase64` longblob NOT NULL,
  `imgcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_area`
--

CREATE TABLE `location_area` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `block_id` int NOT NULL,
  `level_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_block`
--

CREATE TABLE `location_block` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_level`
--

CREATE TABLE `location_level` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `block_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `level_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Common Area'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_unit`
--

CREATE TABLE `location_unit` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `block_id` int NOT NULL,
  `level_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_accreditation`
--

CREATE TABLE `log_accreditation` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `accreditation_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accreditation_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_attendance_manual`
--

CREATE TABLE `log_attendance_manual` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `punch_in` time NOT NULL,
  `punch_out` time NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_charge`
--

CREATE TABLE `log_charge` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bill_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bill_date` date NOT NULL,
  `attachment` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_charge_loan`
--

CREATE TABLE `log_charge_loan` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bill_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bill_date` date DEFAULT NULL,
  `recipient_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unique_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request_id` int NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unpaid' COMMENT 'unpaid/paid',
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_cidb`
--

CREATE TABLE `log_cidb` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `cidb_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_job`
--

CREATE TABLE `log_job` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` int DEFAULT NULL,
  `modify_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_loan`
--

CREATE TABLE `log_loan` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `loan_from_id` int NOT NULL,
  `loan_to_id` int NOT NULL,
  `create_by` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'accepted',
  `transfer_done` int NOT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `accepted_by` int DEFAULT NULL,
  `accepted_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_loan_amend`
--

CREATE TABLE `log_loan_amend` (
  `id` int NOT NULL,
  `scr_id` int NOT NULL,
  `type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_amount` int NOT NULL,
  `to_amount` int NOT NULL,
  `amend_by` int NOT NULL,
  `amend_role` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_rate` decimal(10,2) NOT NULL,
  `to_rate` decimal(10,2) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ot_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_manager`
--

CREATE TABLE `log_manager` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `user_page` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `status` tinyint NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `trade_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_manual_dn`
--

CREATE TABLE `log_manual_dn` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `memo` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_notes`
--

CREATE TABLE `log_notes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `show_to_all` int NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_passport`
--

CREATE TABLE `log_passport` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `passport_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_payment_method`
--

CREATE TABLE `log_payment_method` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `paymentmethod` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'P=permanent\r\nT=Temporary',
  `remark` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_pay_off`
--

CREATE TABLE `log_pay_off` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `worker_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `subcon_id` int NOT NULL,
  `award_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `amount` float DEFAULT NULL,
  `amount_loan` float DEFAULT NULL,
  `amount_misc` float DEFAULT NULL,
  `remark` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_permit`
--

CREATE TABLE `log_permit` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permit_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KP',
  `permit_no` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_repayment`
--

CREATE TABLE `log_repayment` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `yearmonth` date DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `trans_method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Cash' COMMENT 'Cash/Bank/eWallet',
  `payment_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Auto Repayment' COMMENT 'Auto/Manual',
  `bill_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bill_date` date DEFAULT NULL,
  `attachment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'P:Pending\r\nD:Done\r\nC:Cancel',
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_repayment_loan`
--

CREATE TABLE `log_repayment_loan` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `worker_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_company_id` int NOT NULL,
  `award_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `yearmonth` date DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `trans_method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Cash' COMMENT 'Cash/Bank',
  `payment_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Auto Repayment' COMMENT 'Auto/Manual',
  `bill_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bill_date` date DEFAULT NULL,
  `attachment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'P:Pending\r\nD:Done\r\nC:Cancel',
  `subcon_id` int NOT NULL COMMENT 'SL kepala',
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_resign`
--

CREATE TABLE `log_resign` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `resign_reason_id` int NOT NULL DEFAULT '6',
  `remark` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_salary`
--

CREATE TABLE `log_salary` (
  `id` int NOT NULL,
  `company_id` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL,
  `salary` float NOT NULL COMMENT 'ksk rate',
  `salary_s` float NOT NULL COMMENT 'sl rate',
  `ot_rate` decimal(10,2) NOT NULL DEFAULT '1.00',
  `ot_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'rate',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_salary_amend`
--

CREATE TABLE `log_salary_amend` (
  `id` int NOT NULL,
  `scr_id` int NOT NULL,
  `type` varchar(11) COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_amount` int NOT NULL,
  `to_amount` int NOT NULL,
  `amend_by` int NOT NULL,
  `amend_role` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_rate` decimal(10,2) NOT NULL,
  `to_rate` decimal(10,2) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ot_type` varchar(11) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_salary_supervisor`
--

CREATE TABLE `log_salary_supervisor` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `salary` float NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `team_count` int NOT NULL,
  `team_involve` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_staff`
--

CREATE TABLE `log_staff` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `cost_center_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_sub`
--

CREATE TABLE `log_sub` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `subcon_company` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gang_title` varchar(80) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sub_from_id` int NOT NULL COMMENT 'resident id',
  `sub_to_id` int NOT NULL COMMENT 'resident id',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `create_by` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'accepted',
  `transfer_done` int NOT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `accepted_by` int DEFAULT NULL,
  `accepted_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_subcon`
--

CREATE TABLE `log_subcon` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `type_transfer` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `previous_resident_id` int DEFAULT NULL,
  `previous_team_id` int DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_supervisor`
--

CREATE TABLE `log_supervisor` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `status` tinyint NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_time`
--

CREATE TABLE `log_time` (
  `id` int NOT NULL,
  `local_time` time NOT NULL,
  `local_date` date NOT NULL,
  `server_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `user_role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_tool`
--

CREATE TABLE `log_tool` (
  `id` int NOT NULL,
  `tool_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `location` int NOT NULL COMMENT '0 is in stock and other is user_id',
  `vendor_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `temp_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_transfer`
--

CREATE TABLE `log_transfer` (
  `id` int NOT NULL,
  `transfer_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `transfer_from_id` int NOT NULL,
  `transfer_to_id` int NOT NULL,
  `date` date NOT NULL,
  `create_by` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'accepted',
  `transfer_done` int NOT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `accepted_by` int DEFAULT NULL,
  `accepted_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_worker`
--

CREATE TABLE `log_worker` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `Action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'action for row start (from date)',
  `type_transfer` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `previous_resident_id` int DEFAULT NULL,
  `previous_team_id` int DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_worker_type`
--

CREATE TABLE `log_worker_type` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `worker_type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'KSK',
  `subcon_company_id` int NOT NULL,
  `award_id` int NOT NULL COMMENT 'subcon_type_id',
  `gang_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memo`
--

CREATE TABLE `memo` (
  `id` int NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `worker_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attn_to_id` int DEFAULT NULL COMMENT 'link to diff table based on the worker_type. internal : link to user.id \r\nothers : subcon_type.id',
  `status` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `sign_type` int NOT NULL COMMENT '1:Manager,2:Director,3:Both',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `approved_date` date DEFAULT NULL,
  `sign_M_date` date DEFAULT NULL,
  `sign_D_date` date DEFAULT NULL,
  `sign_M_file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sign_D_file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sign_M_by` int DEFAULT NULL,
  `sign_D_by` int DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memo_file`
--

CREATE TABLE `memo_file` (
  `id` int NOT NULL,
  `memo_id` int NOT NULL,
  `file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ori_file_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ot_slot`
--

CREATE TABLE `ot_slot` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `pay_rate` float NOT NULL,
  `slot_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slot_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ot_type`
--

CREATE TABLE `ot_type` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_frequency`
--

CREATE TABLE `payment_frequency` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_import`
--

CREATE TABLE `payment_import` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `payment_purpose` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `worker_type` varchar(5) COLLATE utf8mb3_unicode_ci NOT NULL,
  `yearmonth` date NOT NULL,
  `import_file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_ids` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permit_bank_generate`
--

CREATE TABLE `permit_bank_generate` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `worker_type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permit_generate`
--

CREATE TABLE `permit_generate` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permit_type`
--

CREATE TABLE `permit_type` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_payment`
--

CREATE TABLE `post_payment` (
  `id` int NOT NULL,
  `post_payment_request_id` int NOT NULL,
  `resident_id` int NOT NULL COMMENT 'problemed project',
  `pp_type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Post/Pre',
  `user_id` int NOT NULL,
  `pay_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `salary_month` date NOT NULL COMMENT 'problemed month',
  `target_month` date NOT NULL COMMENT 'reissued month',
  `worker_type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_id` int NOT NULL,
  `award_id` int NOT NULL,
  `amount` float(10,2) NOT NULL,
  `remark` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_payment_request`
--

CREATE TABLE `post_payment_request` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pp_type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Post/Pre',
  `company_id` int NOT NULL,
  `desc` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'memo',
  `proof_file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppe_item`
--

CREATE TABLE `ppe_item` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Exp: Safety Helmet',
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Exp: S.Helmet',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'pair/set/nos/box/dozen/roll/pcs',
  `price_n` float NOT NULL,
  `price_c` float NOT NULL,
  `price_s` float NOT NULL,
  `ppe_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppe_item_cat`
--

CREATE TABLE `ppe_item_cat` (
  `id` int NOT NULL,
  `title` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppe_item_record`
--

CREATE TABLE `ppe_item_record` (
  `id` int NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ppe_id` int NOT NULL,
  `ppe_item` int NOT NULL,
  `quantity` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ppe_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppe_record`
--

CREATE TABLE `ppe_record` (
  `id` int NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `worker_id` int NOT NULL,
  `resident_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `issued_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppe_record_image`
--

CREATE TABLE `ppe_record_image` (
  `id` int NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ppe_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ppe_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PPRef_No`
--

CREATE TABLE `PPRef_No` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `month_year` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PP_Ref_No` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punch`
--

CREATE TABLE `punch` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_id` int NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `special_case` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punch_status`
--

CREATE TABLE `punch_status` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `time_id` int NOT NULL,
  `time_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `type_punch` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `special_case` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punch_status_super`
--

CREATE TABLE `punch_status_super` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `time_id` int NOT NULL,
  `time_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `type_punch` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `special_case` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punch_supervisor`
--

CREATE TABLE `punch_supervisor` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_id` int NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `special_case` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE `race` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repayment`
--

CREATE TABLE `repayment` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `proof_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisition_form`
--

CREATE TABLE `requisition_form` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'pending signs = Approving,\r\npending PO = Processing\r\n',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `process_by` int DEFAULT NULL,
  `signature_1_date` date DEFAULT NULL,
  `signature_1` int NOT NULL DEFAULT '0' COMMENT 'manager signed',
  `signature_2_date` date DEFAULT NULL,
  `signature_2` int NOT NULL DEFAULT '0' COMMENT 'purchase staff signed',
  `signature_3_date` date DEFAULT NULL,
  `signature_3` int NOT NULL DEFAULT '0' COMMENT 'purchase manager sign',
  `signature_1_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_2_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_3_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1_by` int DEFAULT NULL,
  `signature_2_by` int DEFAULT NULL,
  `signature_3_by` int DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reject_by` int NOT NULL,
  `po_ids` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `residential`
--

CREATE TABLE `residential` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `by_company_id` tinyint NOT NULL,
  `title` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `state` int NOT NULL,
  `value` float NOT NULL,
  `penalty_rate` int NOT NULL,
  `shortname` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `given_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `employer` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `commercement_date` date NOT NULL,
  `completion_date` date NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `region` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `retired` int NOT NULL,
  `HQ` int NOT NULL,
  `tenant` int NOT NULL,
  `logo` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kp_id` int NOT NULL,
  `sn_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_2` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_3` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_4` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_5` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_6` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_7` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sn_id_8` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_2` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_3` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_4` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_5` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_6` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_7` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `socket_port_8` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `terminal_connect` datetime NOT NULL,
  `terminal_connect_2` datetime NOT NULL,
  `terminal_connect_3` datetime NOT NULL,
  `terminal_connect_4` datetime NOT NULL,
  `terminal_connect_5` datetime NOT NULL,
  `terminal_connect_6` datetime NOT NULL,
  `terminal_connect_7` datetime NOT NULL,
  `terminal_connect_8` datetime NOT NULL,
  `status` int NOT NULL COMMENT '0=On, 1=Off',
  `shift` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'D',
  `update_by` int NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resign_reason`
--

CREATE TABLE `resign_reason` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rf_items`
--

CREATE TABLE `rf_items` (
  `id` int NOT NULL,
  `assign_to_type` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ksk,sl,dsc,nsc',
  `assign_to` int NOT NULL COMMENT 'assign_type = ksk \r\nthen user_id,\r\nelse subcon_type_id',
  `sl_worker_id` int NOT NULL,
  `ppe_item_id` int NOT NULL,
  `ppe_item_category` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ppe_item_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ppe_item_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `unit_quantity` int NOT NULL,
  `requisition_form_id` int NOT NULL,
  `po_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `running_no`
--

CREATE TABLE `running_no` (
  `id` int NOT NULL,
  `number` int NOT NULL,
  `for_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_advance_requests`
--

CREATE TABLE `salary_advance_requests` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` int NOT NULL,
  `requested_date` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `issued_date` date DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `memo` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `approved_memo` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_cash`
--

CREATE TABLE `salary_cash` (
  `id` int NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `day_from` int NOT NULL,
  `day_to` int NOT NULL,
  `worker_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcon_id` int NOT NULL,
  `award_id` int NOT NULL,
  `amount` float NOT NULL,
  `pv_num` varchar(22) COLLATE utf8mb3_unicode_ci NOT NULL,
  `trade_id` int NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int NOT NULL,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_cash_image`
--

CREATE TABLE `salary_cash_image` (
  `id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sc_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_changes`
--

CREATE TABLE `salary_changes` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `user_id` int NOT NULL,
  `salary` float NOT NULL COMMENT 'ksk rate',
  `salary_s` float NOT NULL COMMENT 'sl rate',
  `ot_rate` decimal(10,2) NOT NULL DEFAULT '1.00',
  `ot_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'rate',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `QSremark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` int DEFAULT NULL,
  `approved_status` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'approved',
  `approved_date` date DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `new_type` int NOT NULL,
  `worker_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Approved',
  `signature_1` int NOT NULL DEFAULT '0' COMMENT 'manager',
  `signature_2` int NOT NULL DEFAULT '0' COMMENT 'director',
  `signature_1_date` date DEFAULT NULL,
  `signature_2_date` date DEFAULT NULL,
  `signature_1_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_2_file` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature_1_by` int DEFAULT NULL,
  `signature_2_by` int DEFAULT NULL,
  `Mremark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Dremark` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Mremark_id` int DEFAULT NULL,
  `Dremark_id` int DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reject_by` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_time`
--

CREATE TABLE `salary_time` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `time` time NOT NULL,
  `check_in_start` time DEFAULT NULL,
  `check_in_end` time DEFAULT NULL,
  `check_out_start` time DEFAULT NULL,
  `check_out_end` time DEFAULT NULL,
  `type_slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `special` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_time1`
--

CREATE TABLE `salary_time1` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `time` time NOT NULL,
  `check_in` tinyint(1) NOT NULL,
  `check_out` tinyint(1) NOT NULL,
  `type_slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `special` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int NOT NULL,
  `company_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` int NOT NULL COMMENT '1=On, 0=Off',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave`
--

CREATE TABLE `staff_leave` (
  `id` int NOT NULL,
  `emp_no` int NOT NULL,
  `emp_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `leave_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bring_forward` float NOT NULL,
  `entitlement` float NOT NULL,
  `burn_leave` float NOT NULL,
  `adjustment` float NOT NULL,
  `taken` float NOT NULL,
  `balance` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcon`
--

CREATE TABLE `subcon` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `sub_user_ids` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int NOT NULL COMMENT 'sl id',
  `full_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `FKA` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reg_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tin_no` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address_1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address_2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_logo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sub_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'A',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcon_parent_log`
--

CREATE TABLE `subcon_parent_log` (
  `id` int NOT NULL,
  `subcon_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcon_type`
--

CREATE TABLE `subcon_type` (
  `id` int NOT NULL,
  `resident_id` int NOT NULL,
  `subcon_id` int NOT NULL COMMENT '// is ksk means gang_id',
  `sub_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `award` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subtrades`
--

CREATE TABLE `subtrades` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `trades_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `main_super` int NOT NULL,
  `sub_super` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_mapping`
--

CREATE TABLE `team_mapping` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `tower_id` int NOT NULL,
  `level_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `area_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_type`
--

CREATE TABLE `team_type` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_title` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `arrangement` int NOT NULL,
  `create_by` int NOT NULL,
  `update_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_special`
--

CREATE TABLE `time_special` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `slot` time NOT NULL,
  `sort_order` int NOT NULL,
  `time_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_supervisor`
--

CREATE TABLE `time_supervisor` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `sort_order` int NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_worker`
--

CREATE TABLE `time_worker` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `sort_order` int NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `pay_rate` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_num` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `temp_ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'means temp data'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tool_record`
--

CREATE TABLE `tool_record` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tool_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transfer_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `from_location` int NOT NULL COMMENT '0:stock -1:vendor\r\nmay be user_id or resident_id based on transfer type',
  `to_location` int NOT NULL COMMENT '0:stock -1:vendor\r\nmay be user_id or resident_id based on transfer type',
  `issued_by` int NOT NULL,
  `created_by` int NOT NULL,
  `resident_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tool_record_photo`
--

CREATE TABLE `tool_record_photo` (
  `id` int NOT NULL,
  `ref_no` int NOT NULL,
  `tool_id` int NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `team_type_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `caseSystem` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_by` int NOT NULL,
  `update_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_encoded_photo`
--

CREATE TABLE `user_encoded_photo` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `encoded_photo` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_search`
--

CREATE TABLE `user_search` (
  `id` int NOT NULL,
  `search_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `result_user_id` int NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'P=Pending, D=Done, N=Not Found',
  `count` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workdone`
--

CREATE TABLE `workdone` (
  `id` int NOT NULL,
  `company_id` int NOT NULL DEFAULT '1',
  `resident_id` int NOT NULL,
  `yearmonth` date NOT NULL,
  `subcon_id` int NOT NULL,
  `award_id` int NOT NULL,
  `day_from` int NOT NULL,
  `day_to` int NOT NULL,
  `manual_dn` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT 'ori-pre',
  `ori_amount` decimal(10,2) NOT NULL,
  `pre_amount` decimal(10,2) NOT NULL,
  `remark` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int NOT NULL,
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_debitnote`
--

CREATE TABLE `worker_debitnote` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `type_id` int NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_incident`
--

CREATE TABLE `worker_incident` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_loan`
--

CREATE TABLE `worker_loan` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `type_id` int NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'open',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_location`
--

CREATE TABLE `worker_location` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `team_id` int NOT NULL,
  `area_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `building_id` int NOT NULL,
  `unit_cat_id` int NOT NULL,
  `unit_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `floorplan_id` int NOT NULL,
  `area_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `server_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_ot`
--

CREATE TABLE `worker_ot` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `team_id` int NOT NULL,
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slot_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `slot_id` int NOT NULL,
  `sort_order` int NOT NULL,
  `pay_rate` int NOT NULL,
  `create_date` date DEFAULT NULL,
  `create_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_payment_date`
--

CREATE TABLE `worker_payment_date` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_special`
--

CREATE TABLE `worker_special` (
  `id` int NOT NULL,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `team_id` int NOT NULL,
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slot_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `slot_id` int NOT NULL,
  `sort_order` int NOT NULL,
  `pay_rate` int NOT NULL,
  `updated` int NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_time_special`
--

CREATE TABLE `worker_time_special` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `resident_id` int NOT NULL,
  `company_id` int NOT NULL,
  `team_id` int NOT NULL,
  `create_date` date NOT NULL,
  `create_by` int NOT NULL,
  `slot_id` int NOT NULL,
  `time_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order`
--

CREATE TABLE `work_order` (
  `id` int NOT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `project_id` int NOT NULL,
  `asset_id` int NOT NULL,
  `job_type_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lead_id` int NOT NULL,
  `user_ids` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `wr_id` int NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complete_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_comment`
--

CREATE TABLE `work_order_comment` (
  `id` int NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wo_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_done_photo`
--

CREATE TABLE `work_order_done_photo` (
  `id` int NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wo_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_photo`
--

CREATE TABLE `work_order_photo` (
  `id` int NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `wo_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_request`
--

CREATE TABLE `work_request` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `asset_id` int NOT NULL,
  `job_type_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Pending, WIP, Completed',
  `create_by` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_request_photo`
--

CREATE TABLE `work_request_photo` (
  `id` int NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `wr_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_bwps_lockouts`
--

CREATE TABLE `wp2620pk_bwps_lockouts` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `active` int NOT NULL,
  `starttime` int NOT NULL,
  `exptime` int NOT NULL,
  `host` varchar(20) DEFAULT NULL,
  `user` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_bwps_log`
--

CREATE TABLE `wp2620pk_bwps_log` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `timestamp` int NOT NULL,
  `host` varchar(20) DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `mem_used` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `data` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_commentmeta`
--

CREATE TABLE `wp2620pk_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_comments`
--

CREATE TABLE `wp2620pk_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_g_ywfz`
--

CREATE TABLE `wp2620pk_g_ywfz` (
  `ywfz_id` int NOT NULL,
  `ywfz_title` varchar(1024) NOT NULL,
  `ywfz_watch` varchar(1024) NOT NULL,
  `ywfz_code` varchar(100) NOT NULL,
  `ywfz_img` varchar(200) NOT NULL,
  `ywfz_size` varchar(10) NOT NULL,
  `ywfz_imglink` varchar(1024) NOT NULL,
  `ywfz_status` varchar(10) NOT NULL,
  `ywfz_sidebar` varchar(10) NOT NULL,
  `ywfz_expire` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_links`
--

CREATE TABLE `wp2620pk_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_options`
--

CREATE TABLE `wp2620pk_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_postmeta`
--

CREATE TABLE `wp2620pk_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_posts`
--

CREATE TABLE `wp2620pk_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_terms`
--

CREATE TABLE `wp2620pk_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_term_relationships`
--

CREATE TABLE `wp2620pk_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_term_taxonomy`
--

CREATE TABLE `wp2620pk_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_tm_taskmeta`
--

CREATE TABLE `wp2620pk_tm_taskmeta` (
  `meta_id` bigint NOT NULL,
  `task_id` bigint NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_tm_tasks`
--

CREATE TABLE `wp2620pk_tm_tasks` (
  `id` int NOT NULL,
  `user_id` bigint NOT NULL,
  `type` varchar(300) NOT NULL,
  `class_identifier` varchar(300) DEFAULT '0',
  `attempts` int DEFAULT '0',
  `description` varchar(300) DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_locked_at` bigint DEFAULT '0',
  `status` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_usermeta`
--

CREATE TABLE `wp2620pk_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp2620pk_users`
--

CREATE TABLE `wp2620pk_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `full_name` varchar(255) NOT NULL,
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `user_role` varchar(255) NOT NULL,
  `user_page` varchar(255) NOT NULL,
  `athorized` varchar(255) NOT NULL,
  `update_terminal` varchar(255) NOT NULL,
  `update_terminal_2` varchar(255) NOT NULL,
  `update_terminal_3` varchar(255) NOT NULL,
  `update_terminal_4` varchar(255) NOT NULL,
  `update_terminal_5` varchar(255) NOT NULL,
  `update_terminal_6` varchar(255) NOT NULL,
  `update_terminal_7` varchar(255) NOT NULL,
  `update_terminal_8` varchar(255) NOT NULL,
  `block_scan` int NOT NULL,
  `rm_terminal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_4` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_6` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_7` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rm_terminal_8` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `search_terminal` int NOT NULL DEFAULT '3',
  `hq` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditation_type`
--
ALTER TABLE `accreditation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_role_site`
--
ALTER TABLE `admin_role_site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_cat`
--
ALTER TABLE `asset_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`time_id`,`location_id`,`verify_by`,`revoke_by`,`verify2_by`,`trade_id`);

--
-- Indexes for table `attendance_manual`
--
ALTER TABLE `attendance_manual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `trade_id` (`trade_id`);

--
-- Indexes for table `attendance_manual_supervisor`
--
ALTER TABLE `attendance_manual_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trade_id` (`trade_id`);

--
-- Indexes for table `attendance_manual_terminal`
--
ALTER TABLE `attendance_manual_terminal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`company_id`,`user_id`);

--
-- Indexes for table `attendance_manual_terminal_supervisor`
--
ALTER TABLE `attendance_manual_terminal_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`company_id`,`user_id`);

--
-- Indexes for table `attendance_supervisor`
--
ALTER TABLE `attendance_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`create_by`,`modify_by`,`verify_by`,`revoke_by`,`team_id`,`time_id`,`verify2_by`,`trade_id`);

--
-- Indexes for table `attendance_terminal`
--
ALTER TABLE `attendance_terminal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sn` (`sn`),
  ADD KEY `time` (`time`),
  ADD KEY `enrollid` (`enrollid`),
  ADD KEY `trade_id` (`trade_id`);

--
-- Indexes for table `attendance_terminal_search`
--
ALTER TABLE `attendance_terminal_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollid` (`enrollid`);

--
-- Indexes for table `attendance_terminal_user`
--
ALTER TABLE `attendance_terminal_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buffer_table`
--
ALTER TABLE `buffer_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`,`user_id`,`team_id`,`trade_id`,`building_id`,`unit_cat_id`,`floorplan_id`,`area_id`);

--
-- Indexes for table `calculation_pattern`
--
ALTER TABLE `calculation_pattern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_big_head`
--
ALTER TABLE `company_big_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_note`
--
ALTER TABLE `credit_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `subcon_type_id` (`subcon_type_id`),
  ADD KEY `debit_to` (`credit_to`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `from_resident_id` (`from_resident_id`);

--
-- Indexes for table `credit_note_requests`
--
ALTER TABLE `credit_note_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`create_by`,`credit_to`,`CN_id`);

--
-- Indexes for table `daily_hour`
--
ALTER TABLE `daily_hour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `date_report`
--
ALTER TABLE `date_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daywork_generate`
--
ALTER TABLE `daywork_generate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trade_id` (`trade_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`),
  ADD KEY `subcon_id` (`subcon_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `daywork_status`
--
ALTER TABLE `daywork_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`subcon_id`,`award_id`);

--
-- Indexes for table `deactivation`
--
ALTER TABLE `deactivation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `resign_reason_id` (`resign_reason_id`),
  ADD KEY `signature_1_by` (`signature_1_by`),
  ADD KEY `signature_2_by` (`signature_2_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `debitnote_photo`
--
ALTER TABLE `debitnote_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debit_id` (`debit_id`);

--
-- Indexes for table `debitnote_worker`
--
ALTER TABLE `debitnote_worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debit_id` (`debit_id`,`user_id`,`team_id`,`create_by`);

--
-- Indexes for table `debit_note`
--
ALTER TABLE `debit_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `subcon_type_id` (`subcon_type_id`),
  ADD KEY `debit_to` (`debit_to`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `from_resident_id` (`from_resident_id`);

--
-- Indexes for table `debit_note_checkifidle`
--
ALTER TABLE `debit_note_checkifidle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`debitnote_type_id`,`building_id`,`unit_cat_id`,`floorplan_id`,`area_id`,`create_by`);

--
-- Indexes for table `debit_note_requests`
--
ALTER TABLE `debit_note_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `reject_by` (`reject_by`),
  ADD KEY `DEB_id` (`DEB_id`),
  ADD KEY `signature_1_by` (`signature_1_by`),
  ADD KEY `signature_2_by` (`signature_2_by`),
  ADD KEY `signature_3_by` (`signature_3_by`),
  ADD KEY `debit_to` (`debit_to`);

--
-- Indexes for table `debit_note_type`
--
ALTER TABLE `debit_note_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details_CNR`
--
ALTER TABLE `details_CNR`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `DNR_id` (`SCNR_id`),
  ADD KEY `reject_by_manager` (`reject_by_manager`),
  ADD KEY `reject_by_director` (`reject_by_director`);

--
-- Indexes for table `details_CNR_Sdoc`
--
ALTER TABLE `details_CNR_Sdoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `details_CNR_id` (`details_CNR_id`);

--
-- Indexes for table `details_DNR`
--
ALTER TABLE `details_DNR`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DNR_id` (`DNR_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `reject_by_manager` (`reject_by_manager`),
  ADD KEY `sl_worker_id` (`sl_worker_id`),
  ADD KEY `rf_items_id` (`rf_items_id`);

--
-- Indexes for table `details_DNR_photo`
--
ALTER TABLE `details_DNR_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `details_DNR_id` (`details_DNR_id`);

--
-- Indexes for table `details_DNR_Sdoc`
--
ALTER TABLE `details_DNR_Sdoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `details_DNR_id` (`details_DNR_id`);

--
-- Indexes for table `detail_daily_report`
--
ALTER TABLE `detail_daily_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `detail_director`
--
ALTER TABLE `detail_director`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`staff_id`);

--
-- Indexes for table `detail_loan`
--
ALTER TABLE `detail_loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`loan_id`,`user_id`,`trade_id`,`verified_by`);

--
-- Indexes for table `detail_manager`
--
ALTER TABLE `detail_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`team_type_id`,`trade_id`),
  ADD KEY `cost_center_id` (`cost_center_id`),
  ADD KEY `superior_id` (`superior_id`);

--
-- Indexes for table `detail_sub`
--
ALTER TABLE `detail_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trade_id` (`trade_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `subcon_company_id` (`subcon_company_id`),
  ADD KEY `gang_id` (`gang_id`);

--
-- Indexes for table `detail_subcon`
--
ALTER TABLE `detail_subcon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`subcon_company_id`,`gang`,`trade_id`);

--
-- Indexes for table `detail_subtotime`
--
ALTER TABLE `detail_subtotime`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `detail_supervisor`
--
ALTER TABLE `detail_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`team_type_id`,`trade_id`),
  ADD KEY `cost_center_id` (`cost_center_id`),
  ADD KEY `subcon_company_id` (`subcon_company_id`),
  ADD KEY `superior_id` (`superior_id`);

--
-- Indexes for table `detail_transfer`
--
ALTER TABLE `detail_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`,`user_id`,`trade_id`,`verified_by`);

--
-- Indexes for table `detail_worker`
--
ALTER TABLE `detail_worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`gang`,`trade_id`),
  ADD KEY `subcon_company_id` (`subcon_company_id`),
  ADD KEY `superior_id` (`superior_id`),
  ADD KEY `superior_sl_id` (`superior_sl_id`),
  ADD KEY `sl_gang` (`sl_gang`),
  ADD KEY `detail_worker` (`user_id`,`subcon_company_id`,`superior_id`,`superior_sl_id`,`sl_gang`,`trade_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `document_special_trade`
--
ALTER TABLE `document_special_trade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`company_id`,`create_by`);

--
-- Indexes for table `door_access`
--
ALTER TABLE `door_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `door_terminal_id` (`door_terminal_id`);

--
-- Indexes for table `door_terminal`
--
ALTER TABLE `door_terminal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gang`
--
ALTER TABLE `gang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gang_parent_log`
--
ALTER TABLE `gang_parent_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_cn_amount`
--
ALTER TABLE `history_cn_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_dn_amount`
--
ALTER TABLE `history_dn_amount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `details_DNR_id` (`details_DNR_id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_type_cat_id` (`job_type_cat_id`);

--
-- Indexes for table `job_type_cat`
--
ALTER TABLE `job_type_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_permit_type`
--
ALTER TABLE `kp_permit_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_approval`
--
ALTER TABLE `loan_approval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`user_id`,`create_by`,`modify_by`,`approved_by`,`resident_id`) USING BTREE,
  ADD KEY `subcon_company_id` (`subcon_company_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `loan_approval_Sdoc`
--
ALTER TABLE `loan_approval_Sdoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_photo`
--
ALTER TABLE `loan_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_area`
--
ALTER TABLE `location_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`block_id`,`level_id`);

--
-- Indexes for table `location_block`
--
ALTER TABLE `location_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `location_level`
--
ALTER TABLE `location_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`block_id`);

--
-- Indexes for table `location_unit`
--
ALTER TABLE `location_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`block_id`,`level_id`);

--
-- Indexes for table `log_accreditation`
--
ALTER TABLE `log_accreditation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `log_attendance_manual`
--
ALTER TABLE `log_attendance_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_charge`
--
ALTER TABLE `log_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `log_charge_loan`
--
ALTER TABLE `log_charge_loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `log_cidb`
--
ALTER TABLE `log_cidb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `log_job`
--
ALTER TABLE `log_job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`trade_id`,`create_by`,`modify_by`);

--
-- Indexes for table `log_loan`
--
ALTER TABLE `log_loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`ref_no`,`company_id`,`loan_from_id`,`loan_to_id`,`create_by`,`approved_by`,`accepted_by`);

--
-- Indexes for table `log_loan_amend`
--
ALTER TABLE `log_loan_amend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amend_by` (`amend_by`),
  ADD KEY `scr_id` (`scr_id`);

--
-- Indexes for table `log_manager`
--
ALTER TABLE `log_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`trade_id`);

--
-- Indexes for table `log_manual_dn`
--
ALTER TABLE `log_manual_dn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_notes`
--
ALTER TABLE `log_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_passport`
--
ALTER TABLE `log_passport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_payment_method`
--
ALTER TABLE `log_payment_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_pay_off`
--
ALTER TABLE `log_pay_off`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subcon_id` (`subcon_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `log_permit`
--
ALTER TABLE `log_permit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_repayment`
--
ALTER TABLE `log_repayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_repayment_loan`
--
ALTER TABLE `log_repayment_loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subcon_company_id` (`subcon_company_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `subcon_id` (`subcon_id`);

--
-- Indexes for table `log_resign`
--
ALTER TABLE `log_resign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`,`user_id`,`resign_reason_id`);

--
-- Indexes for table `log_salary`
--
ALTER TABLE `log_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`user_id`,`create_by`,`modify_by`);

--
-- Indexes for table `log_salary_amend`
--
ALTER TABLE `log_salary_amend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scr_id` (`scr_id`);

--
-- Indexes for table `log_salary_supervisor`
--
ALTER TABLE `log_salary_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`resident_id`,`create_by`,`modify_by`);

--
-- Indexes for table `log_staff`
--
ALTER TABLE `log_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `cost_center_id` (`cost_center_id`);

--
-- Indexes for table `log_sub`
--
ALTER TABLE `log_sub`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_no` (`ref_no`),
  ADD KEY `transfer_id` (`company_id`,`sub_from_id`,`sub_to_id`,`create_by`,`approved_by`,`accepted_by`);

--
-- Indexes for table `log_subcon`
--
ALTER TABLE `log_subcon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`trade_id`,`previous_resident_id`,`previous_team_id`);

--
-- Indexes for table `log_supervisor`
--
ALTER TABLE `log_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`trade_id`,`create_by`,`modify_by`);

--
-- Indexes for table `log_time`
--
ALTER TABLE `log_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_tool`
--
ALTER TABLE `log_tool`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_transfer`
--
ALTER TABLE `log_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`,`company_id`,`transfer_from_id`,`transfer_to_id`,`create_by`,`approved_by`,`accepted_by`);

--
-- Indexes for table `log_worker`
--
ALTER TABLE `log_worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`trade_id`,`previous_resident_id`,`previous_team_id`);

--
-- Indexes for table `log_worker_type`
--
ALTER TABLE `log_worker_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subcon_company_id` (`subcon_company_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `gang_id` (`gang_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `memo`
--
ALTER TABLE `memo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `memo_file`
--
ALTER TABLE `memo_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memo_id` (`memo_id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `ot_slot`
--
ALTER TABLE `ot_slot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`);

--
-- Indexes for table `ot_type`
--
ALTER TABLE `ot_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_frequency`
--
ALTER TABLE `payment_frequency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `payment_import`
--
ALTER TABLE `payment_import`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `permit_bank_generate`
--
ALTER TABLE `permit_bank_generate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `permit_generate`
--
ALTER TABLE `permit_generate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `permit_type`
--
ALTER TABLE `permit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_payment`
--
ALTER TABLE `post_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_payment_request_id` (`post_payment_request_id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subcon_id` (`subcon_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `post_payment_request`
--
ALTER TABLE `post_payment_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`create_by`),
  ADD KEY `resident_id_2` (`resident_id`);

--
-- Indexes for table `ppe_item`
--
ALTER TABLE `ppe_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppe_item_cat`
--
ALTER TABLE `ppe_item_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppe_item_record`
--
ALTER TABLE `ppe_item_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ppe_id` (`ppe_id`);

--
-- Indexes for table `ppe_record`
--
ALTER TABLE `ppe_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `ppe_record_image`
--
ALTER TABLE `ppe_record_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ppe_id` (`ppe_id`);

--
-- Indexes for table `PPRef_No`
--
ALTER TABLE `PPRef_No`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`,`trade_id`,`create_by`);

--
-- Indexes for table `project_details`
--
ALTER TABLE `project_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `punch`
--
ALTER TABLE `punch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`time_id`);

--
-- Indexes for table `punch_status`
--
ALTER TABLE `punch_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`time_id`);

--
-- Indexes for table `punch_status_super`
--
ALTER TABLE `punch_status_super`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`time_id`);

--
-- Indexes for table `punch_supervisor`
--
ALTER TABLE `punch_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`,`time_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `repayment`
--
ALTER TABLE `repayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requisition_form`
--
ALTER TABLE `requisition_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `reject_by` (`reject_by`),
  ADD KEY `signature_1_by` (`signature_1_by`),
  ADD KEY `signature_2_by` (`signature_2_by`),
  ADD KEY `signature_3_by` (`signature_3_by`);

--
-- Indexes for table `residential`
--
ALTER TABLE `residential`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sn_id` (`sn_id`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `resign_reason`
--
ALTER TABLE `resign_reason`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `rf_items`
--
ALTER TABLE `rf_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DNR_id` (`requisition_form_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assign_to` (`assign_to`),
  ADD KEY `sl_worker_id` (`sl_worker_id`),
  ADD KEY `ppe_item_id` (`ppe_item_id`);

--
-- Indexes for table `running_no`
--
ALTER TABLE `running_no`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `salary_advance_requests`
--
ALTER TABLE `salary_advance_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `salary_cash`
--
ALTER TABLE `salary_cash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subcon_id` (`subcon_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `salary_cash_image`
--
ALTER TABLE `salary_cash_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_id` (`sc_id`);

--
-- Indexes for table `salary_changes`
--
ALTER TABLE `salary_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`user_id`,`create_by`,`modify_by`,`approved_by`,`resident_id`) USING BTREE;

--
-- Indexes for table `salary_time`
--
ALTER TABLE `salary_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`);

--
-- Indexes for table `salary_time1`
--
ALTER TABLE `salary_time1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave`
--
ALTER TABLE `staff_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcon`
--
ALTER TABLE `subcon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `subcon_parent_log`
--
ALTER TABLE `subcon_parent_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcon_type`
--
ALTER TABLE `subcon_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `subcon_id` (`subcon_id`);

--
-- Indexes for table `subtrades`
--
ALTER TABLE `subtrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`trades_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `company_id_2` (`company_id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `main_super` (`main_super`);

--
-- Indexes for table `team_mapping`
--
ALTER TABLE `team_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`trade_id`,`tower_id`,`level_id`,`unit_id`,`area_id`);

--
-- Indexes for table `team_type`
--
ALTER TABLE `team_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `time_special`
--
ALTER TABLE `time_special`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`,`time_id`);

--
-- Indexes for table `time_supervisor`
--
ALTER TABLE `time_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`resident_id`);

--
-- Indexes for table `time_worker`
--
ALTER TABLE `time_worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tool_record`
--
ALTER TABLE `tool_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tool_record_photo`
--
ALTER TABLE `tool_record_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`team_type_id`,`trade_id`);

--
-- Indexes for table `user_encoded_photo`
--
ALTER TABLE `user_encoded_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_search`
--
ALTER TABLE `user_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workdone`
--
ALTER TABLE `workdone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `subcon_id` (`subcon_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `worker_debitnote`
--
ALTER TABLE `worker_debitnote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`type_id`);

--
-- Indexes for table `worker_incident`
--
ALTER TABLE `worker_incident`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`create_by`);

--
-- Indexes for table `worker_loan`
--
ALTER TABLE `worker_loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`type_id`);

--
-- Indexes for table `worker_location`
--
ALTER TABLE `worker_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`resident_id`,`team_id`,`building_id`,`unit_cat_id`,`floorplan_id`,`area_id`);

--
-- Indexes for table `worker_ot`
--
ALTER TABLE `worker_ot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`company_id`,`team_id`,`slot_id`,`create_by`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `worker_payment_date`
--
ALTER TABLE `worker_payment_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `worker_special`
--
ALTER TABLE `worker_special`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `worker_time_special`
--
ALTER TABLE `worker_time_special`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`resident_id`,`company_id`,`team_id`,`create_by`,`slot_id`,`time_id`);

--
-- Indexes for table `work_order`
--
ALTER TABLE `work_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `job_type_id` (`job_type_id`),
  ADD KEY `lead_id` (`lead_id`),
  ADD KEY `wr_id` (`wr_id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `work_order_comment`
--
ALTER TABLE `work_order_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_order_photo`
--
ALTER TABLE `work_order_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_request`
--
ALTER TABLE `work_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_request_photo`
--
ALTER TABLE `work_request_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp2620pk_bwps_lockouts`
--
ALTER TABLE `wp2620pk_bwps_lockouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp2620pk_bwps_log`
--
ALTER TABLE `wp2620pk_bwps_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp2620pk_commentmeta`
--
ALTER TABLE `wp2620pk_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`),
  ADD KEY `fgr_dupecheck` (`meta_key`,`meta_value`(11));

--
-- Indexes for table `wp2620pk_comments`
--
ALTER TABLE `wp2620pk_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`);

--
-- Indexes for table `wp2620pk_g_ywfz`
--
ALTER TABLE `wp2620pk_g_ywfz`
  ADD PRIMARY KEY (`ywfz_id`);

--
-- Indexes for table `wp2620pk_links`
--
ALTER TABLE `wp2620pk_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp2620pk_options`
--
ALTER TABLE `wp2620pk_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp2620pk_postmeta`
--
ALTER TABLE `wp2620pk_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp2620pk_posts`
--
ALTER TABLE `wp2620pk_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp2620pk_terms`
--
ALTER TABLE `wp2620pk_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wp2620pk_term_relationships`
--
ALTER TABLE `wp2620pk_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp2620pk_term_taxonomy`
--
ALTER TABLE `wp2620pk_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp2620pk_tm_taskmeta`
--
ALTER TABLE `wp2620pk_tm_taskmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `meta_key` (`meta_key`(191)),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `wp2620pk_tm_tasks`
--
ALTER TABLE `wp2620pk_tm_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp2620pk_usermeta`
--
ALTER TABLE `wp2620pk_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp2620pk_users`
--
ALTER TABLE `wp2620pk_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_login` (`user_login`),
  ADD KEY `company_id` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accreditation_type`
--
ALTER TABLE `accreditation_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_role_site`
--
ALTER TABLE `admin_role_site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_cat`
--
ALTER TABLE `asset_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_manual`
--
ALTER TABLE `attendance_manual`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_manual_supervisor`
--
ALTER TABLE `attendance_manual_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_manual_terminal`
--
ALTER TABLE `attendance_manual_terminal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_manual_terminal_supervisor`
--
ALTER TABLE `attendance_manual_terminal_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_supervisor`
--
ALTER TABLE `attendance_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_terminal`
--
ALTER TABLE `attendance_terminal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_terminal_search`
--
ALTER TABLE `attendance_terminal_search`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_terminal_user`
--
ALTER TABLE `attendance_terminal_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buffer_table`
--
ALTER TABLE `buffer_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calculation_pattern`
--
ALTER TABLE `calculation_pattern`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_big_head`
--
ALTER TABLE `company_big_head`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_note`
--
ALTER TABLE `credit_note`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_note_requests`
--
ALTER TABLE `credit_note_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_hour`
--
ALTER TABLE `daily_hour`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_report`
--
ALTER TABLE `date_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daywork_generate`
--
ALTER TABLE `daywork_generate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daywork_status`
--
ALTER TABLE `daywork_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deactivation`
--
ALTER TABLE `deactivation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debitnote_photo`
--
ALTER TABLE `debitnote_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debitnote_worker`
--
ALTER TABLE `debitnote_worker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit_note`
--
ALTER TABLE `debit_note`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit_note_checkifidle`
--
ALTER TABLE `debit_note_checkifidle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit_note_requests`
--
ALTER TABLE `debit_note_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit_note_type`
--
ALTER TABLE `debit_note_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details_CNR`
--
ALTER TABLE `details_CNR`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details_CNR_Sdoc`
--
ALTER TABLE `details_CNR_Sdoc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details_DNR`
--
ALTER TABLE `details_DNR`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details_DNR_photo`
--
ALTER TABLE `details_DNR_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details_DNR_Sdoc`
--
ALTER TABLE `details_DNR_Sdoc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_daily_report`
--
ALTER TABLE `detail_daily_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_director`
--
ALTER TABLE `detail_director`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_loan`
--
ALTER TABLE `detail_loan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_manager`
--
ALTER TABLE `detail_manager`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_sub`
--
ALTER TABLE `detail_sub`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_subcon`
--
ALTER TABLE `detail_subcon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_subtotime`
--
ALTER TABLE `detail_subtotime`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_supervisor`
--
ALTER TABLE `detail_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_transfer`
--
ALTER TABLE `detail_transfer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_worker`
--
ALTER TABLE `detail_worker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_special_trade`
--
ALTER TABLE `document_special_trade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `door_access`
--
ALTER TABLE `door_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `door_terminal`
--
ALTER TABLE `door_terminal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gang`
--
ALTER TABLE `gang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gang_parent_log`
--
ALTER TABLE `gang_parent_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_cn_amount`
--
ALTER TABLE `history_cn_amount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_dn_amount`
--
ALTER TABLE `history_dn_amount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_type`
--
ALTER TABLE `job_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_type_cat`
--
ALTER TABLE `job_type_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_permit_type`
--
ALTER TABLE `kp_permit_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_approval`
--
ALTER TABLE `loan_approval`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_approval_Sdoc`
--
ALTER TABLE `loan_approval_Sdoc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_photo`
--
ALTER TABLE `loan_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_area`
--
ALTER TABLE `location_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_block`
--
ALTER TABLE `location_block`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_level`
--
ALTER TABLE `location_level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_unit`
--
ALTER TABLE `location_unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_accreditation`
--
ALTER TABLE `log_accreditation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_attendance_manual`
--
ALTER TABLE `log_attendance_manual`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_charge`
--
ALTER TABLE `log_charge`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_charge_loan`
--
ALTER TABLE `log_charge_loan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_cidb`
--
ALTER TABLE `log_cidb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_job`
--
ALTER TABLE `log_job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_loan`
--
ALTER TABLE `log_loan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_loan_amend`
--
ALTER TABLE `log_loan_amend`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_manager`
--
ALTER TABLE `log_manager`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_manual_dn`
--
ALTER TABLE `log_manual_dn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_notes`
--
ALTER TABLE `log_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_passport`
--
ALTER TABLE `log_passport`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_payment_method`
--
ALTER TABLE `log_payment_method`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_pay_off`
--
ALTER TABLE `log_pay_off`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_permit`
--
ALTER TABLE `log_permit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_repayment`
--
ALTER TABLE `log_repayment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_repayment_loan`
--
ALTER TABLE `log_repayment_loan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_resign`
--
ALTER TABLE `log_resign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_salary`
--
ALTER TABLE `log_salary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_salary_amend`
--
ALTER TABLE `log_salary_amend`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_salary_supervisor`
--
ALTER TABLE `log_salary_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_staff`
--
ALTER TABLE `log_staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_sub`
--
ALTER TABLE `log_sub`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_subcon`
--
ALTER TABLE `log_subcon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_supervisor`
--
ALTER TABLE `log_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_time`
--
ALTER TABLE `log_time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_tool`
--
ALTER TABLE `log_tool`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_transfer`
--
ALTER TABLE `log_transfer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_worker`
--
ALTER TABLE `log_worker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_worker_type`
--
ALTER TABLE `log_worker_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memo`
--
ALTER TABLE `memo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memo_file`
--
ALTER TABLE `memo_file`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ot_slot`
--
ALTER TABLE `ot_slot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ot_type`
--
ALTER TABLE `ot_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_frequency`
--
ALTER TABLE `payment_frequency`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_import`
--
ALTER TABLE `payment_import`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permit_bank_generate`
--
ALTER TABLE `permit_bank_generate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permit_generate`
--
ALTER TABLE `permit_generate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permit_type`
--
ALTER TABLE `permit_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_payment`
--
ALTER TABLE `post_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_payment_request`
--
ALTER TABLE `post_payment_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppe_item`
--
ALTER TABLE `ppe_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppe_item_cat`
--
ALTER TABLE `ppe_item_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppe_item_record`
--
ALTER TABLE `ppe_item_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppe_record`
--
ALTER TABLE `ppe_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppe_record_image`
--
ALTER TABLE `ppe_record_image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PPRef_No`
--
ALTER TABLE `PPRef_No`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punch`
--
ALTER TABLE `punch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punch_status`
--
ALTER TABLE `punch_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punch_status_super`
--
ALTER TABLE `punch_status_super`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punch_supervisor`
--
ALTER TABLE `punch_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `race`
--
ALTER TABLE `race`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religion`
--
ALTER TABLE `religion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repayment`
--
ALTER TABLE `repayment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requisition_form`
--
ALTER TABLE `requisition_form`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `residential`
--
ALTER TABLE `residential`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resign_reason`
--
ALTER TABLE `resign_reason`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rf_items`
--
ALTER TABLE `rf_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `running_no`
--
ALTER TABLE `running_no`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_advance_requests`
--
ALTER TABLE `salary_advance_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_cash`
--
ALTER TABLE `salary_cash`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_cash_image`
--
ALTER TABLE `salary_cash_image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_changes`
--
ALTER TABLE `salary_changes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_time`
--
ALTER TABLE `salary_time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_time1`
--
ALTER TABLE `salary_time1`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_leave`
--
ALTER TABLE `staff_leave`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcon`
--
ALTER TABLE `subcon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcon_parent_log`
--
ALTER TABLE `subcon_parent_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcon_type`
--
ALTER TABLE `subcon_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subtrades`
--
ALTER TABLE `subtrades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_mapping`
--
ALTER TABLE `team_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_type`
--
ALTER TABLE `team_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_special`
--
ALTER TABLE `time_special`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_supervisor`
--
ALTER TABLE `time_supervisor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_worker`
--
ALTER TABLE `time_worker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tool_record`
--
ALTER TABLE `tool_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tool_record_photo`
--
ALTER TABLE `tool_record_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_encoded_photo`
--
ALTER TABLE `user_encoded_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_search`
--
ALTER TABLE `user_search`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workdone`
--
ALTER TABLE `workdone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_debitnote`
--
ALTER TABLE `worker_debitnote`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_incident`
--
ALTER TABLE `worker_incident`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_loan`
--
ALTER TABLE `worker_loan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_location`
--
ALTER TABLE `worker_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_ot`
--
ALTER TABLE `worker_ot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_payment_date`
--
ALTER TABLE `worker_payment_date`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_special`
--
ALTER TABLE `worker_special`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_time_special`
--
ALTER TABLE `worker_time_special`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_order`
--
ALTER TABLE `work_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_order_comment`
--
ALTER TABLE `work_order_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_order_photo`
--
ALTER TABLE `work_order_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_request`
--
ALTER TABLE `work_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_request_photo`
--
ALTER TABLE `work_request_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_bwps_lockouts`
--
ALTER TABLE `wp2620pk_bwps_lockouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_bwps_log`
--
ALTER TABLE `wp2620pk_bwps_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_commentmeta`
--
ALTER TABLE `wp2620pk_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_comments`
--
ALTER TABLE `wp2620pk_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_g_ywfz`
--
ALTER TABLE `wp2620pk_g_ywfz`
  MODIFY `ywfz_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_links`
--
ALTER TABLE `wp2620pk_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_options`
--
ALTER TABLE `wp2620pk_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_postmeta`
--
ALTER TABLE `wp2620pk_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_posts`
--
ALTER TABLE `wp2620pk_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_terms`
--
ALTER TABLE `wp2620pk_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_term_taxonomy`
--
ALTER TABLE `wp2620pk_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_tm_taskmeta`
--
ALTER TABLE `wp2620pk_tm_taskmeta`
  MODIFY `meta_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_tm_tasks`
--
ALTER TABLE `wp2620pk_tm_tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_usermeta`
--
ALTER TABLE `wp2620pk_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp2620pk_users`
--
ALTER TABLE `wp2620pk_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
