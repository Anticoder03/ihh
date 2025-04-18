-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2025 at 05:32 PM
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
-- Database: `pharma`
--

-- --------------------------------------------------------

--
-- Table structure for table `freelancers`
--
-- ----------------------------
-- Table: freelancers
-- ----------------------------
CREATE TABLE `freelancers` (
  `freelancer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `phone` VARCHAR(15) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `expertise` VARCHAR(100),
  `resume` VARCHAR(255),
  `status` ENUM('Pending','Approved','Declined') DEFAULT 'Pending',
  `profile_picture` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`freelancer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- ----------------------------
-- Table: outlets
-- ----------------------------
CREATE TABLE `outlets` (
  `outlet_id` INT(11) NOT NULL AUTO_INCREMENT,
  `outlet_name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `manager_email` VARCHAR(100) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`outlet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- ----------------------------
-- Table: tasks
-- ----------------------------
CREATE TABLE `tasks` (
  `task_id` INT(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` INT(11),
  `outlet_id` INT(11),
  `task_date` DATE NOT NULL,
  `task_title` VARCHAR(100),
  `task_desc` TEXT,
  `status` ENUM('Pending','In Progress','Completed') DEFAULT 'Pending',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`),
  FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers`(`freelancer_id`) ON DELETE SET NULL,
  FOREIGN KEY (`outlet_id`) REFERENCES `outlets`(`outlet_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- ----------------------------
-- Table: reports
-- ----------------------------
CREATE TABLE `reports` (
  `report_id` INT(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` INT(11),
  `outlet_id` INT(11),
  `title` VARCHAR(255),
  `description` TEXT,
  `file_attachment` VARCHAR(255),
  `status` ENUM('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers`(`freelancer_id`) ON DELETE SET NULL,
  FOREIGN KEY (`outlet_id`) REFERENCES `outlets`(`outlet_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- ----------------------------
-- Table: ratings
-- ----------------------------
CREATE TABLE `ratings` (
  `rating_id` INT(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` INT(11),
  `rating` INT(11) CHECK (`rating` BETWEEN 1 AND 5),
  `comment` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rating_id`),
  FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers`(`freelancer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- ----------------------------
-- Table: admin (optional)
-- ----------------------------
CREATE TABLE `admin` (
  `admin_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
