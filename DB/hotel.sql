-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 11, 2020 at 11:53 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cheff`
--

CREATE TABLE `cheff` (
  `empId` int(3) NOT NULL,
  `sArea` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cheffGuest`
--

CREATE TABLE `cheffGuest` (
  `empId` int(3) NOT NULL,
  `foodId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cleaner`
--

CREATE TABLE `cleaner` (
  `empId` int(4) NOT NULL,
  `location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `guestId` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`guestId`, `name`, `address`) VALUES
(11, 'big company', 'big company, colombo');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empId` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` int(1) NOT NULL COMMENT 'male = 1 female = 2',
  `tpNo` varchar(10) NOT NULL,
  `salaryGrade` int(1) NOT NULL COMMENT 'low = 1 middle = 2 high = 3',
  `wsd` date NOT NULL,
  `facilityId` int(3) DEFAULT NULL,
  `id` int(3) NOT NULL,
  `type` int(1) NOT NULL COMMENT 'management = 1 kitchen staff = 2 cleaning staff = 3 receptionist = 4 '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `name`, `gender`, `tpNo`, `salaryGrade`, `wsd`, `facilityId`, `id`, `type`) VALUES
(5, 'wathsala', 1, '01245664', 1, '2020-10-01', NULL, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `facilityId` int(3) NOT NULL,
  `location` varchar(50) NOT NULL,
  `cost` int(4) NOT NULL,
  `rate` int(2) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = indoor 2 = outdoor',
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`facilityId`, `location`, `cost`, `rate`, `type`, `name`) VALUES
(4, 'first floor', 200, 5, 1, 'facility 1'),
(5, 'garden', 230, 8, 2, 'facillty 2');

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `guestId` int(3) NOT NULL,
  `hName` varchar(50) NOT NULL,
  `hGender` int(1) NOT NULL COMMENT '1 = male 2 = female',
  `hNIC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `family`
--

INSERT INTO `family` (`guestId`, `hName`, `hGender`, `hNIC`) VALUES
(9, 'sarath', 1, 171474895);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `foodId` int(3) NOT NULL,
  `rate` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(1) NOT NULL,
  `cost` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`foodId`, `rate`, `name`, `type`, `cost`) VALUES
(1, 10, 'rice', 1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `foodGuest`
--

CREATE TABLE `foodGuest` (
  `guestId` int(3) NOT NULL,
  `foodId` int(3) NOT NULL,
  `portion` int(1) NOT NULL COMMENT '1 = single 2 = double 3 = multiple 4 = group'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodGuest`
--

INSERT INTO `foodGuest` (`guestId`, `foodId`, `portion`) VALUES
(9, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guestId` int(3) NOT NULL,
  `CID` date NOT NULL,
  `COD` date NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 = family 2 = individual 3 = company',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guestId`, `CID`, `COD`, `type`, `id`) VALUES
(9, '2020-10-01', '2020-10-08', 1, 12),
(10, '2020-10-01', '2020-10-15', 2, 13),
(11, '2020-10-07', '2020-10-08', 3, 14);

-- --------------------------------------------------------

--
-- Table structure for table `guestFacility`
--

CREATE TABLE `guestFacility` (
  `guestId` int(3) NOT NULL,
  `facilityId` int(3) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guestFacility`
--

INSERT INTO `guestFacility` (`guestId`, `facilityId`, `duration`) VALUES
(9, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `guTell`
--

CREATE TABLE `guTell` (
  `guestId` int(3) NOT NULL,
  `tel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guTell`
--

INSERT INTO `guTell` (`guestId`, `tel`) VALUES
(9, '0777777777'),
(9, '088888888'),
(10, '088814447'),
(11, '0781345');

-- --------------------------------------------------------

--
-- Table structure for table `individual`
--

CREATE TABLE `individual` (
  `guestId` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` int(1) NOT NULL COMMENT '1 = male 2 = female',
  `NIC` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individual`
--

INSERT INTO `individual` (`guestId`, `name`, `gender`, `NIC`) VALUES
(10, 'akila', 1, '01275463');

-- --------------------------------------------------------

--
-- Table structure for table `indoorRReq`
--

CREATE TABLE `indoorRReq` (
  `facilityId` int(11) NOT NULL,
  `rReq` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kitchenStaff`
--

CREATE TABLE `kitchenStaff` (
  `empId` int(3) NOT NULL,
  `experience` int(1) NOT NULL COMMENT '1 = less than five years 2 = between 5 to 10 years 3 = more than 10 years',
  `contractPeriod` int(2) DEFAULT NULL COMMENT 'enter the number of years',
  `cheffFlag` int(1) NOT NULL COMMENT '1 = is a cheff 0 = not a cheff',
  `supportFlag` int(1) NOT NULL COMMENT '1 = is a supporter 0 = not a supporter',
  `waiter` int(1) NOT NULL COMMENT '1 = waiter 0 = not a waiter'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `grade` int(1) NOT NULL COMMENT 'junior = 1 senior = 2 ',
  `designation` varchar(50) NOT NULL,
  `empId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`grade`, `designation`, `empId`) VALUES
(1, 'boss', 15);

-- --------------------------------------------------------

--
-- Table structure for table `outdoorGReq`
--

CREATE TABLE `outdoorGReq` (
  `facilityId` int(11) NOT NULL,
  `gReq` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `outdoorSReq`
--

CREATE TABLE `outdoorSReq` (
  `facilityId` int(3) NOT NULL,
  `sReq` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `recGuest`
--

CREATE TABLE `recGuest` (
  `guestId` int(4) NOT NULL,
  `empId` int(4) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomNo` int(4) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1= single 2=double',
  `rate` int(1) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1 = available 2 = unavailable',
  `cost` int(4) NOT NULL,
  `location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomNo`, `type`, `rate`, `status`, `cost`, `location`) VALUES
(1, 1, 5, 1, 300, '1st floor');

-- --------------------------------------------------------

--
-- Table structure for table `roomClean`
--

CREATE TABLE `roomClean` (
  `empId` int(3) NOT NULL,
  `roomNo` int(3) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roomGuest`
--

CREATE TABLE `roomGuest` (
  `guestId` int(3) NOT NULL,
  `roomNo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomGuest`
--

INSERT INTO `roomGuest` (`guestId`, `roomNo`) VALUES
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(4) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(1) NOT NULL COMMENT 'guest = 1 employee = 2 admin = 3',
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `type`, `name`) VALUES
(12, '123', 1, 'family'),
(13, '123', 1, 'individual'),
(14, '123', 1, 'company'),
(15, '123', 2, 'manager'),
(16, '123', 2, 'receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `waiter`
--

CREATE TABLE `waiter` (
  `empId` int(3) NOT NULL,
  `sStyle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cheff`
--
ALTER TABLE `cheff`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `cheffGuest`
--
ALTER TABLE `cheffGuest`
  ADD PRIMARY KEY (`empId`,`foodId`);

--
-- Indexes for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD PRIMARY KEY (`empId`,`location`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facilityId`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`hNIC`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`foodId`);

--
-- Indexes for table `foodGuest`
--
ALTER TABLE `foodGuest`
  ADD PRIMARY KEY (`guestId`,`foodId`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guestId`);

--
-- Indexes for table `guestFacility`
--
ALTER TABLE `guestFacility`
  ADD PRIMARY KEY (`facilityId`,`guestId`);

--
-- Indexes for table `guTell`
--
ALTER TABLE `guTell`
  ADD PRIMARY KEY (`guestId`,`tel`);

--
-- Indexes for table `individual`
--
ALTER TABLE `individual`
  ADD PRIMARY KEY (`NIC`);

--
-- Indexes for table `indoorRReq`
--
ALTER TABLE `indoorRReq`
  ADD PRIMARY KEY (`facilityId`,`rReq`);

--
-- Indexes for table `kitchenStaff`
--
ALTER TABLE `kitchenStaff`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `outdoorGReq`
--
ALTER TABLE `outdoorGReq`
  ADD PRIMARY KEY (`facilityId`,`gReq`);

--
-- Indexes for table `outdoorSReq`
--
ALTER TABLE `outdoorSReq`
  ADD PRIMARY KEY (`facilityId`,`sReq`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomNo`);

--
-- Indexes for table `roomClean`
--
ALTER TABLE `roomClean`
  ADD PRIMARY KEY (`empId`,`roomNo`);

--
-- Indexes for table `roomGuest`
--
ALTER TABLE `roomGuest`
  ADD PRIMARY KEY (`guestId`,`roomNo`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `waiter`
--
ALTER TABLE `waiter`
  ADD PRIMARY KEY (`empId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `facilityId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `foodId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guestId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomNo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `outdoorGReq`
--
ALTER TABLE `outdoorGReq`
  ADD CONSTRAINT `outdoorGReq_ibfk_1` FOREIGN KEY (`facilityId`) REFERENCES `facility` (`facilityId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `outdoorSReq`
--
ALTER TABLE `outdoorSReq`
  ADD CONSTRAINT `outdoorSReq_ibfk_1` FOREIGN KEY (`facilityId`) REFERENCES `facility` (`facilityId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
