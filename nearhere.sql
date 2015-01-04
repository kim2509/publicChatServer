-- phpMyAdmin SQL Dump
-- version 4.3.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2015 at 09:41 PM
-- Server version: 5.5.39-MariaDB
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nearhere`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `userID` varchar(30) NOT NULL,
`postID` int(11) NOT NULL,
  `message` text NOT NULL,
  `content` text NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `reward` varchar(50) NOT NULL,
  `createDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`userID`, `postID`, `message`, `content`, `latitude`, `longitude`, `reward`, `createDate`) VALUES
('kim2509', 1, '강남 코다차야 술집 대신 줄 서 줄 사람~', '신논현역 5번출구에 코다차야 라는 술집이 있어요. 거기에는 갈 때마다 사람이 너무 많아서... 오늘 저녁 7시에 가야 되는데요. 기다리지 않게 먼저 가서 줄 서 주실수 있을까요?', '37.4704213612', '126.96732417061958', '5,000', '2014-12-09'),
('kim2509', 2, '휴대폰 충전케이블 좀 사다줄 사람', '휴대폰은 갤럭시S3 입니다. 일반 삼성 케이블이면 가능하겠지요. 오늘까지 가능할까요? 제가 6시에 퇴근이니깐 그 전까지 갖다주세요.', '37.475210', '126.963372', '3,000', '2014-12-22'),
('kim2509', 3, '저녁 장 봐 줄 사람', '', '37.480370', '126.951656', '5,000', '2014-12-22'),
('kim2509', 4, '김밥 3줄만 사다 줘요.', '', '37.472193', '126.969288', '2,000', '2014-12-22'),
('kim2509', 5, '강남까지 카풀 하실분~', '', '37.472841', '126.965404', '7,000', '2014-12-22'),
('kim2509', 6, '인터스텔라 예매좀 해주세요.', '', '37.474680', '126.969932', '3,000', '2014-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE IF NOT EXISTS `post_like` (
`likeID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `userID` varchar(30) NOT NULL,
  `createDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`likeID`, `postID`, `userID`, `createDate`) VALUES
(1, 1, 'kim2509', '2014-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `post_reply`
--

CREATE TABLE IF NOT EXISTS `post_reply` (
`replyID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `userID` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `distance` varchar(20) NOT NULL,
  `createDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_reply`
--

INSERT INTO `post_reply` (`replyID`, `postID`, `userID`, `message`, `distance`, `createDate`) VALUES
(1, 1, 'kim2509', '오호 살아났나', '0.6', '2014-12-09'),
(2, 2, 'kim2509', '정확히 어디사세요?', '2', '2015-01-03'),
(3, 2, 'kim2509', '가격은 얼마정도 생각하시나요?', '2.5', '2015-01-03'),
(4, 2, 'licenser', '보상금을 좀 더 줄수 있나요?', '3.2', '2015-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` varchar(20) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `regID` varchar(300) NOT NULL,
  `profileImageURL` varchar(200) NOT NULL,
  `createDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `regID`, `profileImageURL`, `createDate`) VALUES
('kim2509', '김대용', 'APA91bGMIshMfOktzDxHtRFAGYgWBQXeviX_Wbbwj5LfIhfTKcaFxmwqSN2BNL9dR5XSZZYhc-MpZ9KPkh19V8wUF7cwNS-awWSDc5mrInijF6UVCjM2vhg_UAmGBykpdDl3K1t9XIANHHnciJVw4tYclUx6lo-jb6QHtc-MGsbu2eX6RRVrtQY', 'dy.png', '2014-12-09'),
('licenser', '김광중', '', '', '2015-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `user_location`
--

CREATE TABLE IF NOT EXISTS `user_location` (
  `userID` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `locationName` varchar(20) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_location`
--

INSERT INTO `user_location` (`userID`, `latitude`, `longitude`, `locationName`, `priority`) VALUES
('kim2509', '37.4704401', '126.9673307', '현재위치', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
 ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `post_reply`
--
ALTER TABLE `post_reply`
 ADD PRIMARY KEY (`replyID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `post_reply`
--
ALTER TABLE `post_reply`
MODIFY `replyID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
