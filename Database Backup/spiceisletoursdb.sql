-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2025 at 11:26 PM
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
-- Database: `spiceisletoursdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `ClientID` int(11) NOT NULL,
  `OutingID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `ReviewText` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`ClientID`, `OutingID`, `Rating`, `ReviewText`) VALUES
(1, 1, 5, 'Amazing tour! John was very knowledgeable about spices.'),
(1, 2, 5, 'Beautiful beach and excellent guide!'),
(2, 1, 4, 'Great experience, learned a lot about nutmeg.'),
(3, 1, 5, 'Fantastic spice tour! Would recommend to anyone.'),
(3, 3, 4, 'The waterfalls were breathtaking.');

-- --------------------------------------------------------

--
-- Table structure for table `certification`
--

CREATE TABLE `certification` (
  `GuideID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `TestDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certification`
--

INSERT INTO `certification` (`GuideID`, `LocationID`, `TestDate`) VALUES
(1, 1, '2023-05-10'),
(1, 2, '2023-05-15'),
(1, 4, '2023-05-20'),
(2, 2, '2023-06-20'),
(2, 3, '2023-06-25'),
(2, 6, '2023-06-30'),
(3, 1, '2023-04-05'),
(3, 5, '2023-04-10'),
(3, 6, '2023-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Telephone` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ClientID`, `FirstName`, `LastName`, `Telephone`, `Email`) VALUES
(1, 'Sarah', 'Johnson', '473-555-0101', 'sarah@email.com'),
(2, 'Mike', 'Smith', '473-555-0102', 'mike@email.com'),
(3, 'Lisa', 'Brown', '473-555-0103', 'lisa@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `guide`
--

CREATE TABLE `guide` (
  `GuideID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `HomeAddress` text NOT NULL,
  `DateOfHire` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guide`
--

INSERT INTO `guide` (`GuideID`, `FirstName`, `LastName`, `HomeAddress`, `DateOfHire`) VALUES
(1, 'John', 'Baptiste', 'St. George, Grenada', '2022-01-15'),
(2, 'Maria', 'Francis', 'Grand Anse, Grenada', '2023-03-20'),
(3, 'David', 'St. Louis', 'Gouyave, Grenada', '2021-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `LocationName` varchar(100) NOT NULL,
  `LocationType` varchar(50) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `OfficialDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationID`, `LocationName`, `LocationType`, `Address`, `OfficialDescription`) VALUES
(1, 'Dougaldston Spice Estate', 'Plantation', 'St. John, Grenada', 'Historic spice plantation'),
(2, 'Grand Anse Beach', 'Beach', 'Grand Anse, St. George', 'Famous 2-mile white sand beach'),
(3, 'Annandale Falls', 'Waterfall', 'St. George, Grenada', 'Beautiful 30-foot waterfall'),
(4, 'Fort Frederick', 'Historic Site', 'St. George, Grenada', '18th century fort with panoramic views'),
(5, 'Gouyave Nutmeg Station', 'Processing Plant', 'Gouyave, St. John', 'Working nutmeg processing facility'),
(6, 'Concord Falls', 'Waterfall', 'St. John, Grenada', 'Series of three stunning waterfalls');

-- --------------------------------------------------------

--
-- Table structure for table `outing`
--

CREATE TABLE `outing` (
  `OutingID` int(11) NOT NULL,
  `TourID` int(11) NOT NULL,
  `GuideID` int(11) NOT NULL,
  `ScheduledDateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outing`
--

INSERT INTO `outing` (`OutingID`, `TourID`, `GuideID`, `ScheduledDateTime`) VALUES
(1, 1, 1, '2024-02-15 09:00:00'),
(2, 2, 2, '2024-02-16 10:00:00'),
(3, 3, 3, '2024-02-17 08:00:00'),
(4, 1, 1, '2024-12-20 09:00:00'),
(5, 2, 2, '2024-12-21 10:00:00'),
(6, 3, 3, '2024-12-22 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE `tour` (
  `TourID` int(11) NOT NULL,
  `TourName` varchar(100) NOT NULL,
  `LengthHours` decimal(3,1) NOT NULL,
  `Fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`TourID`, `TourName`, `LengthHours`, `Fee`) VALUES
(1, 'Spice Plantation Tour', 4.5, 75.00),
(2, 'Grand Anse Beach Experience', 3.0, 50.00),
(3, 'Waterfalls & Rainforest', 6.0, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `touritinerary`
--

CREATE TABLE `touritinerary` (
  `TourID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `VisitOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `touritinerary`
--

INSERT INTO `touritinerary` (`TourID`, `LocationID`, `VisitOrder`) VALUES
(1, 1, 1),
(1, 4, 3),
(1, 5, 2),
(2, 2, 1),
(2, 3, 3),
(2, 4, 2),
(3, 1, 3),
(3, 3, 1),
(3, 6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ClientID`,`OutingID`),
  ADD KEY `OutingID` (`OutingID`);

--
-- Indexes for table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`GuideID`,`LocationID`),
  ADD KEY `LocationID` (`LocationID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `guide`
--
ALTER TABLE `guide`
  ADD PRIMARY KEY (`GuideID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `outing`
--
ALTER TABLE `outing`
  ADD PRIMARY KEY (`OutingID`),
  ADD KEY `TourID` (`TourID`),
  ADD KEY `GuideID` (`GuideID`);

--
-- Indexes for table `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`TourID`);

--
-- Indexes for table `touritinerary`
--
ALTER TABLE `touritinerary`
  ADD PRIMARY KEY (`TourID`,`LocationID`),
  ADD KEY `LocationID` (`LocationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guide`
--
ALTER TABLE `guide`
  MODIFY `GuideID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `outing`
--
ALTER TABLE `outing`
  MODIFY `OutingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tour`
--
ALTER TABLE `tour`
  MODIFY `TourID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`OutingID`) REFERENCES `outing` (`OutingID`);

--
-- Constraints for table `certification`
--
ALTER TABLE `certification`
  ADD CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`GuideID`) REFERENCES `guide` (`GuideID`),
  ADD CONSTRAINT `certification_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `outing`
--
ALTER TABLE `outing`
  ADD CONSTRAINT `outing_ibfk_1` FOREIGN KEY (`TourID`) REFERENCES `tour` (`TourID`),
  ADD CONSTRAINT `outing_ibfk_2` FOREIGN KEY (`GuideID`) REFERENCES `guide` (`GuideID`);

--
-- Constraints for table `touritinerary`
--
ALTER TABLE `touritinerary`
  ADD CONSTRAINT `touritinerary_ibfk_1` FOREIGN KEY (`TourID`) REFERENCES `tour` (`TourID`),
  ADD CONSTRAINT `touritinerary_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
