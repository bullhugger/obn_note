-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2025 at 04:51 PM
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
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_team_id` int DEFAULT NULL,
  `trade_id` int NOT NULL,
  `punch_in` datetime NOT NULL,
  `punch_in_image` varchar(128) NOT NULL,
  `punch_out` datetime NOT NULL,
  `punch_out_image` varchar(128) DEFAULT NULL,
  `ot_punch_in` datetime DEFAULT NULL,
  `ot_punch_out` datetime DEFAULT NULL,
  `prayer` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `project_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `trade_id` int NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `ot_type` enum('fixed','multiply') DEFAULT NULL,
  `ot_multiply` decimal(10,0) DEFAULT NULL,
  `ot_rate` decimal(10,0) DEFAULT NULL
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
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `worker_id` (`user_id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
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
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
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
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `worker` (`id`);

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `award_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `award_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`);

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
