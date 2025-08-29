-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2025 at 06:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_users`
--

CREATE TABLE `client_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_users`
--

INSERT INTO `client_users` (`id`, `username`, `password`, `is_logged_in`) VALUES
(1, 'client1', 'client123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `position` varchar(100) DEFAULT NULL,
  `last_active` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `photo`, `lastname`, `firstname`, `middlename`, `birthday`, `gender`, `age`, `address`, `contact_no`, `status`, `position`, `last_active`) VALUES
(8, 'uploads/68b10d53d136c_camera_photo.jpg', 'Repolido', 'Rodel', 'Apa', '2004-09-12', 'Male', NULL, ' Bangbang, Cordova, Cebu, Central Visayas, 6017, Philippines', '09105006060', 'Active', 'Mason', NULL),
(10, 'uploads/68b11187d06a9_camera_photo.jpg', 'Sanchez', 'Leonard Khin', 'Sumagang', '2004-05-11', 'Male', NULL, 'Bangbang, Cordova, Cebu, Central Visayas, 6017, Philippines', '09105006060', 'Active', 'Foreman', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_entries`
--

CREATE TABLE `payroll_entries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `days_of_attendance` int(11) DEFAULT 0,
  `halfday` int(11) DEFAULT 0,
  `absent` decimal(10,2) DEFAULT 0.00,
  `holiday_pay` decimal(10,2) DEFAULT 0.00,
  `overtime_pay` decimal(10,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_entries`
--

INSERT INTO `payroll_entries` (`id`, `name`, `position`, `salary`, `days_of_attendance`, `halfday`, `absent`, `holiday_pay`, `overtime_pay`, `subtotal`, `date`, `created_at`, `updated_at`) VALUES
(11, 'Sanchez, Leonard Khin Sumagang', 'Foreman', 700.00, 0, 0, 0.00, 0.00, 0.00, 0.00, '0000-00-00', '2025-08-29 02:36:27', '2025-08-29 02:47:51'),
(12, 'Repolido, Rodel Apa', 'Foreman', 500.00, 0, 0, 0.00, 0.00, 0.00, 0.00, '0000-00-00', '2025-08-29 02:36:33', '2025-08-29 02:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `daily_rate`) VALUES
(7, 'Foreman', 700.00),
(8, 'Mason', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `project_cost` decimal(15,2) NOT NULL,
  `foreman` varchar(255) NOT NULL,
  `project_type` varchar(100) NOT NULL,
  `project_status` varchar(50) NOT NULL,
  `project_divisions` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `start_date`, `deadline`, `location`, `project_cost`, `foreman`, `project_type`, `project_status`, `project_divisions`, `image_path`, `client_name`, `client_number`) VALUES
(9, 'BALAY NI MAYANG', '2025-08-29', '2025-08-29', 'Cagay , Sibonga , Cebu', 3000000.00, 'Sanchez, Leonard Khin Sumagang', 'Building/House', 'Ongoing', 'Phase 1 , Phase 2 , Phase 3,Phase 4, Phase 5', '', 'Gorpyo the boy hugot', '09105006060');

-- --------------------------------------------------------

--
-- Table structure for table `project_divisions`
--

CREATE TABLE `project_divisions` (
  `id` int(11) NOT NULL,
  `division_name` varchar(100) NOT NULL,
  `project_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_divisions`
--

INSERT INTO `project_divisions` (`id`, `division_name`, `project_type`) VALUES
(6, 'Phase 1', 'Building');

-- --------------------------------------------------------

--
-- Table structure for table `project_phase_steps`
--

CREATE TABLE `project_phase_steps` (
  `project_id` int(11) NOT NULL,
  `phase_name` varchar(255) NOT NULL,
  `step_name` varchar(255) NOT NULL,
  `step_order` int(11) DEFAULT 1,
  `description` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `date_started` date DEFAULT NULL,
  `date_completed` date DEFAULT NULL,
  `division_name` varchar(255) DEFAULT NULL,
  `step_description` text DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT 0,
  `image_path` varchar(255) DEFAULT NULL,
  `step_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_phase_steps`
--

INSERT INTO `project_phase_steps` (`project_id`, `phase_name`, `step_name`, `step_order`, `description`, `status`, `date_started`, `date_completed`, `division_name`, `step_description`, `is_finished`, `image_path`, `step_id`) VALUES
(9, '', '', 1, NULL, 'Pending', NULL, NULL, 'Phase 1', 'Clearing', 1, 'uploads/step_images/step_9_Phase 1_1_1756437424_0.jpg', 75),
(9, '', '', 1, NULL, 'Pending', NULL, NULL, 'Phase 1', 'Clearing', 1, 'uploads/step_images/step_9_Phase 1_1_1756437424_3.jpg', 76),
(9, '', '', 2, NULL, 'Pending', NULL, NULL, 'Phase 1', 'Howling', 0, 'uploads/step_images/step_9_Phase 1_2_1756438227_0.png', 77),
(9, '', '', 2, NULL, 'Pending', NULL, NULL, 'Phase 1', 'Howling', 0, 'uploads/step_images/step_9_Phase 1_2_1756438227_1.png', 78),
(9, '', '', 2, NULL, 'Pending', NULL, NULL, 'Phase 1', 'Howling', 0, 'uploads/step_images/step_9_Phase 1_2_1756438227_4.jpeg', 79);

-- --------------------------------------------------------

--
-- Table structure for table `project_progress`
--

CREATE TABLE `project_progress` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `division` varchar(255) NOT NULL,
  `phase` varchar(255) NOT NULL,
  `step` varchar(255) NOT NULL,
  `progress_percent` decimal(5,2) DEFAULT 0.00,
  `remarks` text DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp(),
  `division_name` varchar(255) DEFAULT NULL,
  `progress_percentage` decimal(5,2) DEFAULT 0.00,
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_progress`
--

INSERT INTO `project_progress` (`id`, `project_id`, `division`, `phase`, `step`, `progress_percent`, `remarks`, `updated_at`, `division_name`, `progress_percentage`, `date_updated`) VALUES
(21, 9, '', '', '', 0.00, NULL, '2025-08-29 11:05:40', 'Phase 1', 100.00, '2025-08-29 00:00:00'),
(22, 9, '', '', '', 0.00, NULL, '2025-08-29 11:05:40', 'Phase 2', 0.00, '2025-08-29 00:00:00'),
(23, 9, '', '', '', 0.00, NULL, '2025-08-29 11:05:40', 'Phase 3', 0.00, '2025-08-29 00:00:00'),
(24, 9, '', '', '', 0.00, NULL, '2025-08-29 11:05:40', 'Phase 4', 0.00, '2025-08-29 00:00:00'),
(25, 9, '', '', '', 0.00, NULL, '2025-08-29 11:05:40', 'Phase 5', 0.00, '2025-08-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project_team`
--

CREATE TABLE `project_team` (
  `id` int(11) NOT NULL,
  `foreman_id` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_team`
--

INSERT INTO `project_team` (`id`, `foreman_id`, `status`, `created_at`, `updated_at`) VALUES
(5, 10, 'Active', '2025-08-29 02:51:29', '2025-08-29 02:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `project_team_members`
--

CREATE TABLE `project_team_members` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_team_members`
--

INSERT INTO `project_team_members` (`id`, `team_id`, `employee_id`) VALUES
(16, 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_logged_in` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `is_logged_in`) VALUES
(1, 'admin', 'admin123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_users`
--
ALTER TABLE `client_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_entries`
--
ALTER TABLE `payroll_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `project_divisions`
--
ALTER TABLE `project_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_phase_steps`
--
ALTER TABLE `project_phase_steps`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_progress`
--
ALTER TABLE `project_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_team`
--
ALTER TABLE `project_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foreman` (`foreman_id`);

--
-- Indexes for table `project_team_members`
--
ALTER TABLE `project_team_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_users`
--
ALTER TABLE `client_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payroll_entries`
--
ALTER TABLE `payroll_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_divisions`
--
ALTER TABLE `project_divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project_phase_steps`
--
ALTER TABLE `project_phase_steps`
  MODIFY `step_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `project_progress`
--
ALTER TABLE `project_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_team`
--
ALTER TABLE `project_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_team_members`
--
ALTER TABLE `project_team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_phase_steps`
--
ALTER TABLE `project_phase_steps`
  ADD CONSTRAINT `project_phase_steps_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `project_progress`
--
ALTER TABLE `project_progress`
  ADD CONSTRAINT `project_progress_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `project_team`
--
ALTER TABLE `project_team`
  ADD CONSTRAINT `fk_foreman` FOREIGN KEY (`foreman_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `project_team_ibfk_1` FOREIGN KEY (`foreman_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `project_team_members`
--
ALTER TABLE `project_team_members`
  ADD CONSTRAINT `project_team_members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `project_team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_team_members_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
