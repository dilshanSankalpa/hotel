-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 06, 2020 at 08:32 PM
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
  `type` int(1) NOT NULL COMMENT 'management = 1 kitchen staff = 2 cleaning staff = 3 receptionist = 4 admin = 5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `name`, `gender`, `tpNo`, `salaryGrade`, `wsd`, `facilityId`, `id`, `type`) VALUES
(1, 'aa', 1, '010110010', 1, '2020-10-05', 1, 1, 1),
(2, 'aa', 1, '010110010', 1, '2020-10-05', 1, 1, 1),
(3, 'bvcik', 1, '31151', 1, '2020-10-01', 1, 2, 1);

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
(1, 'blah', 100, 10, 1, 'bvcik');

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

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `foodId` int(3) NOT NULL,
  `rate` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(3) NOT NULL,
  `cost` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `foodGuest`
--

CREATE TABLE `foodGuest` (
  `guestId` int(3) NOT NULL,
  `foodId` int(3) NOT NULL,
  `portion` int(1) NOT NULL COMMENT '1 = single 2 = double 3 = multiple 4 = group'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guestId` int(3) NOT NULL,
  `CID` date NOT NULL,
  `COD` date NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 = family 2 = individual 3 = individual',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guestId`, `CID`, `COD`, `type`, `id`) VALUES
(1, '2020-10-12', '2020-09-30', 2, 3),
(2, '2020-10-13', '2020-10-13', 2, 5),
(3, '2020-10-23', '2020-10-22', 2, 6),
(4, '2020-11-05', '2020-11-07', 2, 7),
(5, '2020-11-05', '2020-11-07', 2, 7),
(6, '2020-11-05', '2020-11-07', 2, 7),
(7, '2020-11-05', '2020-11-07', 2, 7),
(8, '2020-11-05', '2020-11-07', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `guestFacility`
--

CREATE TABLE `guestFacility` (
  `guestId` int(3) NOT NULL,
  `facilityId` int(3) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guTell`
--

CREATE TABLE `guTell` (
  `guestId` int(3) NOT NULL,
  `tel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(7, 'Ddr3 RX20', 2, '1356887');

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
(2, '123', 1, 'aa'),
(3, '123', 1, 'aas'),
(5, '123', 1, 'qq'),
(6, '123', 1, 'Dilshan Sakalpa'),
(7, '123', 1, 'Ddr3 RX20'),
(11, 'sdad', 1, 'Ddr3 RX20dad');

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
  MODIFY `empId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `facilityId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guestId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomNo` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
