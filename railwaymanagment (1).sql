-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 11:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railwaymanagment`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingclerk`
--

CREATE TABLE `bookingclerk` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coach_yard`
--

CREATE TABLE `coach_yard` (
  `ID` int(11) NOT NULL,
  `Station_ID` int(11) NOT NULL,
  `Size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Birth_Date` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Working_Hours` int(11) NOT NULL,
  `JobID` int(11) NOT NULL CHECK (`JobID` >= 1 and `JobID` <= 3),
  `StationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact`
--

CREATE TABLE `employee_contact` (
  `Employee_ID` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `ID` int(11) NOT NULL,
  `Job_Description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `ID` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_contact`
--

CREATE TABLE `passenger_contact` (
  `Passenger_ID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_phone`
--

CREATE TABLE `passenger_phone` (
  `Passenger_ID` int(11) NOT NULL,
  `Code` int(11) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_subscription`
--

CREATE TABLE `passenger_subscription` (
  `Passenger_ID` int(11) NOT NULL,
  `Subscription_ID` int(11) NOT NULL,
  `Exp_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `repair_yard`
--

CREATE TABLE `repair_yard` (
  `ID` int(11) NOT NULL,
  `Station_ID` int(11) NOT NULL,
  `Size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Source_ID` int(11) NOT NULL,
  `Destination_ID` int(11) NOT NULL,
  `Distance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `ID` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Street` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stationmanager`
--

CREATE TABLE `stationmanager` (
  `ID` int(11) NOT NULL,
  `usersID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `ID` int(11) NOT NULL,
  `Fees` int(11) NOT NULL,
  `Class` varchar(1) NOT NULL,
  `No_Trips` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Status` bit(1) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `No_Seats` int(11) NOT NULL,
  `Speed` int(11) NOT NULL,
  `No_Cars` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Driver_ID` int(11) DEFAULT NULL,
  `Repair_Yard_ID` int(11) DEFAULT NULL,
  `Coach_Yard_ID` int(11) DEFAULT NULL,
  `BoughtByID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `ID` int(11) NOT NULL,
  `Dept_Time` datetime NOT NULL,
  `Arr_Time` datetime NOT NULL,
  `Type` int(11) NOT NULL,
  `Source_ID` int(11) NOT NULL,
  `Destintaion_ID` int(11) NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `StManager_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `PasswordHash` binary(64) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingclerk`
--
ALTER TABLE `bookingclerk`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `f_u` (`user_ID`);

--
-- Indexes for table `coach_yard`
--
ALTER TABLE `coach_yard`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Station_ID` (`Station_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StationID` (`StationID`);

--
-- Indexes for table `employee_contact`
--
ALTER TABLE `employee_contact`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Job_Description` (`Job_Description`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `passenger_contact`
--
ALTER TABLE `passenger_contact`
  ADD PRIMARY KEY (`Passenger_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `passenger_phone`
--
ALTER TABLE `passenger_phone`
  ADD PRIMARY KEY (`Passenger_ID`,`Code`,`Number`);

--
-- Indexes for table `passenger_subscription`
--
ALTER TABLE `passenger_subscription`
  ADD KEY `P_ID` (`Passenger_ID`),
  ADD KEY `P_SID` (`Subscription_ID`);

--
-- Indexes for table `repair_yard`
--
ALTER TABLE `repair_yard`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Station_ID` (`Station_ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Destination_ID`,`Source_ID`),
  ADD KEY `Source_ID` (`Source_ID`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `stationmanager`
--
ALTER TABLE `stationmanager`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_Id` (`usersID`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Repair_Yard_ID` (`Repair_Yard_ID`),
  ADD KEY `Coach_Yard_ID` (`Coach_Yard_ID`),
  ADD KEY `BoughtByID` (`BoughtByID`),
  ADD KEY `Driver_ID` (`Driver_ID`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `T_ID` (`Train_ID`),
  ADD KEY `M_ID` (`StManager_ID`),
  ADD KEY `SD_sourcedestionation` (`Source_ID`,`Destintaion_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookingclerk`
--
ALTER TABLE `bookingclerk`
  ADD CONSTRAINT `f_u` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `coach_yard`
--
ALTER TABLE `coach_yard`
  ADD CONSTRAINT `coach_yard_ibfk_1` FOREIGN KEY (`Station_ID`) REFERENCES `station` (`ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`StationID`) REFERENCES `station` (`ID`);

--
-- Constraints for table `employee_contact`
--
ALTER TABLE `employee_contact`
  ADD CONSTRAINT `employee_contact_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID`);

--
-- Constraints for table `passenger_contact`
--
ALTER TABLE `passenger_contact`
  ADD CONSTRAINT `passenger_contact_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`ID`);

--
-- Constraints for table `passenger_phone`
--
ALTER TABLE `passenger_phone`
  ADD CONSTRAINT `passenger_phone_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`ID`);

--
-- Constraints for table `passenger_subscription`
--
ALTER TABLE `passenger_subscription`
  ADD CONSTRAINT `P_ID` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`ID`),
  ADD CONSTRAINT `P_SID` FOREIGN KEY (`Subscription_ID`) REFERENCES `subscription` (`ID`);

--
-- Constraints for table `repair_yard`
--
ALTER TABLE `repair_yard`
  ADD CONSTRAINT `repair_yard_ibfk_1` FOREIGN KEY (`Station_ID`) REFERENCES `station` (`ID`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`Source_ID`) REFERENCES `station` (`ID`),
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`Destination_ID`) REFERENCES `station` (`ID`);

--
-- Constraints for table `stationmanager`
--
ALTER TABLE `stationmanager`
  ADD CONSTRAINT `F_Id` FOREIGN KEY (`usersID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`Repair_Yard_ID`) REFERENCES `repair_yard` (`ID`),
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`Coach_Yard_ID`) REFERENCES `coach_yard` (`ID`),
  ADD CONSTRAINT `train_ibfk_3` FOREIGN KEY (`BoughtByID`) REFERENCES `employee` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `train_ibfk_4` FOREIGN KEY (`Driver_ID`) REFERENCES `employee` (`ID`);

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `M_ID` FOREIGN KEY (`StManager_ID`) REFERENCES `stationmanager` (`ID`),
  ADD CONSTRAINT `SD_sourcedestionation` FOREIGN KEY (`Source_ID`,`Destintaion_ID`) REFERENCES `route` (`Source_ID`, `Destination_ID`),
  ADD CONSTRAINT `T_ID` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
