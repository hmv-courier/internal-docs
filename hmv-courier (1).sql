-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2023 at 10:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hmv-courier`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `mail` text NOT NULL,
  `phone` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `name`, `mail`, `phone`, `password`) VALUES
(1, 'Alhasan Solate', 'info@hajjmabrur.com', '08023058960', '56b7f959b660999828524e1760764bfc48eb07fb');

-- --------------------------------------------------------

--
-- Table structure for table `business_user`
--

CREATE TABLE `business_user` (
  `id` varchar(535) NOT NULL,
  `name` text NOT NULL,
  `company_name` text NOT NULL,
  `mail` text NOT NULL,
  `phone` text NOT NULL,
  `country` text NOT NULL,
  `password` text NOT NULL,
  `date` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_user`
--

INSERT INTO `business_user` (`id`, `name`, `company_name`, `mail`, `phone`, `country`, `password`, `date`, `reg_date`) VALUES
('383086J', 'Ismail Solate', 'ATG Group', 'alhasan.feyikemi@gmail.com', '08023058960', 'null', 'f7327b2baebe991127c8da27ec218770e0d78935', '24 Sep 2023 01:34pm', '2023-09-24 12:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `business_wallet`
--

CREATE TABLE `business_wallet` (
  `id` varchar(535) NOT NULL,
  `b_id` varchar(535) NOT NULL,
  `type` int(11) NOT NULL,
  `amount` varchar(535) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `b_balance`
--

CREATE TABLE `b_balance` (
  `id` int(11) NOT NULL,
  `b_id` varchar(535) NOT NULL,
  `balance` varchar(535) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_balance`
--

INSERT INTO `b_balance` (`id`, `b_id`, `balance`) VALUES
(1, '383086J', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `user_id` varchar(535) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `pickup_address` varchar(255) NOT NULL,
  `pickup_date` text NOT NULL,
  `pickup_person_name` text NOT NULL,
  `pickup_phone` text NOT NULL,
  `pickup_latitude` decimal(10,6) NOT NULL,
  `pickup_longitude` decimal(10,6) NOT NULL,
  `dropoff_address` varchar(255) NOT NULL,
  `dropoff_date` text NOT NULL,
  `dropoff_person_name` text NOT NULL,
  `dropoff_phone` text NOT NULL,
  `dropoff_latitude` decimal(10,6) NOT NULL,
  `dropoff_longitude` decimal(10,6) NOT NULL,
  `order_status` int(11) NOT NULL,
  `note` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `user_id`, `rider_id`, `pickup_address`, `pickup_date`, `pickup_person_name`, `pickup_phone`, `pickup_latitude`, `pickup_longitude`, `dropoff_address`, `dropoff_date`, `dropoff_person_name`, `dropoff_phone`, `dropoff_latitude`, `dropoff_longitude`, `order_status`, `note`, `creation_date`, `price`) VALUES
(1, '2', 1, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 3, '', '2023-09-10 23:00:00', '2779'),
(2, '2', 1, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 1, '', '2023-09-16 21:46:39', '2779'),
(3, '2', 1, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 0, '', '2023-09-16 21:46:39', '2779'),
(4, '2', 1, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 0, '', '2023-09-16 21:46:39', '2779'),
(5, '2', 1, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 1, '', '2023-09-16 21:46:39', '2779'),
(6, '2', 0, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 0, '', '2023-09-16 21:46:39', '2779'),
(7, '2', 0, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 0, '', '2023-09-16 21:46:39', '2779'),
(8, '2', 0, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 0, '', '2023-09-16 21:46:39', '27792'),
(9, '2', 0, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-03', 'Alhasan', '0', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-09-09', 'Solate', '0', '6.562587', '3.368092', 0, '', '2023-09-16 21:46:39', '442779'),
(10, '2', 1, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-13', 'Alhasan', '0', '6.548528', '3.298788', '31 Adekunle Fajuyi Way, Ikeja GRA 101233, Lagos', '2023-09-07', 'solate', '0', '6.578092', '3.350381', 3, '', '2023-09-16 21:46:39', '2779'),
(11, '1', 0, '', '', '', '0', '0.000000', '0.000000', '', '', '', '0', '0.000000', '0.000000', 0, '', '2023-09-16 21:46:39', '2779'),
(12, '1', 0, '', '', '', '0', '0.000000', '0.000000', '', '', '', '0', '0.000000', '0.000000', 0, '', '2023-09-16 21:46:39', '5462779'),
(13, '1', 1, 'Oyo State Housing Corporation, Ibadan, Nigeria', '2023-09-13', 'Alhasan Solate', '2147483647', '7.418551', '3.902607', '45 Isolo Road, Lagos, Nigeria', '2023-09-30', 'Alamin', '2147483647', '6.528393', '3.348200', 1, '', '2023-09-16 21:46:39', '5562779'),
(14, '1', 1, 'Kaduna South, Nigeria', '2023-09-13', 'aaa', '08023058960', '10.463066', '7.413802', 'Ogun State, Nigeria', '2023-09-15', 'sss', '08023058960', '6.997975', '3.473738', 1, 'hi', '2023-09-16 21:46:39', '2779'),
(15, '3', 2, 'Adewale Adenuga Street, Lagos, Nigeria', '2023-09-16', 'Ahmed', '', '6.547750', '3.299969', 'Awoyemi Street, Ejigbo, Lagos, Nigeria', '2023-09-16', 'Afeez', '', '6.550036', '3.307704', 1, '', '2023-09-16 21:46:39', '2779'),
(16, '2', 0, '41 Agudama Street, Port Harcourt, Nigeria', '2023-09-20', 'aLHASAN', '', '4.805158', '7.004034', '31 Adewale Adenuga Street, Ejigbo, Lagos, Nigeria', '2023-09-30', 'Alikopa', '', '6.548528', '3.298788', 0, 'nothing', '2023-09-17 12:53:29', '161241'),
(17, '2', 0, 'Lagos, Nigeria', '2023-09-25', 'ogun', '', '6.524379', '3.379206', 'Ogun State, Nigeria', '2023-09-30', 'aaa', '', '6.997975', '3.473738', 0, '', '2023-09-17 12:56:58', '19089'),
(18, '2', 0, '', '', '', '08023058960', '0.000000', '0.000000', '', '', '', '08023058960', '0.000000', '0.000000', 0, '', '2023-09-17 13:00:45', ''),
(19, '2', 0, 'Marcina Kasprzaka 31, Warsaw, Poland', '2023-09-07', 'aaa', '08023058960', '52.227352', '20.953269', 'California, MO, USA', '2023-09-15', 'jjj', '08023058960', '38.627528', '-92.566579', 0, 'nothing', '2023-09-17 13:03:24', '2862'),
(20, '2', 0, '31 Adewale Adenuga Street, Lagos, Nigeria', '2023-09-10', 'aaa', '08023058960', '6.548528', '3.298788', '9a Abiodun Fasakin Crescent, Lagos, Nigeria', '2023-10-04', 'ss', '08023058960', '6.562587', '3.368092', 0, 'nothing', '2023-09-17 17:02:50', '2779');

-- --------------------------------------------------------

--
-- Table structure for table `rider_locations`
--

CREATE TABLE `rider_locations` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rider_locations`
--

INSERT INTO `rider_locations` (`id`, `rider_id`, `latitude`, `longitude`, `timestamp`) VALUES
(1, 1, '6.562901', '3.368013', '2023-09-17 13:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `rider_order_locations`
--

CREATE TABLE `rider_order_locations` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rider_order_locations`
--

INSERT INTO `rider_order_locations` (`id`, `rider_id`, `order_id`, `latitude`, `longitude`, `timestamp`) VALUES
(1, 2, 10, '6.562850', '3.367961', '2023-09-07 15:23:12'),
(2, 2, 13, '6.562901', '3.368013', '2023-09-13 21:26:45'),
(3, 2, 14, '6.562901', '3.368013', '2023-09-13 21:35:42'),
(4, 1, 1, '6.562901', '3.368013', '2023-09-16 13:19:45'),
(5, 1, 13, '6.562901', '3.368013', '2023-09-16 13:37:46'),
(6, 1, 5, '6.562903', '3.368013', '2023-09-16 17:36:12'),
(7, 1, 2, '6.562901', '3.368013', '2023-09-17 13:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `mail` text NOT NULL,
  `phone` text NOT NULL,
  `country` text NOT NULL,
  `password` text NOT NULL,
  `date` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `mail`, `phone`, `country`, `password`, `date`, `reg_date`) VALUES
(1, 'Alhasan Solate', 'sunkanmi.yisa@gmail.com', '2147483647', 'null', 'f7327b2baebe991127c8da27ec218770e0d78935', '02 Sep 2023 06:46pm', '2023-09-16 22:07:22'),
(2, 'Alamin Solate', 'sunkanmi.yisa@gmail.com', '2147483647', 'null', 'f7327b2baebe991127c8da27ec218770e0d78935', '02 Sep 2023 06:58pm', '2023-09-16 22:07:22'),
(3, 'Ahmed Solate', 'amdsolt@yahoo.com', '08023058960', 'null', '956360f05d1ce5a9a552723bc68e31843d1c04f5', '16 Sep 2023 02:12pm', '2023-09-16 22:07:22'),
(4, 'alhasan.feyikemi@gmail.com', 'aaaa@gg.cc', '08908023058960', 'null', 'f7327b2baebe991127c8da27ec218770e0d78935', '17 Sep 2023 03:28pm', '2023-09-17 14:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_rider`
--

CREATE TABLE `user_rider` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `mail` text NOT NULL,
  `phone` text NOT NULL,
  `operator` int(11) NOT NULL,
  `country` text NOT NULL,
  `password` text NOT NULL,
  `date` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_rider`
--

INSERT INTO `user_rider` (`id`, `name`, `mail`, `phone`, `operator`, `country`, `password`, `date`, `reg_date`) VALUES
(1, 'Alhasan Solate', 'alhasan.feyikemi@gmail.com', '2147483647', 0, 'null', 'f7327b2baebe991127c8da27ec218770e0d78935', '05 Sep 2023 04:07pm', '2023-09-16 22:05:07'),
(3, 'Ahmed Solate', 'amdsolt@yahoo.com', '08023058960', 0, 'null', 'f7327b2baebe991127c8da27ec218770e0d78935', '16 Sep 2023 10:40pm', '2023-09-16 22:05:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_user`
--
ALTER TABLE `business_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_wallet`
--
ALTER TABLE `business_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_balance`
--
ALTER TABLE `b_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_locations`
--
ALTER TABLE `rider_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_order_locations`
--
ALTER TABLE `rider_order_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rider`
--
ALTER TABLE `user_rider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b_balance`
--
ALTER TABLE `b_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rider_locations`
--
ALTER TABLE `rider_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rider_order_locations`
--
ALTER TABLE `rider_order_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_rider`
--
ALTER TABLE `user_rider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
