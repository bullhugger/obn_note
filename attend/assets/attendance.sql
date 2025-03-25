-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2025 at 04:45 PM
-- Server version: 8.0.41-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accredidation`
--

CREATE TABLE `accredidation` (
  `id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `project_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `ot_type` enum('fixed','multiply') DEFAULT NULL,
  `ot_multiply` decimal(10,0) DEFAULT NULL,
  `ot_rate` decimal(10,0) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accredidation_log`
--

CREATE TABLE `accredidation_log` (
  `id` int NOT NULL,
  `accredidation_id` int NOT NULL,
  `action` enum('create','update','delete') DEFAULT NULL,
  `title` varchar(32) NOT NULL,
  `project_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `ot_type` enum('fixed','multiply') DEFAULT NULL,
  `ot_multiply` decimal(10,0) DEFAULT NULL,
  `ot_rate` decimal(10,0) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_team_id` int DEFAULT NULL,
  `trade_id` int NOT NULL,
  `prayer` tinyint DEFAULT NULL,
  `punch_in` datetime NOT NULL,
  `punch_in_image` varchar(128) NOT NULL,
  `punch_out` datetime NOT NULL,
  `punch_out_image` varchar(128) DEFAULT NULL,
  `ot_punch_in` datetime DEFAULT NULL,
  `ot_punch_out` datetime DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_log`
--

CREATE TABLE `attendance_log` (
  `id` int NOT NULL,
  `attendance_id` int NOT NULL,
  `action` enum('create','update','delete') DEFAULT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_team_id` int DEFAULT NULL,
  `trade_id` int NOT NULL,
  `prayer` tinyint DEFAULT NULL,
  `punch_in` datetime NOT NULL,
  `punch_in_image` varchar(128) NOT NULL,
  `punch_out` datetime NOT NULL,
  `punch_out_image` varchar(128) DEFAULT NULL,
  `ot_punch_in` datetime DEFAULT NULL,
  `ot_punch_out` datetime DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daywork`
--

CREATE TABLE `daywork` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `year_month` date DEFAULT NULL,
  `worker_type` enum('KSK','SL','DSC','NSC') DEFAULT NULL,
  `subcon_id` int DEFAULT NULL,
  `accred_id` int DEFAULT NULL,
  `day_from` int DEFAULT '0',
  `day_to` int DEFAULT '0',
  `salary_post` decimal(10,0) DEFAULT NULL,
  `permit_deduct` decimal(10,0) DEFAULT NULL,
  `loan_deduct` decimal(10,0) DEFAULT NULL,
  `misc_deduct` decimal(10,0) DEFAULT NULL,
  `dn_deduct` decimal(10,0) DEFAULT NULL,
  `payment_made` decimal(10,0) DEFAULT NULL,
  `transaction_type` enum('CASH','BANK','WALLET') DEFAULT NULL,
  `trade_id` int DEFAULT NULL,
  `status` tinyint DEFAULT '0',
  `ref_no` varchar(64) DEFAULT NULL,
  `record_id` varchar(64) DEFAULT NULL,
  `payment_purpose` varchar(128) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int NOT NULL,
  `title` varchar(16) NOT NULL,
  `region` enum('central','northen','southern') NOT NULL,
  `location` varchar(16) DEFAULT NULL,
  `commencement_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `detail` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcon`
--

CREATE TABLE `subcon` (
  `id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reg_no` varchar(64) NOT NULL,
  `contact` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `sub_type` varchar(16) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--

CREATE TABLE `trade` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `team_type_id` int NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_pass` varchar(128) NOT NULL,
  `user_group_id` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `allow_read_project` tinyint DEFAULT NULL,
  `allow_create_project` tinyint DEFAULT NULL,
  `allow_update_project` tinyint DEFAULT NULL,
  `allow_delete_project` tinyint DEFAULT NULL,
  `allow_read_user` tinyint DEFAULT NULL,
  `allow_create_user` tinyint DEFAULT NULL,
  `allow_update_user` tinyint DEFAULT NULL,
  `allow_delete_user` tinyint DEFAULT NULL,
  `allow_read_user_group` tinyint DEFAULT NULL,
  `allow_create_user_group` tinyint DEFAULT NULL,
  `allow_update_user_group` tinyint DEFAULT NULL,
  `allow_delete_user_group` tinyint DEFAULT NULL,
  `allow_read_requisition_form` tinyint DEFAULT NULL,
  `allow_create_requisition_form` tinyint DEFAULT NULL,
  `allow_update_requisition_form` tinyint DEFAULT NULL,
  `allow_delete_requisition_form` tinyint DEFAULT NULL,
  `allow_read_debit_note` tinyint DEFAULT NULL,
  `allow_create_debit_note` tinyint DEFAULT NULL,
  `allow_update_debit_note` tinyint DEFAULT NULL,
  `allow_delete_debit_note` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ic_passport` varchar(128) NOT NULL,
  `staff_id` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `mobile_no` varchar(128) NOT NULL,
  `bank_acc` varchar(16) DEFAULT NULL,
  `sex` tinyint NOT NULL,
  `nationality` varchar(8) NOT NULL,
  `race` varchar(8) DEFAULT NULL,
  `religion` varchar(8) DEFAULT NULL,
  `friday_prayer` tinyint DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_group`
--

CREATE TABLE `worker_group` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_type_list`
--

CREATE TABLE `worker_type_list` (
  `id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `worker_id` int DEFAULT NULL,
  `worker_type` enum('KSK','SL','DSC','NSC') NOT NULL,
  `leader` tinyint DEFAULT NULL,
  `worker_group_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accredidation`
--
ALTER TABLE `accredidation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `accredidation_log`
--
ALTER TABLE `accredidation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `worker_id` (`user_id`);

--
-- Indexes for table `attendance_log`
--
ALTER TABLE `attendance_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `worker_id` (`user_id`);

--
-- Indexes for table `daywork`
--
ALTER TABLE `daywork`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcon`
--
ALTER TABLE `subcon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade`
--
ALTER TABLE `trade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_group` (`user_group_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_worker_user` (`user_id`);

--
-- Indexes for table `worker_group`
--
ALTER TABLE `worker_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worker_type_list`
--
ALTER TABLE `worker_type_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `fk_worker_group` (`worker_group_id`),
  ADD KEY `fk_project_id` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accredidation`
--
ALTER TABLE `accredidation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accredidation_log`
--
ALTER TABLE `accredidation_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_log`
--
ALTER TABLE `attendance_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daywork`
--
ALTER TABLE `daywork`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcon`
--
ALTER TABLE `subcon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade`
--
ALTER TABLE `trade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker`
--
ALTER TABLE `worker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_group`
--
ALTER TABLE `worker_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_type_list`
--
ALTER TABLE `worker_type_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accredidation`
--
ALTER TABLE `accredidation`
  ADD CONSTRAINT `accredidation_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `accredidation_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `worker` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_group` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`);

--
-- Constraints for table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `fk_worker_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `worker_type_list`
--
ALTER TABLE `worker_type_list`
  ADD CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `fk_worker_group` FOREIGN KEY (`worker_group_id`) REFERENCES `worker_group` (`id`),
  ADD CONSTRAINT `worker_type_list_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
