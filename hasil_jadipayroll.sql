-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for payroll
CREATE DATABASE IF NOT EXISTS `payroll` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `payroll`;

-- Dumping structure for table payroll.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table payroll.attendance: ~3 rows (approximately)
INSERT INTO `attendance` (`id`, `emp_id`, `date`, `status`) VALUES
	(1, 9, '2025-11-11', 1),
	(2, 8, '2025-11-11', 0),
	(3, 10, '2025-11-11', 1);

-- Dumping structure for table payroll.department
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `dp_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table payroll.department: ~3 rows (approximately)
INSERT INTO `department` (`id`, `emp_id`, `dp_name`) VALUES
	(3, 8, 'test1'),
	(4, 9, 'test2'),
	(5, 10, 'test3');

-- Dumping structure for table payroll.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dpt_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `fn` varchar(35) NOT NULL,
  `ls` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dpt_id` (`dpt_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `salary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table payroll.employee: ~3 rows (approximately)
INSERT INTO `employee` (`id`, `dpt_id`, `s_id`, `fn`, `ls`) VALUES
	(8, 3, 4, 'Reza', 'Auditore'),
	(9, 4, 5, 'Berto', 'Muntaber'),
	(10, 5, 6, 'Sano', 'Muntaber');

-- Dumping structure for table payroll.payslip
CREATE TABLE IF NOT EXISTS `payslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `pay_date` date NOT NULL DEFAULT current_timestamp(),
  `total_sl` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `payslip_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table payroll.payslip: ~3 rows (approximately)
INSERT INTO `payslip` (`id`, `emp_id`, `pay_date`, `total_sl`) VALUES
	(1, 8, '2025-11-11', 500.00),
	(2, 9, '2025-11-11', 9000.00),
	(3, 10, '2025-11-11', 5000.00);

-- Dumping structure for table payroll.salary
CREATE TABLE IF NOT EXISTS `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_slr` decimal(10,2) NOT NULL,
  `bonus` decimal(10,2) NOT NULL,
  `ot_pay` decimal(10,2) NOT NULL,
  `deduct` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table payroll.salary: ~3 rows (approximately)
INSERT INTO `salary` (`id`, `basic_slr`, `bonus`, `ot_pay`, `deduct`) VALUES
	(4, 25000.00, 500.00, 9000.00, 890.00),
	(5, 150000.00, 5000.00, 8000.00, 9000.00),
	(6, 95000.00, 2000.00, 7000.00, 500.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
