-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Host: 127.2.161.2:3306
-- Generation Time: Nov 16, 2015 at 12:04 AM
-- Server version: 5.5.45
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Event_Ticketing1`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `total_tickets` int(3) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  KEY `customer_id` (`customer_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`booking_id`, `customer_id`, `id`, `total_tickets`, `price`) VALUES
(2000, 104, 5, 5, 75),
(2001, 101, 3, 4, 60),
(2002, 100, 1, 2, 30),
(2003, 102, 2, 1, 12),
(2004, 101, 2, 5, 60),
(2005, 102, 5, 2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`category_id`,`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Drama'),
(2, 'Sport'),
(3, 'Adventure'),
(4, 'Comedy'),
(5, 'Action');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `cc_num` bigint(16) NOT NULL,
  `cc_name` varchar(50) NOT NULL,
  `cc_exp` date NOT NULL,
  `cc_cvv` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_id`, `password`, `cc_num`, `cc_name`, `cc_exp`, `cc_cvv`) VALUES
(100, 'Raghunath', 'NV', 'raghu@gmail.com', 'raghu123', 9675163598227354, 'raghunath', '2016-02-01', 349),
(101, 'Madhu', 'R', 'madhu@gmail.com', 'india123', 2737263898315628, 'madhu', '2016-06-01', 123),
(102, 'Revanth', 'Malay', 'revanthm@gmail.com', 'db123', 2139563819374282, 'ravi', '2016-07-01', 219),
(103, 'Sravan', 'M', 'sravan@gmail.com', 'proj123', 9845637281293940, 'sravan', '2018-11-01', 435),
(104, 'Roopa', 'Patil', 'roopap@gmail.com', 'roop123', 3728917473287098, 'roopa', '2016-04-01', 214);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `event_name` varchar(25) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` double DEFAULT NULL,
  `category1` int(11) DEFAULT NULL,
  `category2` int(11) DEFAULT NULL,
  `total_seats` int(11) DEFAULT NULL,
  `featuring1` varchar(30) DEFAULT NULL,
  `featuring2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `venue_id` (`venue_id`),
  KEY `category1` (`category1`),
  KEY `category2` (`category2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_id`, `event_name`, `venue_id`, `date`, `time`, `duration`, `category1`, `category2`, `total_seats`, `featuring1`, `featuring2`) VALUES
(1, 1000, 'The Martian', 200, '2015-12-09', '12:00:00', 144, 1, 4, 120, 'Matt Damon', 'Ridley Scott '),
(2, 1000, 'The Martian', 202, '2015-12-09', '13:00:00', 144, 1, 4, 60, 'Matt Damon', 'Ridley Scott '),
(3, 1001, 'Rock Climbing', 204, '2015-12-20', '10:00:00', 120, 2, 3, 10, NULL, NULL),
(4, 1002, 'Laughing Man', 203, '2015-12-22', '16:00:00', 120, 4, NULL, 100, 'John Dell', NULL),
(5, 1003, 'Circus', 203, '2015-11-01', '17:00:00', 120, 5, 4, 200, 'Rambo Circus Team', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `rating` int(5) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  UNIQUE KEY `feedback_id` (`feedback_id`),
  KEY `id` (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `customer_id`, `id`, `rating`, `review`) VALUES
(3000, 104, 5, 4, NULL),
(3001, 102, 5, 1, 'Very bad show');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `price`) VALUES
(1, 15),
(2, 12),
(3, 15),
(4, 20),
(5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE IF NOT EXISTS `venue` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(25) NOT NULL,
  PRIMARY KEY (`venue_id`),
  UNIQUE KEY `venue_id` (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venue_id`, `venue_name`) VALUES
(200, 'Gopalan'),
(201, 'Concord_mall'),
(202, 'Rego_mall'),
(203, 'Oxygen_Club'),
(204, 'NorthLake_Mall');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`id`) REFERENCES `event` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`category2`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`category1`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id`) REFERENCES `event` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
