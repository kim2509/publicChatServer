-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.6.17 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 nearhere.post_region 구조 내보내기
CREATE TABLE IF NOT EXISTS `post_region` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(11) DEFAULT NULL,
  `regionName` varchar(50) DEFAULT NULL,
  `lRegionNo` int(11) DEFAULT NULL,
  `mRegionNo` int(11) DEFAULT NULL,
  `sRegionNo` int(11) DEFAULT NULL,
  `tRegionNo` int(11) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `postID_lRegionNo_mRegionNo_sRegionNo_tRegionNo` (`postID`,`lRegionNo`,`mRegionNo`,`sRegionNo`,`tRegionNo`),
  KEY `postID` (`postID`)
) ENGINE=InnoDB AUTO_INCREMENT=16040 DEFAULT CHARSET=utf8;

-- 테이블 데이터 nearhere.post_region:~3,102 rows (대략적) 내보내기
/*!40000 ALTER TABLE `post_region` DISABLE KEYS */;
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12969, 7, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:30:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12970, 8, '출발지', 40, 10, 378, NULL, '37.496933', '127.025593', '서울 서초구 서초동 1321-15', '2016-09-02 22:30:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12971, 9, '출발지', 40, 5, 317, NULL, '37.483432', '126.899144', '서울 구로구 구로동 814', '2016-09-02 22:30:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12972, 10, '출발지', 40, 13, 443, NULL, '37.519911', '126.877056', '서울 양천구 신정동 1279', '2016-09-02 22:30:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12973, 11, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:30:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12974, 12, '출발지', 40, 4, 309, NULL, '37.553007', '127.073629', '서울 광진구 군자동 98', '2016-09-02 22:30:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12975, 15, '출발지', 40, 284, 5314, NULL, '37.574368', '127.040019', '서울 동대문구 용두동 39-9', '2016-09-02 22:30:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12976, 16, '출발지', 40, 16, 561, NULL, '37.570041', '126.999359', '서울 종로구 예지동 3-2', '2016-09-02 22:30:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12977, 17, '출발지', 40, 7, 327, NULL, '37.514072', '126.94167', '서울 동작구 노량진동 67-2', '2016-09-02 22:30:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12978, 18, '출발지', 40, 7, 327, NULL, '37.514072', '126.94167', '서울 동작구 노량진동 67-2', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12979, 19, '출발지', 40, 7, 327, NULL, '37.514072', '126.94167', '서울 동작구 노량진동 67-2', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12980, 21, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12981, 22, '출발지', 40, 9, 370, NULL, '37.51548147939936', '127.10602182894944', '서울 송파구 신천동 12', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12982, 23, '출발지', 40, 34, 684, NULL, '37.619046', '126.921184', '서울 은평구 불광동 487-2', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12983, 24, '출발지', 40, 8, 346, NULL, '37.578171', '126.894616', '서울 마포구 상암동 1616', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12984, 25, '출발지', 40, 8, 342, NULL, '37.556838', '126.923774', '서울 마포구 동교동 192-5', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12985, 38, '출발지', 40, 17, 632, NULL, '37.554102', '127.010252', '서울 중구 신당동 369-2', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12986, 39, '출발지', 40, 16, 599, NULL, '37.571942', '127.004327', '서울 종로구 효제동 198', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12987, 40, '출발지', 40, 15, 502, NULL, '37.540046', '126.992102', '서울 용산구 이태원동 211-33', '2016-09-02 22:30:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12988, 41, '출발지', 40, 5, 317, NULL, '37.48525', '126.901472', '서울 구로구 구로동 810-3', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12989, 42, '출발지', 40, 5, 317, NULL, '37.48525', '126.901472', '서울 구로구 구로동 810-3', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12990, 43, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12991, 44, '출발지', 18, 90, 1473, NULL, '37.394253', '126.956821', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12992, 45, '출발지', 40, 3, 305, NULL, '37.4704033', '126.967185', '서울 관악구 봉천동 180-325', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12993, 46, '출발지', 40, 17, 632, NULL, '37.54872606974804', '127.00883902609348', '서울 중구 신당동 844', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12994, 49, '출발지', 18, 51, 750, NULL, '37.48530479727289', '126.81157931685448', '경기 부천시 역곡동 382', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12995, 50, '출발지', 18, 51, 750, NULL, '37.48530479727289', '126.81157931685448', '경기 부천시 역곡동 382', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12996, 52, '출발지', 40, 3, 305, NULL, '37.4704633', '126.9666116', '서울 관악구 봉천동 180-352', '2016-09-02 22:30:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12997, 53, '출발지', 40, 3, 305, NULL, '37.4704405', '126.9673131', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12998, 54, '출발지', 40, 3, 305, NULL, '37.4704332', '126.9673285', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(12999, 55, '출발지', 40, 3, 305, NULL, '37.4704179', '126.9673582', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13000, 56, '출발지', 40, 3, 305, NULL, '37.470425', '126.9673378', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13001, 57, '출발지', 40, 3, 305, NULL, '37.4704243', '126.9673464', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13002, 58, '출발지', 40, 3, 305, NULL, '37.4704329', '126.9673415', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13003, 59, '출발지', 40, 3, 305, NULL, '37.4704629', '126.9673363', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13004, 60, '출발지', 40, 5, 317, NULL, '37.4842973', '126.9019966', '서울 구로구 구로동 1123-2', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13005, 61, '출발지', 40, 13, 443, NULL, '37.516511', '126.8770233', '서울 양천구 신정동 139-2', '2016-09-02 22:30:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13006, 62, '출발지', 40, 13, 443, NULL, '37.5165577', '126.8770212', '서울 양천구 신정동 139-2', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13007, 63, '출발지', 40, 13, 443, NULL, '37.518218987509364', '126.87612734735013', '서울 양천구 신정동 126-5', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13008, 64, '출발지', 40, 3, 305, NULL, '37.4704184', '126.9673193', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13009, 65, '출발지', 40, 5, 317, NULL, '37.48459791296226', '126.89521126449108', '서울 구로구 구로동 197-8', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13010, 66, '출발지', 40, 3, 305, NULL, '37.4704417', '126.9673192', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13011, 67, '출발지', 40, 3, 305, NULL, '37.4704419', '126.9673296', '서울 관악구 봉천동 180-93', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13012, 68, '출발지', 40, 34, 682, NULL, '37.600869', '126.935761', '서울 은평구 녹번동 55', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13013, 69, '출발지', 40, 5, 317, NULL, '37.486087', '126.887272', '서울 구로구 구로동 772', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13014, 70, '출발지', 40, 6, 324, NULL, '37.4803495', '126.8767163', '서울 금천구 가산동 543-1', '2016-09-02 22:30:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13015, 71, '출발지', 40, 5, 317, NULL, '37.4868683', '126.8940114', '서울 구로구 구로동 170-6', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13016, 72, '출발지', 40, 14, 468, NULL, '37.527141', '126.93281', '서울 영등포구 여의도동 84-4', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13017, 73, '출발지', 40, 1, 295, NULL, '37.50090536382925', '127.03672662377357', '서울 강남구 역삼동 804', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13018, 74, '출발지', 40, 6, 324, NULL, '37.476878', '126.891758', '서울 금천구 가산동 144-3', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13019, 75, '출발지', 40, 16, 570, NULL, '37.57184', '126.998856', '서울 종로구 인의동 48-57', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13020, 76, '출발지', 40, 14, 468, NULL, '37.524937', '126.925284', '서울 영등포구 여의도동 23', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13021, 77, '출발지', 23, 146, 2565, NULL, '35.118995', '126.893876', '광주 남구 진월동 산 218-1', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13022, 78, '출발지', 40, 283, 5311, NULL, '37.5390686', '127.1253798', '서울 강동구 천호동 454-2', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13023, 79, '출발지', 40, 1, 295, NULL, '37.4999765', '127.0362502', '서울 강남구 역삼동 737', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13024, 80, '출발지', 40, 14, 468, NULL, '37.528573', '126.928974', '서울 영등포구 여의도동 2-11', '2016-09-02 22:30:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13025, 81, '출발지', 20, 129, 2016, NULL, '37.3917725', '126.6479379', '인천 연수구 송도동 4-1', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13026, 82, '출발지', 39, 278, 5230, NULL, '35.531573', '129.305221', '울산 남구 신정동 1651-9', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13027, 83, '출발지', 22, 140, 2292, NULL, '35.8676328', '128.7230666', '대구 동구 각산동 296-15', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13028, 84, '출발지', 22, 140, 2292, NULL, '35.8675258', '128.7230997', '대구 동구 각산동 296-15', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13029, 85, '출발지', 22, 140, 2292, NULL, '35.8675884', '128.723079', '대구 동구 각산동 296-15', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13030, 86, '출발지', 40, 1, 295, NULL, '37.5050778', '127.0360328', '서울 강남구 역삼동 660-2', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13031, 87, '출발지', 40, 3, 305, NULL, '37.47166982278219', '126.96742270141841', '서울 관악구 봉천동 178-292', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13032, 88, '출발지', 25, 181, 3183, 10304, '36.6982485', '127.4089836', '충북 청주시 흥덕구 옥산면 남촌리 1111-1', '2016-09-02 22:30:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13033, 89, '출발지', 18, 90, 1476, NULL, '37.3899307', '126.9513718', '경기 안양시 동안구 호계동 1039-2', '2016-09-02 22:30:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13034, 90, '출발지', 40, 1, 290, NULL, '37.508861', '127.063149', '서울 강남구 삼성동 172-66', '2016-09-02 22:30:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13035, 91, '출발지', 27, 211, 3812, 13901, '36.86565', '128.523039', '경북 영주시 봉현면 오현리 275-1', '2016-09-02 22:30:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13036, 92, '출발지', 40, 10, 377, NULL, '37.47623557864488', '126.98183219879864', '서울 서초구 방배동 2387', '2016-09-02 22:30:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13037, 93, '출발지', 18, 72, 1201, NULL, '37.6771078', '126.7571478', '경기 고양시 일산서구 주엽동 8', '2016-09-02 22:30:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13038, 94, '출발지', 22, 140, 2304, NULL, '35.8673676', '128.7233125', '대구 동구 동호동 366-3', '2016-09-02 22:30:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13039, 95, '출발지', 27, 220, 3950, 14918, '35.9935405', '129.3429648', '경북 포항시 남구 연일읍 괴정리 405-8', '2016-09-02 22:30:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13040, 96, '출발지', 40, 14, 468, NULL, '37.5278876', '126.9291337', '서울 영등포구 여의도동 20', '2016-09-02 22:30:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13041, 97, '출발지', 26, 194, 3445, NULL, '36.820251', '127.156708', '충남 천안시 동남구 신부동 354-1', '2016-09-02 22:30:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13042, 98, '출발지', 30, 67, 1111, NULL, '34.7707888', '127.652643', '전남 여수시 선원동 1256', '2016-09-02 22:30:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13043, 99, '출발지', 18, 87, 1404, NULL, '37.3374829', '126.8111139', '경기 안산시 단원구 선부동 1082', '2016-09-02 22:30:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13044, 100, '출발지', 19, 108, 1769, 7438, '35.311934', '129.243577', '부산 기장군 장안읍 좌천리 203-2', '2016-09-02 22:30:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13045, 101, '출발지', 25, 179, 3127, NULL, '36.636306', '127.4585751', '충북 청주시 서원구 사창동 141-27', '2016-09-02 22:30:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13046, 102, '출발지', 40, 1, 295, NULL, '37.4998562', '127.0368', '서울 강남구 역삼동 737', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13047, 103, '출발지', 18, 51, 754, NULL, '37.524675', '126.8072939', '경기 부천시 원종동 272-18', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13048, 104, '출발지', 40, 8, 347, NULL, '37.5561577', '126.9247694', '서울 마포구 서교동 348-35', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13049, 105, '출발지', 40, 1, 295, NULL, '37.502434', '127.0361699', '서울 강남구 역삼동 800-3', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13050, 106, '출발지', 40, 283, 5303, NULL, '37.568482', '127.178089', '서울 강동구 강일동 348-33', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13051, 107, '출발지', 40, 14, 468, NULL, '37.527983', '126.929114', '서울 영등포구 여의도동 20', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13052, 108, '출발지', 27, 60, 905, NULL, '36.1052531', '128.4015719', '경북 구미시 진평동 645', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13053, 109, '출발지', 40, 17, 623, NULL, '37.557841', '126.969471', '서울 중구 봉래동2가 122', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13054, 110, '출발지', 18, 85, 1352, NULL, '37.267208', '127.0008522', '경기 수원시 팔달구 매산로1가 69-1', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13055, 111, '출발지', 40, 5, 317, NULL, '37.494014', '126.872871', '서울 구로구 구로동 685-202', '2016-09-02 22:30:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13056, 112, '출발지', 40, 5, 317, NULL, '37.4813896', '126.8945143', '서울 구로구 구로동 235-3', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13057, 113, '출발지', 20, 122, 1924, 7466, '37.7451409', '126.4808461', '인천 강화군 강화읍 신문리 560-9', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13058, 114, '출발지', 28, 235, 4322, NULL, '35.2235651', '128.6941759', '경남 창원시 의창구 신월동 501-29', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13059, 115, '출발지', 18, 64, 1020, 6026, '37.3586255', '127.1462251', '경기 광주시 오포읍 신현리 736', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13060, 116, '출발지', 29, 253, 4750, NULL, '35.8363105', '127.1102673', '전북 전주시 완산구 서신동 977', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13061, 117, '출발지', 28, 233, 4263, NULL, '35.250683', '128.574231', '경남 창원시 마산회원구 합성동 산 109-1', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13062, 118, '출발지', 18, 70, 1173, NULL, '37.618914', '126.821067', '경기 고양시 덕양구 토당동 454-3', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13063, 119, '출발지', 40, 8, 346, NULL, '37.580601', '126.887855', '서울 마포구 상암동 1600', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13064, 120, '출발지', 20, 123, 1959, NULL, '37.5261573', '126.6998024', '인천 계양구 효성동 554-10', '2016-09-02 22:30:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13065, 121, '출발지', 40, 32, 675, NULL, '37.62544728562016', '127.073027305305', '서울 노원구 공릉동 385-4', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13066, 123, '출발지', 30, 67, 1136, NULL, '34.760688575213564', '127.6672438904643', '전남 여수시 학동 162', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13067, 124, '출발지', 30, 67, 1103, NULL, '34.7536907', '127.6950978', '전남 여수시 문수동 473-1', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13068, 125, '출발지', 18, 101, 1620, NULL, '37.738098', '127.033682', '경기 의정부시 의정부동 326-2', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13069, 126, '출발지', 30, 67, 1136, NULL, '34.761855', '127.661768', '전남 여수시 학동 300', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13070, 127, '출발지', 30, 67, 1136, NULL, '34.761855', '127.661768', '전남 여수시 학동 300', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13071, 128, '출발지', 27, 60, 886, 5657, '36.141392', '128.442385', '경북 구미시 산동면 봉산리 567-1', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13072, 129, '출발지', 40, 5, 319, NULL, '37.508996', '126.891583', '서울 구로구 신도림동 460-27', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13073, 130, '출발지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:30:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13074, 131, '출발지', 40, 4, 313, NULL, '37.5404761', '127.0722599', '서울 광진구 화양동 4-12', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13075, 132, '출발지', 40, 4, 313, NULL, '37.5404761', '127.0722599', '서울 광진구 화양동 4-12', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13076, 133, '출발지', 40, 16, 574, NULL, '37.570162', '126.980298', '서울 종로구 종로1가 82-2', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13077, 134, '출발지', 27, 214, 3884, 14331, '37.469382183483106', '130.84305748343468', '경북 울릉군 서면 남양리 산 75-2', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13078, 135, '출발지', 40, 16, 546, NULL, '37.5854042', '126.9838194', '서울 종로구 삼청동 158-19', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13079, 136, '출발지', 40, 3, 305, NULL, '37.4807687', '126.9528711', '서울 관악구 봉천동 857-6', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13080, 137, '출발지', 20, 125, 1971, NULL, '37.4080544', '126.7041781', '인천 남동구 논현동 439-2', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13081, 138, '출발지', 40, 8, 346, NULL, '37.5805926', '126.8877986', '서울 마포구 상암동 1600', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13082, 139, '출발지', 21, 133, 2108, NULL, '36.2817016', '127.4680346', '대전 동구 낭월동 190-5', '2016-09-02 22:30:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13083, 140, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13084, 141, '출발지', 40, 5, 319, NULL, '37.5103902', '126.8903218', '서울 구로구 신도림동 330-6', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13085, 142, '출발지', 40, 3, 306, NULL, '37.4791275', '126.9310612', '서울 관악구 신림동 1634-12', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13086, 143, '출발지', 30, 67, 1136, NULL, '34.761855', '127.661768', '전남 여수시 학동 300', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13087, 144, '출발지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13088, 145, '출발지', 40, 1, 289, NULL, '37.4834678', '127.0440504', '서울 강남구 도곡동 517-10', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13089, 146, '출발지', 20, 127, 1993, NULL, '37.50703', '126.720101', '인천 부평구 청천동 302-32', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13090, 147, '출발지', 40, 1, 289, NULL, '37.4834578', '127.044089', '서울 강남구 도곡동 517-10', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13091, 148, '출발지', 40, 3, 305, NULL, '37.4705156', '126.9673433', '서울 관악구 봉천동 180-107', '2016-09-02 22:31:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13092, 149, '출발지', 40, 4, 313, NULL, '37.543555', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13093, 150, '출발지', 40, 36, 712, NULL, '37.562007', '126.93964', '서울 서대문구 신촌동 134', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13094, 151, '출발지', 40, 3, 305, NULL, '37.4871827', '126.9342607', '서울 관악구 봉천동 967-12', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13095, 152, '출발지', 40, 3, 305, NULL, '37.4705451', '126.9673306', '서울 관악구 봉천동 180-107', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13096, 153, '출발지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13097, 154, '출발지', 25, 179, 3127, NULL, '36.6367196', '127.4603314', '충북 청주시 서원구 사창동 398', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13098, 155, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13099, 156, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13100, 157, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13101, 158, '출발지', 20, 125, 1967, NULL, '37.466431', '126.709915', '인천 남동구 간석동 113-6', '2016-09-02 22:31:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13102, 159, '출발지', 40, 10, 380, NULL, '37.462077', '127.046382', '서울 서초구 양재동 229', '2016-09-02 22:31:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13103, 160, '출발지', 40, 32, 676, NULL, '37.665375', '127.057614', '서울 노원구 상계동 650', '2016-09-02 22:31:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13104, 161, '출발지', 40, 14, 459, NULL, '37.5096634', '126.9203949', '서울 영등포구 신길동 120-17', '2016-09-02 22:31:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13105, 162, '출발지', 19, 114, 1808, NULL, '35.1615698', '128.9853829', '부산 사상구 괘법동 572-1', '2016-09-02 22:31:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13106, 163, '출발지', 40, 3, 305, NULL, '37.4704634', '126.967378', '서울 관악구 봉천동 180-283', '2016-09-02 22:31:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13107, 164, '출발지', 23, 145, 2495, NULL, '35.137743', '126.790981', '광주 광산구 송정동 1003-1', '2016-09-02 22:31:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13108, 165, '출발지', 40, 3, 305, NULL, '37.4704739', '126.9673816', '서울 관악구 봉천동 180-283', '2016-09-02 22:31:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13109, 166, '출발지', 40, 3, 305, NULL, '37.4704662', '126.9673659', '서울 관악구 봉천동 180-283', '2016-09-02 22:31:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13110, 167, '출발지', 18, 79, 1268, NULL, '37.3373005', '127.1091338', '경기 성남시 분당구 구미동 197-1', '2016-09-02 22:31:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13111, 168, '출발지', 21, 133, 2132, NULL, '36.353899', '127.434555', '대전 동구 용전동 125-35', '2016-09-02 22:31:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13112, 169, '출발지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:31:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13113, 170, '출발지', 40, 5, 317, NULL, '37.502906', '126.882262', '서울 구로구 구로동 589-14', '2016-09-02 22:31:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13114, 171, '출발지', 25, 179, 3127, NULL, '36.634137', '127.462708', '충북 청주시 서원구 사창동 266-31', '2016-09-02 22:31:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13115, 172, '출발지', 28, 234, 4283, NULL, '35.22079476819063', '128.68406899273396', '경남 창원시 성산구 상남동 21-3', '2016-09-02 22:31:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13116, 173, '출발지', 40, 3, 305, NULL, '37.47062114164203', '126.96769829839468', '서울 관악구 봉천동 180-282', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13117, 174, '출발지', 25, 178, 3107, NULL, '36.6097607', '127.5101716', '충북 청주시 상당구 용암동 2085', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13118, 175, '출발지', 24, 150, 2707, NULL, '37.75474021504474', '128.87800745666027', '강원 강릉시 홍제동 992', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13119, 176, '출발지', 39, 281, 5276, 20726, '35.550946', '129.137971', '울산 울주군 삼남면 신화리 산 9-1', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13120, 177, '출발지', 20, 127, 1988, NULL, '37.490473', '126.723469', '인천 부평구 부평동 224-1', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13121, 178, '출발지', 40, 4, 311, NULL, '37.540389', '127.069236', '서울 광진구 자양동 1-5', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13122, 179, '출발지', 40, 4, 313, NULL, '37.5451874', '127.0731293', '서울 광진구 화양동 164-2', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13123, 180, '출발지', 40, 6, 326, NULL, '37.459436', '126.90473', '서울 금천구 시흥동 856-24', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13124, 181, '출발지', 23, 145, 2500, NULL, '35.18367351513217', '126.83360528200865', '광주 광산구 신가동 1026', '2016-09-02 22:31:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13125, 182, '출발지', 19, 110, 1781, NULL, '35.114979', '129.041549', '부산 동구 초량동 1187-21', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13126, 183, '출발지', 40, 8, 360, NULL, '37.5486588', '126.914006', '서울 마포구 합정동 373-16', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13127, 184, '출발지', 40, 1, 288, NULL, '37.5004499', '127.0778606', '서울 강남구 대치동 4-22', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13128, 185, '출발지', 18, 84, 1341, NULL, '37.302098436111265', '126.99107509106398', '경기 수원시 장안구 정자동 359-11', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13129, 186, '출발지', 18, 102, 1626, NULL, '37.2785456', '127.4265201', '경기 이천시 관고동 376', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13130, 187, '출발지', 18, 81, 1306, NULL, '37.4365535', '127.1645836', '경기 성남시 중원구 상대원동 1628', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13131, 188, '출발지', 40, 8, 345, NULL, '37.5478659', '126.9208304', '서울 마포구 상수동 317-15', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13132, 189, '출발지', 40, 4, 311, NULL, '37.536912', '127.0610479', '서울 광진구 자양동 203-22', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13133, 190, '출발지', 40, 3, 305, NULL, '37.4705343', '126.9672848', '서울 관악구 봉천동 180-93', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13134, 191, '출발지', 40, 3, 305, NULL, '37.470539', '126.9672927', '서울 관악구 봉천동 180-93', '2016-09-02 22:31:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13135, 192, '출발지', 20, 127, 1991, NULL, '37.4851853', '126.7068012', '인천 부평구 십정동 186-316', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13136, 193, '출발지', 28, 235, 4330, NULL, '35.2572944', '128.613063', '경남 창원시 의창구 팔용동 121-1', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13137, 194, '출발지', 19, 118, 1853, NULL, '35.18459724558282', '129.08658977597952', '부산 연제구 연산동 639-22', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13138, 195, '출발지', 18, 90, 1476, NULL, '37.3904672', '126.9445348', '경기 안양시 동안구 호계동 895', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13139, 196, '출발지', 40, 14, 463, NULL, '37.5278297', '126.8905873', '서울 영등포구 양평동3가 57', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13140, 197, '출발지', 40, 5, 317, NULL, '37.5028122161261', '126.88200440257788', '서울 구로구 구로동 589-14', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13141, 198, '출발지', 40, 8, 360, NULL, '37.5472234', '126.9180487', '서울 마포구 합정동 402-1', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13142, 199, '출발지', 18, 81, 1306, NULL, '37.4325175', '127.1730387', '경기 성남시 중원구 상대원동 333-9', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13143, 200, '출발지', 18, 101, 1620, NULL, '37.738157986142895', '127.0434083417058', '경기 의정부시 의정부동 691', '2016-09-02 22:31:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13144, 201, '출발지', 18, 90, 1476, NULL, '37.38872', '126.9486505', '경기 안양시 동안구 호계동 1020', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13145, 202, '출발지', 24, 162, 2901, NULL, '37.8798969', '127.7280828', '강원 춘천시 조양동 50-14', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13146, 203, '출발지', 40, 3, 305, NULL, '37.470537', '126.9673113', '서울 관악구 봉천동 180-107', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13147, 204, '출발지', 18, 81, 1306, NULL, '37.4324698', '127.1729081', '경기 성남시 중원구 상대원동 333-9', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13148, 205, '출발지', 22, 144, 2421, NULL, '35.871435', '128.601445', '대구 중구 동인동1가 2-1', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13149, 206, '출발지', 40, 35, 691, NULL, '37.561553', '126.854244', '서울 강서구 가양동 14-61', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13150, 207, '출발지', 18, 101, 1620, NULL, '37.738098', '127.033682', '경기 의정부시 의정부동 326-2', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13151, 208, '출발지', 29, 253, 4750, NULL, '35.832126', '127.116677', '전북 전주시 완산구 서신동 878', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13152, 209, '출발지', 28, 230, 4131, NULL, '35.1602752', '128.1054569', '경남 진주시 가좌동 816-2', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13153, 210, '출발지', 19, 118, 1853, NULL, '35.179554', '129.075642', '부산 연제구 연산동 1000', '2016-09-02 22:31:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13154, 211, '출발지', 28, 230, 4131, NULL, '35.1602801', '128.1054107', '경남 진주시 가좌동 816-3', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13155, 212, '출발지', 28, 230, 4131, NULL, '35.1602801', '128.1054107', '경남 진주시 가좌동 816-3', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13156, 213, '출발지', 21, 134, 2159, NULL, '36.350412', '127.384548', '대전 서구 둔산동 1420', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13157, 214, '출발지', 19, 121, 1922, NULL, '35.181832', '129.176696', '부산 해운대구 좌동 138-4', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13158, 215, '출발지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13159, 216, '출발지', 40, 8, 360, NULL, '37.54895', '126.91354', '서울 마포구 합정동 420', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13160, 217, '출발지', 40, 1, 287, NULL, '37.516551', '127.020573', '서울 강남구 논현동 279', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13161, 218, '출발지', 18, 81, 1306, NULL, '37.4327704', '127.1735576', '경기 성남시 중원구 상대원동 333-7', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13162, 219, '출발지', 40, 5, 314, NULL, '37.482554375765446', '126.88674353063107', '서울 구로구 가리봉동 121-45', '2016-09-02 22:31:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13163, 220, '출발지', 40, 5, 314, NULL, '37.482554375765446', '126.88674353063107', '서울 구로구 가리봉동 121-45', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13164, 221, '출발지', 40, 3, 306, NULL, '37.478932753205946', '126.9314593076706', '서울 관악구 신림동 1642-10', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13165, 222, '출발지', 19, 115, 1816, NULL, '35.104666', '128.9899718', '부산 사하구 괴정동 1063-132', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13166, 223, '출발지', 40, 5, 317, NULL, '37.48525', '126.901472', '서울 구로구 구로동 810-3', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13167, 224, '출발지', 40, 35, 691, NULL, '37.561553', '126.854244', '서울 강서구 가양동 14-61', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13168, 225, '출발지', 29, 253, 4776, NULL, '35.8255544', '127.0990614', '전북 전주시 완산구 효자동3가 1597-15', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13169, 226, '출발지', 23, 146, 2547, NULL, '35.1250874', '126.91086', '광주 남구 봉선동 483-28', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13170, 227, '출발지', 18, 81, 1306, NULL, '37.4321998', '127.1726492', '경기 성남시 중원구 상대원동 500-5', '2016-09-02 22:31:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13171, 228, '출발지', 23, 146, 2565, NULL, '35.1246917083307', '126.89835749566554', '광주 남구 진월동 산 2-2', '2016-09-02 22:31:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13172, 229, '출발지', 21, 134, 2174, NULL, '36.3489197', '127.397659', '대전 서구 탄방동 1458', '2016-09-02 22:31:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13173, 231, '출발지', 23, 146, 2563, NULL, '35.12608255531715', '126.89832128584385', '광주 남구 주월동 1242-5', '2016-09-02 22:31:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13174, 232, '출발지', 40, 7, 333, NULL, '37.5053205', '126.9339742', '서울 동작구 상도동 448', '2016-09-02 22:31:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13175, 233, '출발지', 40, 7, 333, NULL, '37.5052856', '126.9340137', '서울 동작구 상도동 448', '2016-09-02 22:31:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13176, 234, '출발지', 40, 7, 333, NULL, '37.5052856', '126.9340137', '서울 동작구 상도동 448', '2016-09-02 22:31:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13177, 235, '출발지', 40, 8, 346, NULL, '37.5806004', '126.88776', '서울 마포구 상암동 1600', '2016-09-02 22:31:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13178, 236, '출발지', 40, 8, 346, NULL, '37.5805996', '126.8877876', '서울 마포구 상암동 1600', '2016-09-02 22:31:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13179, 237, '출발지', 40, 10, 378, NULL, '37.50234355363649', '127.02457588165997', '서울 서초구 서초동 1309-12', '2016-09-02 22:31:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13180, 238, '출발지', 29, 253, 4776, NULL, '35.8254693', '127.0989297', '전북 전주시 완산구 효자동3가 1597-26', '2016-09-02 22:31:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13181, 240, '출발지', 21, 136, 2239, NULL, '36.316167', '127.431516', '대전 중구 부사동 209-1', '2016-09-02 22:31:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13182, 241, '출발지', 29, 63, 982, NULL, '35.9534972', '126.9891504', '전북 익산시 어양동 75', '2016-09-02 22:31:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13183, 242, '출발지', 40, 10, 378, NULL, '37.504128285525766', '127.02345974743366', '서울 서초구 서초동 1413', '2016-09-02 22:31:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13184, 243, '출발지', 23, 146, 2565, NULL, '35.1186114', '126.8977561', '광주 남구 진월동 414-10', '2016-09-02 22:31:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13185, 244, '출발지', 40, 10, 380, NULL, '37.4821929', '127.0374992', '서울 서초구 양재동 14-13', '2016-09-02 22:31:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13186, 245, '출발지', 40, 10, 378, NULL, '37.5043083', '127.0241224', '서울 서초구 서초동 1413', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13187, 246, '출발지', 18, 90, 1476, NULL, '37.3905026', '126.9445951', '경기 안양시 동안구 호계동 895', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13188, 247, '출발지', 40, 5, 319, NULL, '37.5077345', '126.8805914', '서울 구로구 신도림동 390-44', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13189, 248, '출발지', 40, 5, 319, NULL, '37.5077345', '126.8805914', '서울 구로구 신도림동 390-44', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13190, 249, '출발지', 40, 5, 319, NULL, '37.5077345', '126.8805914', '서울 구로구 신도림동 390-44', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13191, 250, '출발지', 40, 5, 319, NULL, '37.508996', '126.891583', '서울 구로구 신도림동 460-27', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13192, 251, '출발지', 18, 92, 1501, NULL, '37.8333031', '127.0527518', '경기 양주시 회정동 450-8', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13193, 252, '출발지', 40, 16, 575, NULL, '37.5701217', '126.9856351', '서울 종로구 종로2가 1-2', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13194, 253, '출발지', 18, 58, 820, NULL, '36.991145', '127.084981', '경기 평택시 평택동 185-568', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13195, 254, '출발지', 40, 35, 691, NULL, '37.561553', '126.854244', '서울 강서구 가양동 14-61', '2016-09-02 22:31:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13196, 255, '출발지', 18, 79, 1270, NULL, '37.3629139', '127.099208', '경기 성남시 분당구 금곡동 59', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13197, 256, '출발지', 40, 3, 305, NULL, '37.477117', '126.963418', '서울 관악구 봉천동 1693-39', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13198, 257, '출발지', 24, 164, 2928, 8492, '37.6722556', '128.7091611', '강원 평창군 대관령면 횡계리 327', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13199, 258, '출발지', 22, 140, 2322, NULL, '35.877893646976595', '128.62530011683702', '대구 동구 신암동 294-5', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13200, 259, '출발지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13201, 260, '출발지', 40, 32, 676, NULL, '37.6647804', '127.0643697', '서울 노원구 상계동 639', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13202, 261, '출발지', 40, 32, 676, NULL, '37.6647941', '127.0643693', '서울 노원구 상계동 639', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13203, 262, '출발지', 40, 284, 5316, NULL, '37.570627', '127.0706515', '서울 동대문구 장안동 469-7', '2016-09-02 22:31:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13204, 263, '출발지', 40, 284, 5316, NULL, '37.570627', '127.0706515', '서울 동대문구 장안동 469-7', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13205, 264, '출발지', 24, 156, 2804, 8008, '38.1501985', '128.6078579', '강원 양양군 강현면 정암리 450-16', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13206, 265, '출발지', 19, 114, 1807, NULL, '35.15274838366729', '128.9919614419341', '부산 사상구 감전동 138-3', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13207, 266, '출발지', 18, 105, NULL, NULL, '37.2116586', '126.8238001', '경기 화성시 남양읍 남양리 1340', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13208, 267, '출발지', 18, 74, 1218, NULL, '37.416522', '126.884789', '경기 광명시 일직동 276-8', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13209, 268, '출발지', 18, 51, 756, NULL, '37.50445330960235', '126.76427889615299', '경기 부천시 중동 1243', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13210, 269, '출발지', 18, 96, 1552, NULL, '37.1426743', '127.0695838', '경기 오산시 원동 781-16', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13211, 270, '출발지', 18, 79, 1276, NULL, '37.384931', '127.123249', '경기 성남시 분당구 서현동 263', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13212, 271, '출발지', 18, 86, 1391, NULL, '37.3403953', '126.7498704', '경기 시흥시 정왕동 1413-3', '2016-09-02 22:31:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13213, 272, '출발지', 40, 14, 450, NULL, '37.5355393', '126.9001007', '서울 영등포구 당산동6가 340-2', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13214, 273, '출발지', 18, 96, 1552, NULL, '37.1409837', '127.0796619', '경기 오산시 원동 614-7', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13215, 274, '출발지', 18, 58, 796, NULL, '37.0555031', '127.0558775', '경기 평택시 서정동 342', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13216, 275, '출발지', 18, 82, 1320, NULL, '37.2506574', '127.0185578', '경기 수원시 권선구 세류동 1121-4', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13217, 276, '출발지', 20, 128, 1997, NULL, '37.5391172', '126.6398003', '인천 서구 경서동 855-5', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13218, 277, '출발지', 20, 127, 1988, NULL, '37.489255723744776', '126.72432102262974', '인천 부평구 부평동 738-21', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13219, 278, '출발지', 18, 90, 1476, NULL, '37.3905327', '126.9445438', '경기 안양시 동안구 호계동 895', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13220, 279, '출발지', 18, 90, 1476, NULL, '37.3906712', '126.9442693', '경기 안양시 동안구 호계동 893-4', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13221, 280, '출발지', 18, 90, 1476, NULL, '37.3906712', '126.9442693', '경기 안양시 동안구 호계동 893-4', '2016-09-02 22:31:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13222, 281, '출발지', 30, 264, 5017, 18974, '34.9904542', '126.4816856', '전남 무안군 무안읍 성동리 712-1', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13223, 282, '출발지', 21, 135, 2196, NULL, '36.392124', '127.31462', '대전 유성구 반석동 685', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13224, 283, '출발지', 18, 85, 1358, NULL, '37.2752656', '127.0196959', '경기 수원시 팔달구 영동 46', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13225, 284, '출발지', 19, 112, 1797, NULL, '35.1564233', '129.0587962', '부산 부산진구 부전동 573-1', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13226, 285, '출발지', 40, 8, 347, NULL, '37.5548525', '126.92181', '서울 마포구 서교동 427', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13227, 286, '출발지', 40, 8, 347, NULL, '37.5548525', '126.92181', '서울 마포구 서교동 427', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13228, 287, '출발지', 24, 154, 2796, NULL, '38.206785224814176', '128.59304051846266', '강원 속초시 중앙동 468-66', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13229, 288, '출발지', 40, 1, 295, NULL, '37.5030994', '127.0479645', '서울 강남구 역삼동 708-20', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13230, 289, '출발지', 28, 235, 4330, NULL, '35.25698026036078', '128.6116785183549', '경남 창원시 의창구 팔용동 130-5', '2016-09-02 22:31:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13231, 290, '출발지', 28, 235, 4330, NULL, '35.25739804274404', '128.6077782511711', '경남 창원시 의창구 팔용동 513', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13232, 291, '출발지', 28, 235, 4330, NULL, '35.25644885776954', '128.61017279326916', '경남 창원시 의창구 팔용동 134-1', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13233, 292, '출발지', 40, 38, 733, NULL, '37.63700396418821', '127.0388338342309', '서울 도봉구 창동 543-7', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13234, 293, '출발지', 18, 91, 1479, NULL, '37.401044', '126.9223397', '경기 안양시 만안구 안양동 1189-1', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13235, 294, '출발지', 27, 60, 905, NULL, '36.0985696', '128.4213248', '경북 구미시 진평동 199-2', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13236, 295, '출발지', 27, 60, 905, NULL, '36.0985812', '128.4213465', '경북 구미시 진평동 38-7', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13237, 296, '출발지', 40, 2, 302, NULL, '37.6343884', '127.0229077', '서울 강북구 수유동 48-1', '2016-09-02 22:31:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13238, 297, '출발지', 40, 10, 376, NULL, '37.50527198099753', '127.02133309096098', '서울 서초구 반포동 749-28', '2016-09-02 22:31:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13239, 298, '출발지', 40, 11, 394, NULL, '37.544569', '127.055974', '서울 성동구 성수동2가 289-36', '2016-09-02 22:31:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13240, 299, '출발지', 19, 121, 1921, NULL, '35.1907602', '129.1316223', '부산 해운대구 재송동 1159-1', '2016-09-02 22:31:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13241, 300, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13242, 301, '출발지', 19, 121, 1921, NULL, '35.1906628', '129.1316469', '부산 해운대구 재송동 1159-1', '2016-09-02 22:31:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13243, 302, '출발지', 27, 208, 3778, NULL, '36.5627', '128.732944', '경북 안동시 운흥동 178-3', '2016-09-02 22:31:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13244, 303, '출발지', 27, 208, 3786, NULL, '36.5639361', '128.7269482', '경북 안동시 천리동 226-3', '2016-09-02 22:31:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13245, 304, '출발지', 18, 90, 1476, NULL, '37.39135755382651', '126.94442108273505', '경기 안양시 동안구 호계동 894-21', '2016-09-02 22:31:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13246, 305, '출발지', 18, 81, 1306, NULL, '37.4328698', '127.1738634', '경기 성남시 중원구 상대원동 333-7', '2016-09-02 22:31:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13247, 306, '출발지', 40, 5, 317, NULL, '37.4994091', '126.8716285', '서울 구로구 구로동 621-9', '2016-09-02 22:31:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13248, 307, '출발지', 40, 15, 502, NULL, '37.534771139383885', '126.9936040788889', '서울 용산구 이태원동 119-25', '2016-09-02 22:31:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13249, 308, '출발지', 40, 6, 326, NULL, '37.4624243', '126.9110506', '서울 금천구 시흥동 3-62', '2016-09-02 22:31:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13250, 309, '출발지', 40, 6, 326, NULL, '37.4624198', '126.9109375', '서울 금천구 시흥동 3-62', '2016-09-02 22:31:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13251, 310, '출발지', 40, 36, 722, NULL, '37.5919249', '126.9415673', '서울 서대문구 홍은동 52', '2016-09-02 22:31:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13252, 311, '출발지', 40, 36, 722, NULL, '37.5919249', '126.9415673', '서울 서대문구 홍은동 52', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13253, 312, '출발지', 18, 96, 1548, NULL, '37.165597', '127.0677523', '경기 오산시 수청동 39', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13254, 313, '출발지', 18, 51, 756, NULL, '37.503052', '126.77596', '경기 부천시 중동 1242', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13255, 314, '출발지', 40, 1, 295, NULL, '37.5007897', '127.0280354', '서울 강남구 역삼동 817-35', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13256, 315, '출발지', 40, 5, 316, NULL, '37.49922243113224', '126.86790503561497', '서울 구로구 고척동 63-6', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13257, 316, '출발지', 40, 5, 316, NULL, '37.49892398391576', '126.86781786382197', '서울 구로구 고척동 66-2', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13258, 317, '출발지', 40, 5, 315, NULL, '37.4920831', '126.8534124', '서울 구로구 개봉동 323-8', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13259, 318, '출발지', 23, 148, 2619, NULL, '35.211948', '126.8662767', '광주 북구 신용동 737', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13260, 319, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13261, 320, '출발지', 18, 74, 1220, NULL, '37.462518', '126.879732', '경기 광명시 하안동 712', '2016-09-02 22:31:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13262, 321, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:31:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13263, 322, '출발지', 23, 148, 2620, NULL, '35.1983884', '126.8738102', '광주 북구 양산동 660-46', '2016-09-02 22:31:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13264, 323, '출발지', 18, 84, 1343, NULL, '37.2984755527488', '126.98413789272308', '경기 수원시 장안구 천천동 514', '2016-09-02 22:31:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13265, 324, '출발지', 40, 37, 726, NULL, '37.614310559707114', '127.07352217286825', '서울 중랑구 묵동 378', '2016-09-02 22:31:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13266, 325, '출발지', 18, 74, 1220, NULL, '37.462518', '126.879732', '경기 광명시 하안동 712', '2016-09-02 22:31:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13267, 326, '출발지', 18, 74, 1220, NULL, '37.462518', '126.879732', '경기 광명시 하안동 712', '2016-09-02 22:31:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13268, 327, '출발지', 40, 10, 378, NULL, '37.5034925', '127.021501', '서울 서초구 서초동 1413', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13269, 328, '출발지', 18, 90, 1476, NULL, '37.3905364', '126.9445137', '경기 안양시 동안구 호계동 1010-2', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13270, 329, '출발지', 40, 37, 728, NULL, '37.6127813', '127.0981787', '서울 중랑구 신내동 316', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13271, 330, '출발지', 40, 8, 342, NULL, '37.5578854', '126.9265227', '서울 마포구 동교동 172-75', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13272, 331, '출발지', 18, 82, 1323, NULL, '37.2446581', '127.0134473', '경기 수원시 권선구 장지동 623', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13273, 332, '출발지', 18, 101, 1623, NULL, '37.7261557', '127.0431253', '경기 의정부시 호원동 319-16', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13274, 333, '출발지', 18, 51, 741, NULL, '37.5182603', '126.7636125', '경기 부천시 삼정동 365', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13275, 334, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:31:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13276, 335, '출발지', 20, 128, 2000, NULL, '37.589603095784604', '126.6773421317339', '인천 서구 당하동 1131', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13277, 336, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13278, 342, '출발지', 40, 17, 606, NULL, '37.5612839', '126.9774483', '서울 중구 남대문로4가 17-42', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13279, 344, '출발지', 18, 81, 1306, NULL, '37.4325987', '127.1730986', '경기 성남시 중원구 상대원동 333-9', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13280, 345, '출발지', 18, 89, 1432, 6423, '37.00984033068506', '127.20369748771192', '경기 안성시 공도읍 양기리 289-7', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13281, 346, '출발지', 19, 107, 1754, NULL, '35.24657497747866', '129.09136075526476', '부산 금정구 구서동 475', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13282, 347, '출발지', 27, 221, 3967, NULL, '36.036231', '129.360145', '경북 포항시 북구 대흥동 595-170', '2016-09-02 22:31:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13283, 348, '출발지', 18, 83, 1328, NULL, '37.2415769', '127.0530466', '경기 수원시 영통구 망포동 294-8', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13284, 349, '출발지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13285, 350, '출발지', 40, 3, 306, NULL, '37.4676421', '126.9366001', '서울 관악구 신림동 1553', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13286, 351, '출발지', 40, 1, 288, NULL, '37.496683', '127.070549', '서울 강남구 대치동 5-3', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13287, 352, '출발지', 25, 175, 3056, 9729, '36.7864816', '127.5836753', '충북 증평군 증평읍 교동리 21-1', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13288, 353, '출발지', 25, 175, 3056, 9729, '36.7864816', '127.5836753', '충북 증평군 증평읍 교동리 21-1', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13289, 354, '출발지', 40, 284, 5318, NULL, '37.5818608', '127.04081', '서울 동대문구 제기동 620-45', '2016-09-02 22:31:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13290, 355, '출발지', 40, 1, 289, NULL, '37.4893568153441', '127.0535983890295', '서울 강남구 도곡동 467-17', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13291, 356, '출발지', 18, 70, 1173, NULL, '37.61867558172546', '126.82053085416555', '경기 고양시 덕양구 토당동 497-1', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13292, 357, '출발지', 18, 70, 1151, NULL, '37.7155541', '126.9033464', '경기 고양시 덕양구 고양동 1121', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13293, 358, '출발지', 18, 70, 1151, NULL, '37.7155055', '126.9033676', '경기 고양시 덕양구 고양동 1121', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13294, 359, '출발지', 40, 3, 306, NULL, '37.48675845177941', '126.93332009017467', '서울 관악구 신림동 1467-1', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13295, 360, '출발지', 40, 1, 295, NULL, '37.4982108', '127.036701', '서울 강남구 역삼동 738-20', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13296, 361, '출발지', 18, 89, 1432, 6423, '37.0096724', '127.2028685', '경기 안성시 공도읍 양기리 290-4', '2016-09-02 22:31:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13297, 362, '출발지', 18, 58, 796, NULL, '37.0665973', '127.0649473', '경기 평택시 서정동 800', '2016-09-02 22:31:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13298, 363, '출발지', 18, 89, 1439, 6443, '37.00501838272684', '127.2298128157854', '경기 안성시 대덕면 내리 72-1', '2016-09-02 22:31:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13299, 364, '출발지', 18, 58, 796, NULL, '37.0665973', '127.0649473', '경기 평택시 서정동 800', '2016-09-02 22:31:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13300, 365, '출발지', 18, 58, 796, NULL, '37.0665973', '127.0649473', '경기 평택시 서정동 800', '2016-09-02 22:31:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13301, 366, '출발지', 18, 58, 796, NULL, '37.0665973', '127.0649473', '경기 평택시 서정동 800', '2016-09-02 22:31:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13302, 367, '출발지', 20, 125, 1969, NULL, '37.4536131', '126.7081196', '인천 남동구 구월동 1336', '2016-09-02 22:31:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13303, 368, '출발지', 40, 15, 511, NULL, '37.5368389', '127.0049989', '서울 용산구 한남동 717-2', '2016-09-02 22:31:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13304, 369, '출발지', 40, 15, 511, NULL, '37.5368389', '127.0049989', '서울 용산구 한남동 717-2', '2016-09-02 22:31:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13305, 370, '출발지', 40, 7, 331, NULL, '37.4814119', '126.9817023', '서울 동작구 사당동 1112', '2016-09-02 22:31:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13306, 371, '출발지', 18, NULL, NULL, NULL, '37.29359622602743', '127.63593714684248', '경기 여주시 홍문동 215', '2016-09-02 22:31:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13307, 372, '출발지', 40, 1, 287, NULL, '37.50689174297707', '127.02713504433633', '서울 강남구 논현동 280-29', '2016-09-02 22:31:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13308, 373, '출발지', 18, 81, 1306, NULL, '37.4326762', '127.1735835', '경기 성남시 중원구 상대원동 333-7', '2016-09-02 22:31:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13309, 374, '출발지', 40, 8, 342, NULL, '37.5578854', '126.9265227', '서울 마포구 동교동 172-75', '2016-09-02 22:31:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13310, 375, '출발지', 40, 8, 342, NULL, '37.5578854', '126.9265227', '서울 마포구 동교동 172-75', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13311, 376, '출발지', 40, 8, 342, NULL, '37.5578854', '126.9265227', '서울 마포구 동교동 172-75', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13312, 377, '출발지', 40, 8, 342, NULL, '37.5578854', '126.9265227', '서울 마포구 동교동 172-75', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13313, 378, '출발지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13314, 379, '출발지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13315, 380, '출발지', 40, 7, 327, NULL, '37.514072', '126.94167', '서울 동작구 노량진동 67-2', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13316, 381, '출발지', 27, 208, 3762, NULL, '36.541637', '128.7964348', '경북 안동시 송천동 388', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13317, 382, '출발지', 18, 90, 1476, NULL, '37.38900752171232', '126.94825597107409', '경기 안양시 동안구 호계동 1020', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13318, 383, '출발지', 19, 109, 1776, NULL, '35.1128633', '129.1088578', '부산 남구 용호동 565', '2016-09-02 22:31:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13319, 384, '출발지', 19, 109, 1776, NULL, '35.1128063', '129.1084812', '부산 남구 용호동 537-13', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13320, 385, '출발지', 19, 109, 1776, NULL, '35.1128063', '129.1084812', '부산 남구 용호동 537-13', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13321, 386, '출발지', 40, 7, 333, NULL, '37.498071', '126.9530576', '서울 동작구 상도동 437', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13322, 387, '출발지', 40, 7, 333, NULL, '37.498071', '126.9530576', '서울 동작구 상도동 437', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13323, 388, '출발지', 40, 13, 442, NULL, '37.5221055', '126.8393023', '서울 양천구 신월동 440-12', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13324, 389, '출발지', 40, 13, 442, NULL, '37.522059', '126.8393258', '서울 양천구 신월동 440-12', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13325, 390, '출발지', 40, 1, 287, NULL, '37.5145336', '127.0332854', '서울 강남구 논현동 209', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13326, 391, '출발지', 40, 1, 287, NULL, '37.5079288', '127.0316189', '서울 강남구 논현동 193-13', '2016-09-02 22:31:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13327, 392, '출발지', 40, 284, 5315, NULL, '37.6010649', '127.0663266', '서울 동대문구 이문동 167-27', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13328, 393, '출발지', 40, 13, 442, NULL, '37.5220838', '126.8392804', '서울 양천구 신월동 440-12', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13329, 394, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13330, 395, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13331, 396, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13332, 397, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13333, 398, '출발지', 40, 284, 5320, NULL, '37.5919562', '127.0485074', '서울 동대문구 회기동 산 4-102', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13334, 399, '출발지', 18, 84, 1339, NULL, '37.3002616', '126.9707277', '경기 수원시 장안구 율전동 495', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13335, 400, '출발지', 20, 127, 1987, NULL, '37.488354', '126.7412358', '인천 부평구 부개동 468', '2016-09-02 22:31:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13336, 401, '출발지', 20, 125, 1967, NULL, '37.469188', '126.6911197', '인천 남동구 간석동 617-22', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13337, 402, '출발지', 18, 75, 1226, NULL, '37.603404', '127.143738', '경기 구리시 인창동 244-2', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13338, 403, '출발지', 19, 109, 1773, NULL, '35.1399764', '129.0800032', '부산 남구 대연동 1584-14', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13339, 404, '출발지', 28, 222, 4008, NULL, '34.8751089', '128.6893816', '경남 거제시 아주동 1665', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13340, 405, '출발지', 40, 35, 703, NULL, '37.541578', '126.840436', '서울 강서구 화곡동 1089-54', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13341, 406, '출발지', 40, 35, 703, NULL, '37.541578', '126.840436', '서울 강서구 화곡동 1089-54', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13342, 407, '출발지', 25, 179, 3121, NULL, '36.6245028', '127.4583395', '충북 청주시 서원구 개신동 29', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13343, 408, '출발지', 18, 81, 1306, NULL, '37.4328099', '127.1729789', '경기 성남시 중원구 상대원동 333-9', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13344, 409, '출발지', 27, 60, 905, NULL, '36.0985972', '128.4213556', '경북 구미시 진평동 38-7', '2016-09-02 22:31:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13345, 410, '출발지', 18, 88, 1415, NULL, '37.325596', '126.8591798', '경기 안산시 상록구 부곡동 686-14', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13346, 411, '출발지', 25, 179, 3121, NULL, '36.6300438', '127.4601789', '충북 청주시 서원구 개신동 12', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13347, 412, '출발지', 18, 51, 756, NULL, '37.50259677005752', '126.77653089165688', '경기 부천시 중동 1274', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13348, 413, '출발지', 18, 51, 756, NULL, '37.50259677005752', '126.77653089165688', '경기 부천시 중동 1274', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13349, 414, '출발지', 18, 51, 756, NULL, '37.50259677005752', '126.77653089165688', '경기 부천시 중동 1274', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13350, 415, '출발지', 40, 6, 324, NULL, '37.4786093', '126.8784404', '서울 금천구 가산동 426-5', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13351, 416, '출발지', 40, 6, 324, NULL, '37.4786093', '126.8784404', '서울 금천구 가산동 426-5', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13352, 417, '출발지', 40, 34, 686, NULL, '37.591014', '126.913582', '서울 은평구 신사동 352-2', '2016-09-02 22:31:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13353, 418, '출발지', 40, 34, 686, NULL, '37.591014', '126.913582', '서울 은평구 신사동 352-2', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13354, 419, '출발지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13355, 420, '출발지', 20, 124, 1965, NULL, '37.4507126', '126.6724981', '인천 남구 주안동 1418-72', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13356, 421, '출발지', 24, 158, 2831, 8193, '37.4353371', '127.9730774', '강원 원주시 소초면 의관리 232', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13357, 422, '출발지', 24, 158, 2831, 8193, '37.4353371', '127.9730774', '강원 원주시 소초면 의관리 232', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13358, 423, '출발지', 29, 253, 4748, NULL, '35.8242238', '127.1479532', '전북 전주시 완산구 서노송동 568-1', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13359, 424, '출발지', 30, 266, 5069, NULL, '34.950637', '127.4872135', '전남 순천시 장천동 53-1', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13360, 425, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:31:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13361, 426, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:31:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13362, 427, '출발지', 40, 3, 306, NULL, '37.484489365588274', '126.92948319017886', '서울 관악구 신림동 1433-42', '2016-09-02 22:31:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13363, 428, '출발지', 40, 7, 333, NULL, '37.502015', '126.953684', '서울 동작구 상도동 430', '2016-09-02 22:31:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13364, 429, '출발지', 40, 7, 333, NULL, '37.502015', '126.953684', '서울 동작구 상도동 430', '2016-09-02 22:31:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13365, 430, '출발지', 40, 7, 333, NULL, '37.502015', '126.953684', '서울 동작구 상도동 430', '2016-09-02 22:31:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13366, 431, '출발지', 40, 7, 333, NULL, '37.502015', '126.953684', '서울 동작구 상도동 430', '2016-09-02 22:31:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13367, 432, '출발지', 18, 99, 1588, 6979, '37.3372972', '127.2526529', '경기 용인시 처인구 모현면 왕산리 522-1', '2016-09-02 22:31:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13368, 433, '출발지', 20, 124, 1965, NULL, '37.4506769', '126.6725748', '인천 남구 주안동 1418-82', '2016-09-02 22:31:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13369, 434, '출발지', 40, 1, 295, NULL, '37.504724', '127.02538', '서울 강남구 역삼동 800', '2016-09-02 22:31:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13370, 435, '출발지', 40, 1, 295, NULL, '37.504724', '127.02538', '서울 강남구 역삼동 800', '2016-09-02 22:31:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13371, 436, '출발지', 18, 99, 1588, 6974, '37.3180475', '127.2430492', '경기 용인시 처인구 모현면 갈담리 444-1', '2016-09-02 22:31:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13372, 437, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13373, 438, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13374, 439, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13375, 440, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13376, 441, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13377, 442, '출발지', 40, 17, 665, NULL, '37.5688956', '126.9764418', '서울 중구 태평로1가 68-1', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13378, 443, '출발지', 40, 17, 665, NULL, '37.5688956', '126.9764418', '서울 중구 태평로1가 68-1', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13379, 444, '출발지', 40, 17, 665, NULL, '37.5688956', '126.9764418', '서울 중구 태평로1가 68-1', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13380, 445, '출발지', 40, 17, 665, NULL, '37.5688956', '126.9764418', '서울 중구 태평로1가 68-1', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13381, 446, '출발지', 29, 253, 4748, NULL, '35.8242238', '127.1479532', '전북 전주시 완산구 서노송동 568-1', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13382, 447, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13383, 448, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13384, 449, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13385, 450, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13386, 451, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13387, 452, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13388, 453, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13389, 454, '출발지', 40, 6, 326, NULL, '37.4543713', '126.9016056', '서울 금천구 시흥동 1000-55', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13390, 455, '출발지', 40, 6, 326, NULL, '37.4543981', '126.9015328', '서울 금천구 시흥동 883-5', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13391, 456, '출발지', 40, 6, 326, NULL, '37.4543981', '126.9015328', '서울 금천구 시흥동 883-5', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13392, 457, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13393, 458, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13394, 459, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13395, 460, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13396, 461, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13397, 462, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13398, 463, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13399, 464, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13400, 465, '출발지', 40, 6, 326, NULL, '37.4543346', '126.9017511', '서울 금천구 시흥동 884-4', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13401, 466, '출발지', 20, 124, 1965, NULL, '37.4505904', '126.6724354', '인천 남구 주안동 1418-73', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13402, 467, '출발지', 20, 124, 1965, NULL, '37.4505904', '126.6724354', '인천 남구 주안동 1418-73', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13403, 468, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13404, 469, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13405, 470, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13406, 471, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13407, 472, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13408, 473, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13409, 474, '출발지', 18, 77, 1253, NULL, '37.6444467', '127.2393585', '경기 남양주시 평내동 601', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13410, 475, '출발지', 19, 118, 1852, NULL, '35.1919041', '129.077869', '부산 연제구 거제동 44-14', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13411, 476, '출발지', 18, 74, 1216, NULL, '37.44676918728957', '126.89312081784009', '경기 광명시 소하동 1366', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13412, 477, '출발지', 18, 74, 1216, NULL, '37.44676918728957', '126.89312081784009', '경기 광명시 소하동 1366', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13413, 478, '출발지', 18, 87, 1410, NULL, '37.3227935', '126.8063514', '경기 안산시 단원구 초지동 593-1', '2016-09-02 22:31:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13414, 479, '출발지', 19, 107, 1764, NULL, '35.2339428', '129.0793187', '부산 금정구 장전동 40', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13415, 480, '출발지', 21, 134, 2159, NULL, '36.3594932', '127.3808431', '대전 서구 둔산동 938', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13416, 481, '출발지', 21, 134, 2159, NULL, '36.3594932', '127.3808431', '대전 서구 둔산동 938', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13417, 482, '출발지', 40, 14, 477, NULL, '37.5263723', '126.9063713', '서울 영등포구 영등포동8가 46', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13418, 483, '출발지', 40, 3, 306, NULL, '37.4842107', '126.9296988', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13419, 484, '출발지', 40, 3, 306, NULL, '37.4842107', '126.9296988', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13420, 485, '출발지', 40, 3, 306, NULL, '37.4842107', '126.9296988', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13421, 486, '출발지', 40, 3, 306, NULL, '37.4842107', '126.9296988', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13422, 487, '출발지', 40, 3, 306, NULL, '37.4842107', '126.9296988', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13423, 488, '출발지', 40, 3, 306, NULL, '37.4842107', '126.9296988', '서울 관악구 신림동 1467-10', '2016-09-02 22:31:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13424, 489, '출발지', 18, 77, 1252, 6399, '37.6493095', '127.1446338', '경기 남양주시 퇴계원면 퇴계원리 221-3', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13425, 490, '출발지', 20, 123, 1955, NULL, '37.5285216', '126.7326164', '인천 계양구 작전동 140-2', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13426, 491, '출발지', 20, 123, 1955, NULL, '37.5285216', '126.7326164', '인천 계양구 작전동 140-2', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13427, 492, '출발지', 20, 123, 1955, NULL, '37.5285216', '126.7326164', '인천 계양구 작전동 140-2', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13428, 493, '출발지', 20, 123, 1955, NULL, '37.5285216', '126.7326164', '인천 계양구 작전동 140-2', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13429, 494, '출발지', 19, 118, 1852, NULL, '35.1915726', '129.0776871', '부산 연제구 거제동 44-19', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13430, 495, '출발지', 26, 65, 1030, NULL, '36.78745955430453', '127.01344940811396', '충남 아산시 권곡동 562', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13431, 496, '출발지', 26, 65, 1037, NULL, '36.7705638', '126.9792627', '충남 아산시 방축동 462-2', '2016-09-02 22:31:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13432, 497, '출발지', 18, 51, 750, NULL, '37.485127', '126.811523', '경기 부천시 역곡동 382', '2016-09-02 22:31:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13433, 498, '출발지', 18, 51, 750, NULL, '37.485127', '126.811523', '경기 부천시 역곡동 382', '2016-09-02 22:31:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13434, 499, '출발지', 18, 99, 1588, 6979, '37.33687552721096', '127.2511414065957', '경기 용인시 처인구 모현면 왕산리 793-5', '2016-09-02 22:31:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13435, 501, '출발지', 20, 123, 1938, NULL, '37.54326', '126.728533', '인천 계양구 계산동 1014', '2016-09-02 22:31:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13436, 502, '출발지', 20, 123, 1938, NULL, '37.54326', '126.728533', '인천 계양구 계산동 1014', '2016-09-02 22:31:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13437, 503, '출발지', 40, 1, 287, NULL, '37.516551', '127.020573', '서울 강남구 논현동 279', '2016-09-02 22:31:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13438, 504, '출발지', 40, 1, 287, NULL, '37.516551', '127.020573', '서울 강남구 논현동 279', '2016-09-02 22:31:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13439, 505, '출발지', 40, 1, 287, NULL, '37.516551', '127.020573', '서울 강남구 논현동 279', '2016-09-02 22:31:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13440, 506, '출발지', 40, 1, 287, NULL, '37.516551', '127.020573', '서울 강남구 논현동 279', '2016-09-02 22:31:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13441, 507, '출발지', 19, 115, 1822, NULL, '35.1091589', '128.9459498', '부산 사하구 하단동 1151-7', '2016-09-02 22:31:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13442, 508, '출발지', 25, 182, 3209, NULL, '36.9705093', '127.9221432', '충북 충주시 문화동 1344', '2016-09-02 22:31:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13443, 509, '출발지', 28, 222, 4008, NULL, '34.8645666', '128.694189', '경남 거제시 아주동 370', '2016-09-02 22:31:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13444, 510, '출발지', 20, 124, 1966, NULL, '37.44682402074971', '126.6669774055481', '인천 남구 학익동 2-9', '2016-09-02 22:31:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13445, 511, '출발지', 19, 120, 1906, NULL, '35.1090162', '129.0351051', '부산 중구 영주동 742-13', '2016-09-02 22:31:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13446, 512, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13447, 513, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13448, 514, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13449, 515, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13450, 516, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13451, 517, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13452, 518, '출발지', 40, 3, 306, NULL, '37.4822472', '126.9345347', '서울 관악구 신림동 10-380', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13453, 519, '출발지', 22, 138, 2275, NULL, '35.8504813', '128.5112615', '대구 달서구 이곡동 772', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13454, 520, '출발지', 29, 249, 4673, 17722, '35.8020011', '127.0256027', '전북 완주군 이서면 은교리 183-37', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13455, 521, '출발지', 22, 137, 2257, NULL, '35.8389355', '128.5993849', '대구 남구 봉덕동 1292-4', '2016-09-02 22:31:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13456, 522, '출발지', 22, 137, 2257, NULL, '35.8344878', '128.5957771', '대구 남구 봉덕동 1329-1', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13457, 523, '출발지', 22, 137, 2257, NULL, '35.8379927', '128.5972613', '대구 남구 봉덕동 1318-27', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13458, 524, '출발지', 18, 86, 1391, NULL, '37.351816', '126.742844', '경기 시흥시 정왕동 2325-10', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13459, 525, '출발지', 39, 278, 5224, NULL, '35.550922044421114', '129.26308080554008', '울산 남구 무거동 327-20', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13460, 526, '출발지', 22, 138, 2275, NULL, '35.8504987', '128.511268', '대구 달서구 이곡동 772', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13461, 527, '출발지', 18, 98, 1577, NULL, '37.34131995817115', '127.10216414183377', '경기 용인시 수지구 동천동 185-3', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13462, 528, '출발지', 18, 70, 1174, NULL, '37.617322', '126.8349555', '경기 고양시 덕양구 행신동 746-6', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13463, 529, '출발지', 19, 111, 1783, NULL, '35.2060354', '129.0813864', '부산 동래구 명륜동 559-29', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13464, 530, '출발지', 24, 152, 2729, NULL, '37.5505015', '129.0946418', '강원 동해시 발한동 산 118-4', '2016-09-02 22:31:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13465, 531, '출발지', 18, 70, 1174, NULL, '37.6189069', '126.8337332', '경기 고양시 덕양구 행신동 736-8', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13466, 532, '출발지', 18, 80, 1302, NULL, '37.4449168', '127.1388684', '경기 성남시 수정구 태평동 3309', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13467, 533, '출발지', 40, 8, 343, NULL, '37.5382641', '126.9437979', '서울 마포구 마포동 35-6', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13468, 534, '출발지', 40, 8, 343, NULL, '37.5382641', '126.9437979', '서울 마포구 마포동 35-6', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13469, 535, '출발지', 18, 51, 742, NULL, '37.4908168', '126.7568771', '경기 부천시 상동 488', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13470, 536, '출발지', 18, 51, 742, NULL, '37.4908168', '126.7568771', '경기 부천시 상동 488', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13471, 537, '출발지', 18, 51, 742, NULL, '37.4908168', '126.7568771', '경기 부천시 상동 488', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13472, 538, '출발지', 18, 76, 1234, NULL, '37.338534', '126.9305543', '경기 군포시 부곡동 1204', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13473, 539, '출발지', 18, 76, 1234, NULL, '37.338534', '126.9305543', '경기 군포시 부곡동 1204', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13474, 540, '출발지', 40, 36, 711, NULL, '37.565214', '126.9583829', '서울 서대문구 북아현동 1-1884', '2016-09-02 22:31:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13475, 541, '출발지', 40, 36, 711, NULL, '37.565214', '126.9583829', '서울 서대문구 북아현동 1-1884', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13476, 542, '출발지', 18, 51, 735, NULL, '37.5295182', '126.8145059', '경기 부천시 고강동 287-32', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13477, 543, '출발지', 40, 9, 372, NULL, '37.5113419', '127.099574', '서울 송파구 잠실동 40-1', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13478, 544, '출발지', 40, 9, 372, NULL, '37.5113419', '127.099574', '서울 송파구 잠실동 40-1', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13479, 545, '출발지', 40, 9, 362, NULL, '37.4949592', '127.129122', '서울 송파구 가락동 140', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13480, 546, '출발지', 19, 118, 1852, NULL, '35.1954434', '129.0750953', '부산 연제구 거제동 256-1', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13481, 547, '출발지', 40, 34, 680, NULL, '37.618912734562585', '126.92092660814522', '서울 은평구 갈현동 397', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13482, 548, '출발지', 18, 58, 820, NULL, '36.99072771707187', '127.08506505936384', '경기 평택시 평택동 185-568', '2016-09-02 22:31:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13483, 549, '출발지', 20, 124, 1962, NULL, '37.43946373340245', '126.68276891112328', '인천 남구 문학동 343-2', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13484, 550, '출발지', 18, 82, 1322, NULL, '37.29854196317913', '126.95299945771696', '경기 수원시 권선구 입북동 815', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13485, 551, '출발지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13486, 552, '출발지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13487, 553, '출발지', 18, 64, 1020, 6027, '37.3706918', '127.2536112', '경기 광주시 오포읍 양벌리 727-2', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13488, 554, '출발지', 19, 110, 1781, NULL, '35.114979', '129.041549', '부산 동구 초량동 1187-21', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13489, 555, '출발지', 19, 110, 1781, NULL, '35.114979', '129.041549', '부산 동구 초량동 1187-21', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13490, 556, '출발지', 40, 7, 331, NULL, '37.476559', '126.981633', '서울 동작구 사당동 588-45', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13491, 557, '출발지', 40, 7, 331, NULL, '37.476559', '126.981633', '서울 동작구 사당동 588-45', '2016-09-02 22:32:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13492, 558, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13493, 559, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13494, 560, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13495, 561, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13496, 562, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13497, 563, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13498, 564, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13499, 565, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13500, 566, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13501, 567, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13502, 568, '출발지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13503, 569, '출발지', 22, 140, 2321, NULL, '35.868029', '128.7244', '대구 동구 신서동 627-15', '2016-09-02 22:32:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13504, 570, '출발지', 29, 252, 4722, NULL, '35.8572385', '127.1001774', '전북 전주시 덕진구 팔복동1가 263-3', '2016-09-02 22:32:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13505, 571, '출발지', 18, 84, 1342, NULL, '37.304858', '127.0074963', '경기 수원시 장안구 조원동 881', '2016-09-02 22:32:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13506, 572, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13507, 573, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13508, 574, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13509, 575, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13510, 576, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13511, 577, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13512, 578, '출발지', 40, 8, 342, NULL, '37.5568693', '126.9260525', '서울 마포구 동교동 169-1', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13513, 579, '출발지', 40, 3, 305, NULL, '37.4705412', '126.9672545', '서울 관악구 봉천동 180-93', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13514, 580, '출발지', 40, 16, 540, NULL, '37.5724255', '126.9913789', '서울 종로구 묘동 174-3', '2016-09-02 22:32:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13515, 581, '출발지', 40, 16, 540, NULL, '37.5724255', '126.9913789', '서울 종로구 묘동 174-3', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13516, 582, '출발지', 18, 79, 1278, NULL, '37.382699', '127.1189057', '경기 성남시 분당구 수내동 1', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13517, 583, '출발지', 18, 77, 1255, 6405, '37.6572989', '127.3073314', '경기 남양주시 화도읍 마석우리 215-1', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13518, 584, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13519, 585, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13520, 586, '출발지', 40, 36, 713, NULL, '37.5791158', '126.9367789', '서울 서대문구 연희동 168-6', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13521, 587, '출발지', 40, 1, 288, NULL, '37.50442910573053', '127.06233903765677', '서울 강남구 대치동 952-1', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13522, 588, '출발지', 40, 1, 288, NULL, '37.50442910573053', '127.06233903765677', '서울 강남구 대치동 952-1', '2016-09-02 22:32:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13523, 589, '출발지', 18, 51, 756, NULL, '37.5011144310556', '126.77030481398104', '경기 부천시 중동 1256', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13524, 590, '출발지', 30, 67, 1107, NULL, '34.7349127', '127.7237356', '전남 여수시 봉산동 255-12', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13525, 591, '출발지', 18, 58, 788, NULL, '37.04169979823196', '127.08685308694838', '경기 평택시 가재동 195-1', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13526, 592, '출발지', 30, 261, 4922, NULL, '35.03839059055217', '126.71726144850255', '전남 나주시 성북동 35-5', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13527, 593, '출발지', 40, 4, 308, NULL, '37.5343972', '127.0939907', '서울 광진구 구의동 546-1', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13528, 594, '출발지', 24, 162, 2896, NULL, '37.8813153', '127.7299707', '강원 춘천시 옥천동 111-1', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13529, 595, '출발지', 18, 85, 1359, NULL, '37.2795188', '127.0410758', '경기 수원시 팔달구 우만동 29', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13530, 596, '출발지', 18, 85, 1359, NULL, '37.2795188', '127.0410758', '경기 수원시 팔달구 우만동 29', '2016-09-02 22:32:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13531, 597, '출발지', 21, 134, 2171, NULL, '36.3580485', '127.3778352', '대전 서구 월평동 282-5', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13532, 598, '출발지', 20, 128, 2007, NULL, '37.520627188275824', '126.67168736457825', '인천 서구 신현동 302-1', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13533, 599, '출발지', 24, 158, 2823, NULL, '37.3448435', '127.9308469', '강원 원주시 단계동 877-1', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13534, 600, '출발지', 20, 128, 2005, NULL, '37.5111171', '126.6789631', '인천 서구 석남동 111-90', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13535, 601, '출발지', 18, 80, 1302, NULL, '37.4449168', '127.1388684', '경기 성남시 수정구 태평동 3309', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13536, 602, '출발지', 40, 8, 342, NULL, '37.556707', '126.923933', '서울 마포구 동교동 165-4', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13537, 603, '출발지', 40, 8, 342, NULL, '37.556707', '126.923933', '서울 마포구 동교동 165-4', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13538, 604, '출발지', 28, 236, 4383, NULL, '35.148879', '128.658292', '경남 창원시 진해구 창선동 4-13', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13539, 605, '출발지', 26, 195, 3470, NULL, '36.84695383838178', '127.11253590881824', '충남 천안시 서북구 차암동 421', '2016-09-02 22:32:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13540, 606, '출발지', 40, 8, 342, NULL, '37.5572711', '126.9223021', '서울 마포구 동교동 151-3', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13541, 607, '출발지', 19, 114, 1809, NULL, '35.18111984315616', '128.98924201726913', '부산 사상구 덕포동 791', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13542, 608, '출발지', 19, 116, 1823, NULL, '35.08213792374072', '129.02548167854548', '부산 서구 남부민동 523-57', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13543, 609, '출발지', 18, 100, 1601, NULL, '37.3832121', '126.9768303', '경기 의왕시 내손동 845', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13544, 610, '출발지', 18, 100, 1601, NULL, '37.3832121', '126.9768303', '경기 의왕시 내손동 845', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13545, 611, '출발지', 28, 234, 4283, NULL, '35.2197859', '128.6857217', '경남 창원시 성산구 상남동 505-4', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13546, 612, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13547, 613, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13548, 614, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13549, 615, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13550, 616, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13551, 617, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13552, 618, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13553, 619, '출발지', 22, 144, 2421, NULL, '35.8714354', '128.601445', '대구 중구 동인동1가 2-1', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13554, 620, '출발지', 22, 138, 2269, NULL, '35.8311194', '128.5554765', '대구 달서구 송현동 2004-3', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13555, 621, '출발지', 18, 88, 1423, NULL, '37.3046447', '126.8654206', '경기 안산시 상록구 일동 665-4', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13556, 622, '출발지', 40, 8, 342, NULL, '37.5554954', '126.9232428', '서울 마포구 동교동 163-12', '2016-09-02 22:32:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13557, 623, '출발지', 40, 8, 342, NULL, '37.5554954', '126.9232428', '서울 마포구 동교동 163-12', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13558, 624, '출발지', 40, 8, 342, NULL, '37.5554954', '126.9232428', '서울 마포구 동교동 163-12', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13559, 625, '출발지', 40, 8, 342, NULL, '37.5554954', '126.9232428', '서울 마포구 동교동 163-12', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13560, 626, '출발지', 40, 8, 342, NULL, '37.5554954', '126.9232428', '서울 마포구 동교동 163-12', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13561, 627, '출발지', 40, 4, 308, NULL, '37.5342697', '127.0925578', '서울 광진구 구의동 546-3', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13562, 628, '출발지', 18, 76, 1228, NULL, '37.361708', '126.9396995', '경기 군포시 금정동 721-25', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13563, 629, '출발지', 18, 76, 1228, NULL, '37.361708', '126.9396995', '경기 군포시 금정동 721-25', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13564, 630, '출발지', 40, 1, 299, NULL, '37.522875', '127.0439333', '서울 강남구 청담동 77-30', '2016-09-02 22:32:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13565, 631, '출발지', 40, 9, 367, NULL, '37.5072843', '127.0918916', '서울 송파구 삼전동 150', '2016-09-02 22:32:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13566, 632, '출발지', 24, 150, 2666, 7691, '37.6960117', '128.8920543', '강원 강릉시 구정면 어단리 973-1', '2016-09-02 22:32:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13567, 633, '출발지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:32:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13568, 634, '출발지', 40, 2, 302, NULL, '37.6372978', '127.0165952', '서울 강북구 수유동 408-32', '2016-09-02 22:32:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13569, 635, '출발지', 18, 84, 1342, NULL, '37.3047233', '127.0077394', '경기 수원시 장안구 조원동 881', '2016-09-02 22:32:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13570, 636, '출발지', 40, 4, 313, NULL, '37.5403833', '127.0693413', '서울 광진구 화양동 6-5', '2016-09-02 22:32:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13571, 637, '출발지', 40, 4, 313, NULL, '37.5403833', '127.0693413', '서울 광진구 화양동 6-5', '2016-09-02 22:32:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13572, 638, '출발지', 24, 154, 2786, NULL, '38.2015477', '128.5770518', '강원 속초시 교동 917', '2016-09-02 22:32:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13573, 639, '출발지', 18, 88, 1414, NULL, '37.2934414', '126.8594383', '경기 안산시 상록구 본오동 890-2', '2016-09-02 22:32:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13574, 640, '출발지', 40, 1, 295, NULL, '37.5075826', '127.0402016', '서울 강남구 역삼동 688-2', '2016-09-02 22:32:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13575, 641, '출발지', 40, 1, 295, NULL, '37.5075826', '127.0402016', '서울 강남구 역삼동 688-2', '2016-09-02 22:32:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13576, 642, '출발지', 22, 143, 2400, NULL, '35.8300049', '128.6318028', '대구 수성구 지산동 761-11', '2016-09-02 22:32:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13577, 643, '출발지', 28, 231, 4192, 16138, '35.5445563', '128.4922143', '경남 창녕군 창녕읍 교리 1', '2016-09-02 22:32:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13578, 644, '출발지', 19, 111, 1782, NULL, '35.1939138', '129.0969452', '부산 동래구 낙민동 93-1', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13579, 645, '출발지', 18, 101, 1620, NULL, '37.738098', '127.0336819', '경기 의정부시 의정부동 326-2', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13580, 646, '출발지', 40, 13, 441, NULL, '37.524553', '126.87505', '서울 양천구 목동 406-30', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13581, 647, '출발지', 40, 13, 441, NULL, '37.524553', '126.87505', '서울 양천구 목동 406-30', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13582, 648, '출발지', 40, 13, 443, NULL, '37.526072', '126.864301', '서울 양천구 신정동 1095', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13583, 649, '출발지', 40, 13, 441, NULL, '37.5291562', '126.8644259', '서울 양천구 목동 808-2', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13584, 650, '출발지', 40, 13, 441, NULL, '37.5291562', '126.8644259', '서울 양천구 목동 808-2', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13585, 651, '출발지', 40, 13, 443, NULL, '37.5278852', '126.8636564', '서울 양천구 신정동 899-4', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13586, 652, '출발지', 40, 13, 443, NULL, '37.5278852', '126.8636564', '서울 양천구 신정동 899-4', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13587, 653, '출발지', 40, 284, 5315, NULL, '37.5973103', '127.0578775', '서울 동대문구 이문동 270-1', '2016-09-02 22:32:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13588, 654, '출발지', 40, 284, 5315, NULL, '37.5973103', '127.0578775', '서울 동대문구 이문동 270-1', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13589, 655, '출발지', 18, 87, 1407, NULL, '37.3349282', '126.8238259', '경기 안산시 단원구 와동 855-8', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13590, 656, '출발지', 18, 74, 1220, NULL, '37.4690673', '126.8693496', '경기 광명시 하안동 740', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13591, 657, '출발지', 18, 74, 1220, NULL, '37.4690673', '126.8693496', '경기 광명시 하안동 740', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13592, 658, '출발지', 40, 9, 372, NULL, '37.5069779', '127.1004912', '서울 송파구 잠실동 48', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13593, 659, '출발지', 40, 14, 455, NULL, '37.5184018', '126.8961146', '서울 영등포구 문래동3가 55-3', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13594, 660, '출발지', 40, 14, 455, NULL, '37.5184018', '126.8961146', '서울 영등포구 문래동3가 55-3', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13595, 661, '출발지', 40, 14, 455, NULL, '37.5184018', '126.8961146', '서울 영등포구 문래동3가 55-3', '2016-09-02 22:32:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13596, 662, '출발지', 40, 14, 455, NULL, '37.5184018', '126.8961146', '서울 영등포구 문래동3가 55-3', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13597, 663, '출발지', 18, 76, 1228, NULL, '37.3616783', '126.939767', '경기 군포시 금정동 819', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13598, 664, '출발지', 40, 6, 324, NULL, '37.4865428', '126.8787037', '서울 금천구 가산동 515-48', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13599, 665, '출발지', 40, 13, 442, NULL, '37.5376518', '126.8232805', '서울 양천구 신월동 43-3', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13600, 666, '출발지', 40, 284, 5315, NULL, '37.5973103', '127.0578775', '서울 동대문구 이문동 270-1', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13601, 667, '출발지', 40, 284, 5315, NULL, '37.5973103', '127.0578775', '서울 동대문구 이문동 270-1', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13602, 668, '출발지', 40, 1, 295, NULL, '37.5023849', '127.0266826', '서울 강남구 역삼동 813-19', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13603, 669, '출발지', 40, 1, 295, NULL, '37.5023849', '127.0266826', '서울 강남구 역삼동 813-19', '2016-09-02 22:32:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13604, 670, '출발지', 40, 1, 295, NULL, '37.5023849', '127.0266826', '서울 강남구 역삼동 813-19', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13605, 671, '출발지', 18, 96, 1556, NULL, '37.1297372', '127.0845594', '경기 오산시 청호동 120', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13606, 672, '출발지', 20, 127, 1988, NULL, '37.490473', '126.723469', '인천 부평구 부평동 224-1', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13607, 673, '출발지', 22, 138, 2275, NULL, '35.85071693669882', '128.5155826807022', '대구 달서구 이곡동 653-9', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13608, 674, '출발지', 18, 76, 1228, NULL, '37.3617355', '126.9397307', '경기 군포시 금정동 721-25', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13609, 675, '출발지', 18, 76, 1228, NULL, '37.3617355', '126.9397307', '경기 군포시 금정동 721-25', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13610, 676, '출발지', 20, 124, 1966, NULL, '37.4427182', '126.6775417', '인천 남구 학익동 46-2', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13611, 677, '출발지', 40, 1, 295, NULL, '37.49981533209043', '127.03685738146305', '서울 강남구 역삼동 737', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13612, 678, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13613, 679, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13614, 680, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13615, 681, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13616, 682, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13617, 683, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13618, 684, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13619, 685, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13620, 686, '출발지', 40, 35, 698, NULL, '37.5667454', '126.8013363', '서울 강서구 방화동 886', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13621, 687, '출발지', 18, 86, 1376, NULL, '37.4481619', '126.7845758', '경기 시흥시 대야동 332-1', '2016-09-02 22:32:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13622, 688, '출발지', 18, 81, 1310, NULL, '37.4415555', '127.1497677', '경기 성남시 중원구 중앙동 1', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13623, 689, '출발지', 18, 80, 1297, NULL, '37.440949', '127.147493', '경기 성남시 수정구 신흥동 2467', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13624, 690, '출발지', 28, 222, 4009, NULL, '34.891595698886704', '128.639568798244', '경남 거제시 양정동 962-1', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13625, 691, '출발지', 40, 284, 5317, NULL, '37.581381', '127.048958', '서울 동대문구 전농동 588-1', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13626, 692, '출발지', 22, 143, 2385, NULL, '35.8582435', '128.6306086', '대구 수성구 범어동 238-3', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13627, 693, '출발지', 40, 17, 617, NULL, '37.5627667', '126.9821314', '서울 중구 명동2가 95-1', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13628, 694, '출발지', 40, 284, 5319, NULL, '37.5863388', '127.0471569', '서울 동대문구 청량리동 57-30', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13629, 695, '출발지', 22, 143, 2383, NULL, '35.840887', '128.704902', '대구 수성구 매호동 812-2', '2016-09-02 22:32:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13630, 696, '출발지', 18, 74, 1220, NULL, '37.4674665', '126.8706093', '경기 광명시 하안동 736-4', '2016-09-02 22:32:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13631, 697, '출발지', 18, 85, 1359, NULL, '37.2853444', '127.0338987', '경기 수원시 팔달구 우만동 520-12', '2016-09-02 22:32:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13632, 698, '출발지', 19, 109, 1773, NULL, '35.1344828', '129.0877518', '부산 남구 대연동 1757-5', '2016-09-02 22:32:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13633, 699, '출발지', 28, 222, 4011, NULL, '34.8941936', '128.6885165', '경남 거제시 옥포동 526-7', '2016-09-02 22:32:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13634, 700, '출발지', 18, 76, 1228, NULL, '37.3617126', '126.9397683', '경기 군포시 금정동 819', '2016-09-02 22:32:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13635, 701, '출발지', 28, 231, 4192, 16138, '35.5445563', '128.4922143', '경남 창녕군 창녕읍 교리 1', '2016-09-02 22:32:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13636, 702, '출발지', 40, 13, 443, NULL, '37.526072', '126.864301', '서울 양천구 신정동 1095', '2016-09-02 22:32:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13637, 703, '출발지', 27, 60, 905, NULL, '36.0985907', '128.4212597', '경북 구미시 진평동 199-2', '2016-09-02 22:32:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13638, 704, '출발지', 30, 67, 1136, NULL, '34.7630634', '127.6620075', '전남 여수시 학동 300', '2016-09-02 22:32:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13639, 705, '출발지', 19, 114, 1808, NULL, '35.16639773969733', '128.9826501533389', '부산 사상구 괘법동 575-1', '2016-09-02 22:32:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13640, 706, '출발지', 40, 3, 306, NULL, '37.4832462', '126.9239591', '서울 관악구 신림동 1578-28', '2016-09-02 22:32:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13641, 707, '출발지', 40, 3, 306, NULL, '37.4832462', '126.9239591', '서울 관악구 신림동 1578-28', '2016-09-02 22:32:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13642, 708, '출발지', 40, 3, 306, NULL, '37.4832462', '126.9239591', '서울 관악구 신림동 1578-28', '2016-09-02 22:32:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13643, 709, '출발지', 40, 11, 391, NULL, '37.5614809', '127.0432258', '서울 성동구 사근동 303', '2016-09-02 22:32:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13644, 710, '출발지', 40, 11, 391, NULL, '37.5614809', '127.0432258', '서울 성동구 사근동 303', '2016-09-02 22:32:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13645, 711, '출발지', 18, 86, 1391, NULL, '37.3536595', '126.743895', '경기 시흥시 정왕동 2353', '2016-09-02 22:32:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13646, 712, '출발지', 18, 84, 1343, NULL, '37.2934132', '126.9761463', '경기 수원시 장안구 천천동 300', '2016-09-02 22:32:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13647, 713, '출발지', 18, 97, 1560, NULL, '37.2728516', '127.1271299', '경기 용인시 기흥구 구갈동 578-3', '2016-09-02 22:32:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13648, 714, '출발지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:32:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13649, 715, '출발지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:32:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13650, 716, '출발지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:32:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13651, 717, '출발지', 40, 13, 441, NULL, '37.5448993', '126.8690398', '서울 양천구 목동 499-47', '2016-09-02 22:32:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13652, 718, '출발지', 18, 91, 1479, NULL, '37.39811981171876', '126.92095912992954', '경기 안양시 만안구 안양동 1189-4', '2016-09-02 22:32:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13653, 719, '출발지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:32:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13654, 720, '출발지', 22, 138, 2271, NULL, '35.8553274', '128.5169074', '대구 달서구 용산동 416-1', '2016-09-02 22:32:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13655, 721, '출발지', 19, 110, 1781, NULL, '35.1254695', '129.0458854', '부산 동구 초량동 1152-1', '2016-09-02 22:32:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13656, 722, '출발지', 19, 110, 1781, NULL, '35.1254695', '129.0458854', '부산 동구 초량동 1152-1', '2016-09-02 22:32:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13657, 723, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13658, 724, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13659, 725, '출발지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13660, 726, '출발지', 40, 1, 299, NULL, '37.527385', '127.040555', '서울 강남구 청담동 139', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13661, 727, '출발지', 40, 1, 299, NULL, '37.527385', '127.040555', '서울 강남구 청담동 139', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13662, 728, '출발지', 40, 1, 295, NULL, '37.504724', '127.02538', '서울 강남구 역삼동 800', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13663, 729, '출발지', 40, 1, 295, NULL, '37.504724', '127.02538', '서울 강남구 역삼동 800', '2016-09-02 22:32:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13664, 730, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13665, 731, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13666, 732, '출발지', 19, 112, 1797, NULL, '35.15451430009087', '129.0594632551074', '부산 부산진구 부전동 573-1', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13667, 733, '출발지', 28, 56, 776, NULL, '35.2316112', '128.8594094', '경남 김해시 외동 1247-3', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13668, 734, '출발지', 19, 121, 1920, NULL, '35.1618778', '129.1600697', '부산 해운대구 우동 656', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13669, 735, '출발지', 18, 91, 1479, NULL, '37.3913994', '126.9344262', '경기 안양시 만안구 안양동 193-31', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13670, 736, '출발지', 18, 91, 1479, NULL, '37.3913994', '126.9344262', '경기 안양시 만안구 안양동 193-31', '2016-09-02 22:32:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13671, 737, '출발지', 18, 91, 1479, NULL, '37.3913938', '126.9344202', '경기 안양시 만안구 안양동 193-31', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13672, 738, '출발지', 20, 129, 2018, NULL, '37.42848158424442', '126.65530946105719', '인천 연수구 옥련동 288-15', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13673, 739, '출발지', 24, 150, 2665, NULL, '37.7627195', '128.8743686', '강원 강릉시 교동 1891-10', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13674, 740, '출발지', 20, 125, 1969, NULL, '37.4552562', '126.713507', '인천 남동구 구월동 23', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13675, 741, '출발지', 26, 195, 3463, 12028, '36.916675', '127.126936', '충남 천안시 서북구 성환읍 성환리 449-128', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13676, 742, '출발지', 40, 34, 686, NULL, '37.5945698', '126.9068657', '서울 은평구 신사동 200-9', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13677, 743, '출발지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13678, 744, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13679, 745, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:32:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13680, 746, '출발지', 20, 131, 2057, NULL, '37.4955245', '126.4802716', '인천 중구 운서동 2747-5', '2016-09-02 22:32:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13681, 747, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:32:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13682, 748, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:32:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13683, 749, '출발지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:32:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13684, 750, '출발지', 18, 86, 1376, NULL, '37.4453019', '126.7978212', '경기 시흥시 대야동 577-1', '2016-09-02 22:32:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13685, 751, '출발지', 20, 123, 1939, NULL, '37.571747', '126.736367', '인천 계양구 귤현동 451-264', '2016-09-02 22:32:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13686, 752, '출발지', 20, 123, 1939, NULL, '37.571747', '126.736367', '인천 계양구 귤현동 451-264', '2016-09-02 22:32:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13687, 753, '출발지', 40, 32, 676, NULL, '37.654527', '127.060551', '서울 노원구 상계동 729', '2016-09-02 22:32:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13688, 754, '출발지', 18, 99, 1597, 7030, '37.2871291', '127.2379799', '경기 용인시 처인구 포곡읍 삼계리 319-43', '2016-09-02 22:32:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13689, 755, '출발지', 18, 91, 1479, NULL, '37.398696734297026', '126.92075394093989', '경기 안양시 만안구 안양동 676-91', '2016-09-02 22:32:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13690, 756, '출발지', 25, 173, 3013, 9542, '36.9120132', '127.5379765', '충북 음성군 맹동면 두성리 863-2', '2016-09-02 22:32:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13691, 757, '출발지', 22, 140, 2322, NULL, '35.879667', '128.628476', '대구 동구 신암동 295', '2016-09-02 22:32:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13692, 758, '출발지', 68, NULL, NULL, NULL, '36.47860681032157', '127.28415068238974', '세종특별자치시 보람동 664-20', '2016-09-02 22:32:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13693, 759, '출발지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:32:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13694, 760, '출발지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:32:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13695, 761, '출발지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:32:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13696, 762, '출발지', 24, 167, 2959, 8825, '37.4794904', '127.9809549', '강원 횡성군 횡성읍 입석리 163', '2016-09-02 22:32:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13697, 763, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:32:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13698, 764, '출발지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:32:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13699, 765, '출발지', 40, 14, 468, NULL, '37.5219933', '126.9275874', '서울 영등포구 여의도동 3-3', '2016-09-02 22:32:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13700, 766, '출발지', 40, 14, 468, NULL, '37.5219933', '126.9275874', '서울 영등포구 여의도동 3-3', '2016-09-02 22:32:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13701, 767, '출발지', 40, 14, 468, NULL, '37.5219933', '126.9275874', '서울 영등포구 여의도동 3-3', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13702, 768, '출발지', 40, 10, 378, NULL, '37.484204', '127.015399', '서울 서초구 서초동 1446-1', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13703, 769, '출발지', 40, 10, 378, NULL, '37.484204', '127.015399', '서울 서초구 서초동 1446-1', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13704, 770, '출발지', 20, 131, 2074, NULL, '37.4546798', '126.6008143', '인천 중구 항동7가 58-1', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13705, 771, '출발지', 20, 131, 2074, NULL, '37.4546798', '126.6008143', '인천 중구 항동7가 58-1', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13706, 772, '출발지', 19, 117, 1851, NULL, '35.16999142967593', '129.1123741865158', '부산 수영구 수영동 443', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13707, 773, '출발지', 28, 222, 4008, NULL, '34.8689789', '128.68', '경남 거제시 아주동 1389-4', '2016-09-02 22:32:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13708, 774, '출발지', 23, 149, 2659, NULL, '35.1595454', '126.8526012', '광주 서구 치평동 1200', '2016-09-02 22:32:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13709, 775, '출발지', 18, 105, 1729, 7397, '37.1262973', '126.9293358', '경기 화성시 향남읍 행정리 482', '2016-09-02 22:32:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13710, 776, '출발지', 18, 86, 1391, NULL, '37.351816', '126.742844', '경기 시흥시 정왕동 2325-10', '2016-09-02 22:32:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13711, 777, '출발지', 40, 5, 316, NULL, '37.50195335396189', '126.86078980565073', '서울 구로구 고척동 141-1', '2016-09-02 22:32:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13712, 778, '출발지', 40, 8, 360, NULL, '37.54895', '126.91354', '서울 마포구 합정동 420', '2016-09-02 22:32:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13713, 779, '출발지', 40, 8, 360, NULL, '37.54895', '126.91354', '서울 마포구 합정동 420', '2016-09-02 22:32:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13714, 780, '출발지', 18, 102, 1645, NULL, '37.2886301', '127.4599046', '경기 이천시 증포동 99-4', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13715, 781, '출발지', 21, 134, 2171, NULL, '36.3568014', '127.3643296', '대전 서구 월평동 548', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13716, 782, '출발지', 40, 1, 293, NULL, '37.5277961', '127.0346989', '서울 강남구 신사동 668-31', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13717, 783, '출발지', 40, 1, 293, NULL, '37.5277961', '127.0346989', '서울 강남구 신사동 668-31', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13718, 784, '출발지', 40, 1, 293, NULL, '37.5277961', '127.0346989', '서울 강남구 신사동 668-31', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13719, 785, '출발지', 40, 3, 305, NULL, '37.47091293334961', '126.96736145019531', '서울 관악구 봉천동 180-110', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13720, 786, '출발지', 40, 3, 305, NULL, '37.47091293334961', '126.96736145019531', '서울 관악구 봉천동 180-110', '2016-09-02 22:32:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13721, 787, '출발지', 40, 3, 305, NULL, '37.470890045166016', '126.96847534179688', '서울 관악구 봉천동 178-60', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13722, 788, '출발지', 18, 102, 1645, NULL, '37.2982658', '127.4567182', '경기 이천시 증포동 227-15', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13723, 789, '출발지', 28, 222, 4008, NULL, '34.87623790557033', '128.69281763031876', '경남 거제시 아주동 751-5', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13724, 790, '출발지', 40, 1, 293, NULL, '37.52115586945625', '127.02283697718428', '서울 강남구 신사동 667-13', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13725, 791, '출발지', 18, 85, 1352, NULL, '37.26568218296588', '127.00004960484385', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13726, 792, '출발지', 40, 1, 295, NULL, '37.50052261352539', '127.03716278076172', '서울 강남구 역삼동 803-3', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13727, 793, '출발지', 40, 16, 547, NULL, '37.56914696867927', '126.97864706815112', '서울 종로구 서린동 125-3', '2016-09-02 22:32:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13728, 794, '출발지', 19, 114, 1808, NULL, '35.16256828322786', '128.9887247142873', '부산 사상구 괘법동 429-1', '2016-09-02 22:32:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13729, 795, '출발지', 40, 35, 700, NULL, '37.5586545', '126.7944739', '서울 강서구 오곡동 1', '2016-09-02 22:32:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13730, 796, '출발지', 18, 79, 1273, NULL, '37.394776627382875', '127.11119669891646', '경기 성남시 분당구 백현동 산 4-14', '2016-09-02 22:32:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13731, 797, '출발지', 19, 112, 1798, NULL, '35.172734843939004', '129.07163243372432', '부산 부산진구 양정동 336-8', '2016-09-02 22:32:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13732, 798, '출발지', 19, 112, 1798, NULL, '35.17422103881836', '129.0684051513672', '부산 부산진구 양정동 408', '2016-09-02 22:32:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13733, 799, '출발지', 19, 112, 1798, NULL, '35.174137115478516', '129.06849670410156', '부산 부산진구 양정동 386-8', '2016-09-02 22:32:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13734, 800, '출발지', 18, 92, 1487, NULL, '37.848445892333984', '127.06194305419922', '경기 양주시 덕정동 538', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13735, 801, '출발지', 18, 92, 1487, NULL, '37.84799575805664', '127.06208801269531', '경기 양주시 덕정동 538', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13736, 802, '출발지', 18, 92, 1487, NULL, '37.84347973651809', '127.06121872801658', '경기 양주시 덕정동 350-14', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13737, 803, '출발지', 40, 4, 308, NULL, '37.534278567940355', '127.09441419289622', '서울 광진구 구의동 546-1', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13738, 804, '출발지', 40, 10, 378, NULL, '37.484453425987155', '127.03398317173767', '서울 서초구 서초동 1375', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13739, 805, '출발지', 19, 120, 1906, NULL, '35.11489486694336', '129.03192138671875', '부산 중구 영주동 71-5', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13740, 806, '출발지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:32:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13741, 807, '출발지', 19, 112, 1791, NULL, '35.14926528930664', '129.03213500976563', '부산 부산진구 가야동 551-33', '2016-09-02 22:32:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13742, 808, '출발지', 24, 150, 2664, NULL, '37.77170944213867', '128.94778442382813', '강원 강릉시 견소동 130', '2016-09-02 22:32:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13743, 809, '출발지', 40, 6, 324, NULL, '37.47306442260742', '126.88860321044922', '서울 금천구 가산동 238-1', '2016-09-02 22:32:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13744, 810, '출발지', 27, 200, 3588, NULL, '35.85816192626953', '129.21502685546875', '경북 경주시 황성동 산 1-1', '2016-09-02 22:32:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13745, 811, '출발지', 25, 180, 3140, 10259, '36.71491622924805', '127.42198944091797', '충북 청주시 청원구 오창읍 양청리 752-9', '2016-09-02 22:32:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13746, 812, '출발지', 25, 180, 3140, 10259, '36.71495819091797', '127.42190551757813', '충북 청주시 청원구 오창읍 양청리 752-9', '2016-09-02 22:32:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13747, 813, '출발지', 26, 194, 3434, 11954, '36.75950987303887', '127.17772848525921', '충남 천안시 동남구 목천읍 삼성리 9-12', '2016-09-02 22:32:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13748, 814, '출발지', 24, 150, 2705, NULL, '37.767066955566406', '128.90524291992188', '강원 강릉시 포남동 1115-9', '2016-09-02 22:32:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13749, 815, '출발지', 18, 102, 1643, NULL, '37.27742061817926', '127.44693565240527', '경기 이천시 중리동 219-1', '2016-09-02 22:32:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13750, 816, '출발지', 27, 60, 905, NULL, '36.094856187157255', '128.4275970607476', '경북 구미시 진평동 1078', '2016-09-02 22:32:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13751, 817, '출발지', 40, 32, 677, NULL, '37.621109929076965', '127.06692157931668', '서울 노원구 월계동 17', '2016-09-02 22:32:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13752, 818, '출발지', 40, 32, 677, NULL, '37.621109929076965', '127.06692157931668', '서울 노원구 월계동 17', '2016-09-02 22:32:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13753, 819, '출발지', 28, 233, 4263, NULL, '35.2391693432912', '128.58348760816384', '경남 창원시 마산회원구 합성동 267', '2016-09-02 22:32:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13754, 820, '출발지', 18, 87, 1406, NULL, '37.337501525878906', '126.76288604736328', '경기 안산시 단원구 신길동 1436-5', '2016-09-02 22:32:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13755, 821, '출발지', 19, 111, 1789, NULL, '35.21046829223633', '129.07899475097656', '부산 동래구 온천동 1750-1', '2016-09-02 22:32:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13756, 822, '출발지', 19, 111, 1783, NULL, '35.211212158203125', '129.08059692382813', '부산 동래구 명륜동 691-12', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13757, 823, '출발지', 27, 220, 3950, 14929, '35.98735809326172', '129.33226013183594', '경북 포항시 남구 연일읍 택전리 591-5', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13758, 824, '출발지', 20, 125, 1973, NULL, '37.463069915771484', '126.73131561279297', '인천 남동구 만수동 1115-1', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13759, 825, '출발지', 39, 278, 5221, NULL, '35.535072326660156', '129.32701110839844', '울산 남구 달동 118-3', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13760, 826, '출발지', 29, 253, 4768, NULL, '35.80036580012174', '127.14266114700503', '전북 전주시 완산구 평화동1가 412', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13761, 827, '출발지', 22, 138, 2264, NULL, '35.8530176720935', '128.56578463905376', '대구 달서구 두류동 산 302-11', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13762, 828, '출발지', 27, 60, 899, NULL, '36.12827222133686', '128.33101623502327', '경북 구미시 원평동 1008-1', '2016-09-02 22:32:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13763, 829, '출발지', 28, 230, 4156, NULL, '35.17806026690693', '128.07361606267008', '경남 진주시 신안동 102-23', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13764, 830, '출발지', 22, 142, 2376, NULL, '35.873478972698244', '128.55037644006086', '대구 서구 평리동 1500', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13765, 831, '출발지', 18, 90, 1476, NULL, '37.372493743896484', '126.96498107910156', '경기 안양시 동안구 호계동 1253', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13766, 832, '출발지', 20, 127, 1988, NULL, '37.48944904290551', '126.72433108861824', '인천 부평구 부평동 738-21', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13767, 833, '출발지', 20, 125, 1969, NULL, '37.4543571472168', '126.69536590576172', '인천 남동구 구월동 1340-4', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13768, 834, '출발지', 18, 100, 1601, NULL, '37.38305184391553', '126.97570095961717', '경기 의왕시 내손동 845', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13769, 835, '출발지', 18, 82, 1313, NULL, '37.23912296516388', '127.02940534836488', '경기 수원시 권선구 곡반정동 558-6', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13770, 836, '출발지', 28, 236, 4355, NULL, '35.15756607055664', '128.6990509033203', '경남 창원시 진해구 석동 543-5', '2016-09-02 22:32:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13771, 837, '출발지', 40, 12, 438, NULL, '37.602161148481926', '127.00565767452808', '서울 성북구 정릉동 635-2', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13772, 838, '출발지', 40, 12, 438, NULL, '37.602161148481926', '127.00565767452808', '서울 성북구 정릉동 635-2', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13773, 839, '출발지', 40, 12, 438, NULL, '37.602161148481926', '127.00565767452808', '서울 성북구 정릉동 635-2', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13774, 840, '출발지', 20, 124, 1964, NULL, '37.45250878659678', '126.64026406628956', '인천 남구 용현동 611-6', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13775, 841, '출발지', 20, 124, 1964, NULL, '37.45250878659678', '126.64026406628956', '인천 남구 용현동 611-6', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13776, 842, '출발지', 40, 3, 305, NULL, '37.47648620605469', '126.96440124511719', '서울 관악구 봉천동 1658-17', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13777, 843, '출발지', 18, 85, 1360, NULL, '37.26358467878496', '127.0287158983112', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13778, 844, '출발지', 18, 85, 1360, NULL, '37.26358467878496', '127.0287158983112', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13779, 845, '출발지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:32:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13780, 846, '출발지', 40, 13, 443, NULL, '37.50920365300835', '126.84293547608154', '서울 양천구 신정동 735-5', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13781, 847, '출발지', 18, 83, 1331, NULL, '37.24583837038577', '127.05685478132709', '경기 수원시 영통구 영통동 1069', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13782, 848, '출발지', 24, 156, 2806, 8038, '38.05542755126953', '128.6849822998047', '강원 양양군 손양면 동호리 1-92', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13783, 849, '출발지', 40, 3, 306, NULL, '37.47134780883789', '126.93408203125', '서울 관악구 신림동 289-3', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13784, 850, '출발지', 19, 120, 1876, NULL, '35.0992950117855', '129.03130624908704', '부산 중구 광복동2가 49', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13785, 851, '출발지', 19, 120, 1910, NULL, '35.11095558572676', '129.03885570043667', '부산 중구 중앙동4가 75-1', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13786, 852, '출발지', 18, 58, 801, NULL, '37.08161163330078', '127.05020141601563', '경기 평택시 신장동 306-204', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13787, 853, '출발지', 40, 32, 675, NULL, '37.617454528808594', '127.07463836669922', '서울 노원구 공릉동 678-1', '2016-09-02 22:32:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13788, 854, '출발지', 40, 10, 377, NULL, '37.464249955852544', '126.98908526770666', '서울 서초구 방배동 2911-2', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13789, 855, '출발지', 29, 63, 982, NULL, '35.95864486694336', '126.98165130615234', '전북 익산시 어양동 663', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13790, 856, '출발지', 29, 63, 989, NULL, '35.95271301269531', '126.99420928955078', '전북 익산시 용제동 산 93-1', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13791, 857, '출발지', 28, 237, 4396, 16273, '34.881710052490234', '128.41900634765625', '경남 통영시 광도면 죽림리 1574-6', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13792, 858, '출발지', 22, 141, 2347, NULL, '35.89262008666992', '128.57266235351563', '대구 북구 노원동2가 155-2', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13793, 859, '출발지', 18, 85, 1352, NULL, '37.2662840786853', '127.00024802619322', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13794, 860, '출발지', 40, 36, 716, NULL, '37.55519907036358', '126.93698075917935', '서울 서대문구 창천동 30-16', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13795, 861, '출발지', 40, 13, 441, NULL, '37.54602683513996', '126.87388645522653', '서울 양천구 목동 526', '2016-09-02 22:32:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13796, 862, '출발지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13797, 863, '출발지', 18, 79, 1273, NULL, '37.394776627382875', '127.11119669891646', '경기 성남시 분당구 백현동 산 4-14', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13798, 864, '출발지', 18, 105, 1700, NULL, '37.20219344371979', '127.07319142089601', '경기 화성시 반송동 92-7', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13799, 865, '출발지', 26, 65, 1058, 6200, '36.81010437011719', '127.05069732666016', '충남 아산시 탕정면 명암리 1216', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13800, 866, '출발지', 40, 5, 316, NULL, '37.504302978515625', '126.85675048828125', '서울 구로구 고척동 306', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13801, 867, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13802, 868, '출발지', 40, 10, 376, NULL, '37.50607506279143', '127.00698950489821', '서울 서초구 반포동 19-4', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13803, 869, '출발지', 18, 74, 1218, NULL, '37.41645134181114', '126.88480397548885', '경기 광명시 일직동 276-8', '2016-09-02 22:32:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13804, 870, '출발지', 18, 82, 1313, NULL, '37.23912296516388', '127.02940534836488', '경기 수원시 권선구 곡반정동 558-6', '2016-09-02 22:32:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13805, 871, '출발지', 18, 102, 1643, NULL, '37.27742061817926', '127.44693565240527', '경기 이천시 중리동 219-1', '2016-09-02 22:32:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13806, 872, '출발지', 40, 10, 378, NULL, '37.49389999914138', '127.01438382978127', '서울 서초구 서초동 1748-4', '2016-09-02 22:32:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13807, 873, '출발지', 40, 17, 623, NULL, '37.555190606633865', '126.97061124330898', '서울 중구 봉래동2가 122-21', '2016-09-02 22:32:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13808, 874, '출발지', 40, 10, 376, NULL, '37.504748916616876', '127.00415743778919', '서울 서초구 반포동 19-3', '2016-09-02 22:32:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13809, 875, '출발지', 20, 131, 2057, NULL, '37.444786849824915', '126.4535707157013', '인천 중구 운서동 2851', '2016-09-02 22:32:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13810, 876, '출발지', 27, 60, 871, NULL, '36.14262008666992', '128.39402770996094', '경북 구미시 거의동 468', '2016-09-02 22:32:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13811, 877, '출발지', 40, 8, 345, NULL, '37.550820791853425', '126.92557727845312', '서울 마포구 상수동 72-1', '2016-09-02 22:32:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13812, 878, '출발지', 20, 131, 2057, NULL, '37.444786849824915', '126.4535707157013', '인천 중구 운서동 2851', '2016-09-02 22:32:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13813, 879, '출발지', 28, 236, 4368, NULL, '35.162229783817736', '128.66041426163136', '경남 창원시 진해구 여좌동 930', '2016-09-02 22:32:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13814, 880, '출발지', 28, 236, 4337, NULL, '35.1160888671875', '128.77859497070313', '경남 창원시 진해구 남양동 442', '2016-09-02 22:32:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13815, 881, '출발지', 40, 32, 675, NULL, '37.61984155281208', '127.08354407564008', '서울 노원구 공릉동 59', '2016-09-02 22:32:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13816, 882, '출발지', 40, 8, 347, NULL, '37.55186080932617', '126.91336059570313', '서울 마포구 서교동 491', '2016-09-02 22:32:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13817, 883, '출발지', 40, 8, 347, NULL, '37.551902770996094', '126.91336822509766', '서울 마포구 서교동 491', '2016-09-02 22:32:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13818, 884, '출발지', 22, 138, 2269, NULL, '35.83099365234375', '128.5518035888672', '대구 달서구 송현동 950', '2016-09-02 22:32:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13819, 885, '출발지', 22, 141, 2363, NULL, '35.876327830190355', '128.59704657830102', '대구 북구 칠성동2가 302-239', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13820, 886, '출발지', 20, 125, 1973, NULL, '37.45800476155641', '126.72781924914231', '인천 남동구 만수동 876', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13821, 887, '출발지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13822, 888, '출발지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13823, 889, '출발지', 22, 138, 2269, NULL, '35.83095932006836', '128.55165100097656', '대구 달서구 송현동 950', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13824, 890, '출발지', 40, 9, 366, NULL, '37.514760551955455', '127.12755851371446', '서울 송파구 방이동 88-2', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13825, 891, '출발지', 40, 4, 308, NULL, '37.5542106628418', '127.09403991699219', '서울 광진구 구의동 27-10', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13826, 892, '출발지', 26, 195, 3465, NULL, '36.79593292489594', '127.12710954618505', '충남 천안시 서북구 쌍용동 191', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13827, 893, '출발지', 18, 87, 1398, NULL, '37.31350326538086', '126.8348617553711', '경기 안산시 단원구 고잔동 728', '2016-09-02 22:32:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13828, 894, '출발지', 19, 107, 1758, NULL, '35.289907', '129.0921448', '부산 금정구 노포동 산 77-4', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13829, 895, '출발지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13830, 896, '출발지', 19, 107, 1758, NULL, '35.28384380936477', '129.09502424557996', '부산 금정구 노포동 133', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13831, 897, '출발지', 20, 131, 2057, NULL, '37.44546565631065', '126.45384151381211', '인천 중구 운서동 2851', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13832, 898, '출발지', 24, 162, 2873, NULL, '37.884512737384014', '127.71669859334538', '강원 춘천시 근화동 558', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13833, 899, '출발지', 24, 162, 2886, NULL, '37.87034606933594', '127.75651550292969', '강원 춘천시 석사동 783', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13834, 900, '출발지', 24, 165, 2944, 8669, '37.68897139031863', '127.87870476505354', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13835, 901, '출발지', 18, 105, 1709, NULL, '37.21473527693057', '127.07998581130902', '경기 화성시 석우동 44', '2016-09-02 22:32:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13836, 902, '출발지', 40, 9, 368, NULL, '37.50654983520508', '127.10001373291016', '서울 송파구 석촌동 24-13', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13837, 903, '출발지', 40, 4, 313, NULL, '37.53999311990314', '127.07061917119614', '서울 광진구 화양동 6-3', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13838, 904, '출발지', 19, 121, 1922, NULL, '35.169273376464844', '129.17507934570313', '부산 해운대구 좌동 1459-2', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13839, 905, '출발지', 18, 100, 1601, NULL, '37.383514404296875', '126.97639465332031', '경기 의왕시 내손동 845', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13840, 906, '출발지', 18, 83, 1331, NULL, '37.25153732299805', '127.0713882446289', '경기 수원시 영통구 영통동 1055', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13841, 907, '출발지', 22, 140, 2309, NULL, '35.88357162475586', '128.65965270996094', '대구 동구 방촌동 1006-24', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13842, 908, '출발지', 26, 195, 3456, NULL, '36.833560943603516', '127.13713073730469', '충남 천안시 서북구 두정동 944', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13843, 909, '출발지', 40, 12, 436, NULL, '37.58641815185547', '127.02869415283203', '서울 성북구 안암동5가 126-78', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13844, 910, '출발지', 40, 9, 368, NULL, '37.50273132324219', '127.10897827148438', '서울 송파구 석촌동 295', '2016-09-02 22:32:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13845, 911, '출발지', 30, 261, NULL, NULL, '35.02705383300781', '126.77899932861328', '전남 나주시 빛가람동 135', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13846, 912, '출발지', 28, 235, 4325, NULL, '35.22893142700195', '128.6785430908203', '경남 창원시 의창구 용호동 70', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13847, 913, '출발지', 18, 51, 750, NULL, '37.48530578613281', '126.8118896484375', '경기 부천시 역곡동 382', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13848, 914, '출발지', 23, 145, 2522, NULL, '35.21562957763672', '126.84432220458984', '광주 광산구 월계동 888-5', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13849, 915, '출발지', 25, 180, 3140, 10265, '36.740509033203125', '127.45198822021484', '충북 청주시 청원구 오창읍 장대리 353-6', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13850, 916, '출발지', 23, 149, 2644, NULL, '35.16020202636719', '126.87922668457031', '광주 서구 광천동 49-1', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13851, 917, '출발지', 18, 92, 1487, NULL, '37.84312057495117', '127.06175231933594', '경기 양주시 덕정동 350-14', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13852, 918, '출발지', 40, 16, 573, NULL, '37.575721740722656', '126.9732437133789', '서울 종로구 적선동 81-1', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13853, 919, '출발지', 18, 97, 1566, NULL, '37.26630783081055', '127.10503387451172', '경기 용인시 기흥구 상갈동 180-2', '2016-09-02 22:32:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13854, 920, '출발지', 18, 89, 1451, 6507, '36.927833557128906', '127.22671508789063', '경기 안성시 서운면 송정리 산 3', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13855, 921, '출발지', 24, 158, 2823, NULL, '37.34494400024414', '127.93048858642578', '강원 원주시 단계동 877-1', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13856, 922, '출발지', 24, 158, 2823, NULL, '37.344871520996094', '127.9306411743164', '강원 원주시 단계동 877-1', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13857, 923, '출발지', 24, 158, 2823, NULL, '37.34428405761719', '127.92997741699219', '강원 원주시 단계동 1012', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13858, 924, '출발지', 22, 143, 2382, NULL, '35.863983154296875', '128.64895629882813', '대구 수성구 만촌동 994-30', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13859, 925, '출발지', 18, 105, NULL, NULL, '37.19924545288086', '126.83160400390625', '경기 화성시 남양읍 남양리 2000', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13860, 926, '출발지', 18, 99, 1584, NULL, '37.233154296875', '127.20912170410156', '경기 용인시 처인구 김량장동 68-3', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13861, 927, '출발지', 20, 129, 2014, NULL, '37.40468215942383', '126.65525817871094', '인천 연수구 동춘동 911-6', '2016-09-02 22:33:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13862, 928, '출발지', 20, 125, 1969, NULL, '37.446651458740234', '126.69668579101563', '인천 남동구 구월동 1378-2', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13863, 929, '출발지', 19, 114, 1812, NULL, '35.12772750854492', '128.96421813964844', '부산 사상구 엄궁동 650', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13864, 930, '출발지', 18, 88, 1416, NULL, '37.282718658447266', '126.85269165039063', '경기 안산시 상록구 사동 1405-11', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13865, 931, '출발지', 20, 123, 1937, NULL, '37.577842712402344', '126.72628784179688', '인천 계양구 갈현동 산 60-1', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13866, 932, '출발지', 20, 125, 1971, NULL, '37.400733947753906', '126.73341369628906', '인천 남동구 논현동 750-1', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13867, 933, '출발지', 19, 114, 1813, NULL, '35.15062713623047', '129.0020751953125', '부산 사상구 주례동 439-21', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13868, 934, '출발지', 23, 148, 2621, NULL, '35.20322799682617', '126.85907745361328', '광주 북구 연제동 1032', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13869, 935, '출발지', 18, NULL, NULL, NULL, '37.29475402832031', '127.63521575927734', '경기 여주시 창동 150-11', '2016-09-02 22:33:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13870, 936, '출발지', 18, 76, 1229, NULL, '37.35382080078125', '126.9486312866211', '경기 군포시 당동 134-1', '2016-09-02 22:33:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13871, 937, '출발지', 25, 181, 3162, NULL, '36.6490364074707', '127.46587371826172', '충북 청주시 흥덕구 봉명동 89-9', '2016-09-02 22:33:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13872, 938, '출발지', 18, 101, 1619, NULL, '37.73725509643555', '127.0869369506836', '경기 의정부시 용현동 7-1', '2016-09-02 22:33:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13873, 939, '출발지', 25, 181, 3162, NULL, '36.64915466308594', '127.46625518798828', '충북 청주시 흥덕구 봉명동 89-9', '2016-09-02 22:33:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13874, 940, '출발지', 40, 3, 306, NULL, '37.4736213684082', '126.9352798461914', '서울 관악구 신림동 107-98', '2016-09-02 22:33:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13875, 941, '출발지', 40, 15, 502, NULL, '37.5346794128418', '126.99449157714844', '서울 용산구 이태원동 123-17', '2016-09-02 22:33:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13876, 942, '출발지', 26, 194, 3445, NULL, '36.81950378417969', '127.15953826904297', '충남 천안시 동남구 신부동 524', '2016-09-02 22:33:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13877, 943, '출발지', 19, 109, 1773, NULL, '35.13029479980469', '129.0980224609375', '부산 남구 대연동 865-3', '2016-09-02 22:33:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13878, 944, '출발지', 19, 109, 1773, NULL, '35.13032913208008', '129.09800720214844', '부산 남구 대연동 865-3', '2016-09-02 22:33:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13879, 945, '출발지', 18, 81, 1311, NULL, '37.42881774902344', '127.14020538330078', '경기 성남시 중원구 하대원동 270', '2016-09-02 22:33:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13880, 946, '출발지', 40, 35, 696, NULL, '37.557498931884766', '126.86119079589844', '서울 강서구 등촌동 666-41', '2016-09-02 22:33:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13881, 947, '출발지', 40, 16, 590, NULL, '37.56685256958008', '126.96662139892578', '서울 종로구 평동 218', '2016-09-02 22:33:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13882, 948, '출발지', 18, 91, 1478, NULL, '37.423973083496094', '126.90606689453125', '경기 안양시 만안구 석수동 산 123-3', '2016-09-02 22:33:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13883, 949, '출발지', 18, 91, 1479, NULL, '37.40167999267578', '126.92266082763672', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:33:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13884, 950, '출발지', 26, 190, 3375, NULL, '36.77864074707031', '126.45382690429688', '충남 서산시 동문동 975-16', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13885, 951, '출발지', 19, 109, 1773, NULL, '35.13031005859375', '129.09622192382813', '부산 남구 대연동 867-43', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13886, 952, '출발지', 28, 222, 4015, NULL, '34.898895263671875', '128.6159210205078', '경상남도 거제시 장평동 장평동', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13887, 953, '출발지', 18, 85, 1367, NULL, '37.28383255004883', '126.9896011352539', '경기 수원시 팔달구 화서동 464', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13888, 954, '출발지', 18, 84, 1337, NULL, '37.30104446411133', '127.03179168701172', '경기 수원시 장안구 연무동 4-25', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13889, 955, '출발지', 30, 265, 5026, 19071, '34.78366470336914', '127.15440368652344', '전남 보성군 득량면 삼정리 1076-1', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13890, 956, '출발지', 40, 1, 295, NULL, '37.49678039550781', '127.02827453613281', '서울 강남구 역삼동 858', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13891, 957, '출발지', 18, 72, 1201, NULL, '37.669551849365234', '126.76290893554688', '경기 고양시 일산서구 주엽동 166', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13892, 958, '출발지', 18, 64, 1020, 6025, '37.34394836425781', '127.2123031616211', '경기 광주시 오포읍 문형리 439-5', '2016-09-02 22:33:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13893, 959, '출발지', 18, 83, 1333, NULL, '37.29524612426758', '127.05303955078125', '경기 수원시 영통구 이의동 1379-5', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13894, 960, '출발지', 40, 7, 334, NULL, '37.492340087890625', '126.92423248291016', '서울 동작구 신대방동 395-71', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13895, 961, '출발지', 19, 107, 1754, NULL, '35.244293212890625', '129.08657836914063', '부산 금정구 구서동 474', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13896, 962, '출발지', 19, 107, 1760, NULL, '35.23859786987305', '129.08863830566406', '부산 금정구 부곡동 224-53', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13897, 963, '출발지', 18, 79, 1276, NULL, '37.38520431518555', '127.12325286865234', '경기 성남시 분당구 서현동 263', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13898, 964, '출발지', 18, 79, 1275, NULL, '37.40340805053711', '127.11814880371094', '경기 성남시 분당구 삼평동 718', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13899, 965, '출발지', 18, 74, 1215, NULL, '37.440425872802734', '126.85081481933594', '경기 광명시 노온사동 산 144-1', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13900, 966, '출발지', 18, 100, 1601, NULL, '37.384361267089844', '126.97498321533203', '경기 의왕시 내손동 844', '2016-09-02 22:33:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13901, 967, '출발지', 27, 221, 3993, 15074, '36.093936920166016', '129.41659545898438', '경북 포항시 북구 흥해읍 죽천리 산 13-22', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13902, 968, '출발지', 27, 221, 3993, 15074, '36.09387969970703', '129.41639709472656', '경북 포항시 북구 흥해읍 죽천리 산 13-22', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13903, 969, '출발지', 27, 221, 3993, 15074, '36.094425201416016', '129.416015625', '경북 포항시 북구 흥해읍 죽천리 산 13-18', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13904, 970, '출발지', 27, 221, 3993, 15074, '36.09447479248047', '129.41456604003906', '경북 포항시 북구 흥해읍 죽천리 산 13-9', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13905, 971, '출발지', 18, 90, 1473, NULL, '37.394256591796875', '126.9638442993164', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13906, 972, '출발지', 18, 72, 1195, NULL, '37.68888854980469', '126.72150421142578', '경기 고양시 일산서구 가좌동 1099', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13907, 973, '출발지', 40, 35, 703, NULL, '37.541725158691406', '126.84073638916016', '서울 강서구 화곡동 1089-54', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13908, 974, '출발지', 40, 10, 378, NULL, '37.4938850402832', '127.0160903930664', '서울 서초구 서초동 1674-3', '2016-09-02 22:33:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13909, 975, '출발지', 19, 112, 1798, NULL, '35.17259979248047', '129.06797790527344', '부산 부산진구 양정동 399-1', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13910, 976, '출발지', 18, 74, 1219, NULL, '37.476097106933594', '126.86824798583984', '경기 광명시 철산동 526', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13911, 977, '출발지', 40, 5, 316, NULL, '37.505943298339844', '126.85708618164063', '서울 구로구 고척동 217', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13912, 978, '출발지', 18, 70, 1173, NULL, '37.62033462524414', '126.82432556152344', '경기 고양시 덕양구 토당동 890-1', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13913, 979, '출발지', 40, 10, 378, NULL, '37.49868392944336', '127.02699279785156', '서울 서초구 서초동 1373', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13914, 980, '출발지', 18, 102, 1633, 7092, '37.24884033203125', '127.4936752319336', '경기 이천시 부발읍 아미리 1247', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13915, 981, '출발지', 18, 87, 1398, NULL, '37.31354904174805', '126.83463287353516', '경기 안산시 단원구 고잔동 728', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13916, 982, '출발지', 40, 14, 455, NULL, '37.51789093017578', '126.88927459716797', '서울 영등포구 문래동3가 77-31', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13917, 983, '출발지', 22, 139, 2286, 7629, '35.857295989990234', '128.46568298339844', '대구 달성군 다사읍 죽곡리 242-2', '2016-09-02 22:33:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13918, 984, '출발지', 22, 139, 2286, 7629, '35.85662841796875', '128.46664428710938', '대구 달성군 다사읍 죽곡리 242-2', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13919, 985, '출발지', 22, 139, 2286, 7620, '35.85683059692383', '128.4671173095703', '대구 달성군 다사읍 매곡리 1551-3', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13920, 986, '출발지', 28, 227, 4086, 15602, '35.067535400390625', '128.07553100585938', '경남 사천시 사남면 유천리 15-2', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13921, 987, '출발지', 40, 9, 372, NULL, '37.51322555541992', '127.10009765625', '서울 송파구 잠실동 39', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13922, 988, '출발지', 18, 85, 1367, NULL, '37.28578186035156', '126.98876953125', '경기 수원시 팔달구 화서동 464', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13923, 989, '출발지', 18, 71, 1192, NULL, '37.696109771728516', '126.78054809570313', '경기 고양시 일산동구 중산동 1605', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13924, 990, '출발지', 18, 71, 1192, NULL, '37.69630432128906', '126.78076934814453', '경기 고양시 일산동구 중산동 1555', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13925, 991, '출발지', 24, 150, 2707, NULL, '37.75400924682617', '128.8796844482422', '강원 강릉시 홍제동 992-3', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13926, 992, '출발지', 28, 230, 4143, NULL, '35.18367385864258', '128.07981872558594', '경남 진주시 망경동 638-1', '2016-09-02 22:33:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13927, 993, '출발지', 28, 230, 4160, NULL, '35.1924934387207', '128.06781005859375', '경남 진주시 이현동 34', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13928, 994, '출발지', 28, 230, 4151, NULL, '35.180233001708984', '128.12306213378906', '경남 진주시 상대동 33-77', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13929, 995, '출발지', 18, 51, 756, NULL, '37.500484466552734', '126.7710952758789', '경기 부천시 중동 1178', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13930, 996, '출발지', 40, 14, 455, NULL, '37.51791763305664', '126.89508819580078', '서울 영등포구 문래동3가 55-3', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13931, 997, '출발지', 30, 271, 5136, 19904, '35.28367614746094', '126.78994750976563', '전남 장성군 장성읍 단광리 206-1', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13932, 998, '출발지', 30, 263, 4977, NULL, '34.81269073486328', '126.4174575805664', '전남 목포시 상동 220', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13933, 999, '출발지', 18, 87, 1406, NULL, '37.33559799194336', '126.75904083251953', '경기 안산시 단원구 신길동 224-24', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13934, 1000, '출발지', 18, 70, 1154, NULL, '37.71870040893555', '126.85127258300781', '경기 고양시 덕양구 내유동 444-22', '2016-09-02 22:33:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13935, 1001, '출발지', 18, 70, 1154, NULL, '37.71891403198242', '126.85200500488281', '경기 고양시 덕양구 내유동 444-29', '2016-09-02 22:33:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13936, 1002, '출발지', 40, 3, 305, NULL, '37.47475814819336', '126.96244049072266', '서울 관악구 봉천동 196-266', '2016-09-02 22:33:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13937, 1003, '출발지', 68, NULL, NULL, NULL, '36.61885070800781', '127.2904281616211', '세종특별자치시 조치원읍 신안리 321-48', '2016-09-02 22:33:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13938, 1004, '출발지', 68, NULL, NULL, NULL, '36.62104034423828', '127.28848266601563', '세종특별자치시 조치원읍 신안리 300', '2016-09-02 22:33:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13939, 1005, '출발지', 24, 165, 2944, 8669, '37.68931579589844', '127.87879943847656', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:33:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13940, 1006, '출발지', 24, 165, 2944, 8669, '37.688838958740234', '127.8786392211914', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:33:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13941, 1007, '출발지', 24, 165, 2944, 8669, '37.688907623291016', '127.87875366210938', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:33:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13942, 1008, '출발지', 24, 165, 2944, 8669, '37.68897247314453', '127.87873840332031', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:33:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13943, 1009, '출발지', 24, 165, 2944, 8669, '37.68896484375', '127.87895202636719', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:33:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13944, 1010, '출발지', 26, 65, 1034, 6079, '36.90339660644531', '127.05995178222656', '충남 아산시 둔포면 석곡리 24-5', '2016-09-02 22:33:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13945, 1011, '출발지', 29, 247, 4643, 17447, '35.7245979309082', '126.73444366455078', '전북 부안군 부안읍 서외리 542-2', '2016-09-02 22:33:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13946, 1012, '출발지', 24, 165, 2944, 8669, '37.68889617919922', '127.8786392211914', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:33:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13947, 1013, '출발지', 19, 109, 1773, NULL, '35.13026428222656', '129.0979766845703', '부산 남구 대연동 865-3', '2016-09-02 22:33:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13948, 1014, '출발지', 40, 1, 295, NULL, '37.49652862548828', '127.02830505371094', '서울 강남구 역삼동 858', '2016-09-02 22:33:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13949, 1015, '출발지', 39, 278, 5233, NULL, '35.53421401977539', '129.295166015625', '울산 남구 옥동 산 272-3', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13950, 1016, '출발지', 22, 141, 2343, NULL, '35.94757843017578', '128.58001708984375', '대구 북구 국우동 1126', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13951, 1017, '출발지', 40, 1, 293, NULL, '37.5267448425293', '127.03914642333984', '서울 강남구 신사동 668-33', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13952, 1018, '출발지', 21, 134, 2157, NULL, '36.313018798828125', '127.38008880615234', '대전 서구 도마동 503', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13953, 1019, '출발지', 21, 136, 2241, NULL, '36.30470275878906', '127.38668060302734', '대전 중구 산성동 776', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13954, 1020, '출발지', 18, 58, 796, NULL, '37.057029724121094', '127.05313873291016', '경기 평택시 서정동 427-53', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13955, 1021, '출발지', 27, 200, 3558, NULL, '35.837623596191406', '129.20899963378906', '경북 경주시 사정동 26', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13956, 1022, '출발지', 20, 124, 1960, NULL, '37.4416618347168', '126.70153045654297', '인천 남구 관교동 15', '2016-09-02 22:33:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13957, 1023, '출발지', 30, 273, 5155, 20165, '34.478633880615234', '126.26303100585938', '전남 진도군 진도읍 남동리 782-1', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13958, 1024, '출발지', 20, 128, 1997, NULL, '37.53217315673828', '126.64423370361328', '인천 서구 경서동 953-13', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13959, 1025, '출발지', 21, 136, 2254, NULL, '36.32078972979389', '127.38802938416653', '대전 중구 태평동 389-5', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13960, 1026, '출발지', 21, 136, 2254, NULL, '36.32078972979389', '127.38802938416653', '대전 중구 태평동 389-5', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13961, 1027, '출발지', 21, 136, 2254, NULL, '36.32078972979389', '127.38802938416653', '대전 중구 태평동 389-5', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13962, 1028, '출발지', 40, 35, 703, NULL, '37.54165079257094', '126.84045502633539', '서울 강서구 화곡동 1089-54', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13963, 1029, '출발지', 40, 3, 305, NULL, '37.470726013183594', '126.96746826171875', '서울 관악구 봉천동 180-109', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13964, 1030, '출발지', 40, 3, 305, NULL, '37.47123718261719', '126.96690368652344', '서울 관악구 봉천동 180-489', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13965, 1031, '출발지', 22, 137, 2256, NULL, '35.837182598797554', '128.55719085830248', '대구 남구 대명동 1288', '2016-09-02 22:33:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13966, 1032, '출발지', 18, 79, 1276, NULL, '37.38911056518555', '127.12247467041016', '경기 성남시 분당구 서현동 255-1', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13967, 1033, '출발지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13968, 1034, '출발지', 18, 88, 1422, NULL, '37.30976425205215', '126.85368865479438', '경기 안산시 상록구 이동 211-5', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13969, 1035, '출발지', 23, 149, 2655, NULL, '35.147961070645394', '126.85495739753698', '광주 서구 쌍촌동 869-9', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13970, 1036, '출발지', 23, 149, 2655, NULL, '35.147961070645394', '126.85495739753698', '광주 서구 쌍촌동 869-9', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13971, 1037, '출발지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13972, 1038, '출발지', 19, 111, 1786, NULL, '35.1965858824454', '129.0556082231107', '부산 동래구 사직동 1017', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13973, 1039, '출발지', 19, 112, 1793, NULL, '35.16093444824219', '129.03704833984375', '부산 부산진구 당감동 520-1', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13974, 1040, '출발지', 40, 15, 482, NULL, '37.55302870046419', '126.9726446200341', '서울 용산구 동자동 14-200', '2016-09-02 22:33:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13975, 1041, '출발지', 18, 85, 1367, NULL, '37.28468311436707', '126.99294983092354', '경기 수원시 팔달구 화서동 650', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13976, 1042, '출발지', 22, 142, 2369, NULL, '35.88106155395508', '128.5553436279297', '대구 서구 비산동 840-31', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13977, 1043, '출발지', 22, 138, 2264, NULL, '35.853086430369544', '128.56576385298862', '대구 달서구 두류동 산 192-1', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13978, 1044, '출발지', 18, 72, 1195, NULL, '37.68380104154321', '126.72177685527947', '경기 고양시 일산서구 가좌동 1105', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13979, 1045, '출발지', 27, 199, 3529, NULL, '35.83560621250246', '128.72837315812896', '경북 경산시 정평동 130', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13980, 1046, '출발지', 27, 199, 3529, NULL, '35.83560621250246', '128.72837315812896', '경북 경산시 정평동 130', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13981, 1047, '출발지', 22, 140, 2324, NULL, '35.87468672389023', '128.6178601266348', '대구 동구 신천동 741', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13982, 1048, '출발지', 29, 252, 4699, NULL, '35.84674878005919', '127.12942528419897', '전북 전주시 덕진구 덕진동1가 664-14', '2016-09-02 22:33:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13983, 1049, '출발지', 25, 181, 3151, NULL, '36.62675764702577', '127.43097722583185', '충북 청주시 흥덕구 가경동 1416', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13984, 1050, '출발지', 30, 259, 4879, NULL, '34.938819885253906', '127.69782257080078', '전남 광양시 중동 1310-2', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13985, 1051, '출발지', 40, 3, 306, NULL, '37.489402691671316', '126.92793591059656', '서울 관악구 신림동 1466-4', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13986, 1052, '출발지', 30, 270, 5126, 19796, '34.316510469112266', '126.7604975909342', '전남 완도군 완도읍 군내리 1255', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13987, 1053, '출발지', 19, 114, 1808, NULL, '35.16323947215814', '128.982525426422', '부산 사상구 괘법동 533-1', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13988, 1054, '출발지', 22, 141, 2363, NULL, '35.87594876570243', '128.59627719643754', '대구 북구 칠성동2가 302-155', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13989, 1055, '출발지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13990, 1056, '출발지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:33:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13991, 1057, '출발지', 18, 72, 1202, NULL, '37.69511930389754', '126.76223569858165', '경기 고양시 일산서구 탄현동 1640', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13992, 1058, '출발지', 18, 96, 1550, NULL, '37.14552801313333', '127.06681543178733', '경기 오산시 오산동 603-116', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13993, 1059, '출발지', 40, 10, 378, NULL, '37.492431640625', '127.02975463867188', '서울 서초구 서초동 1337-31', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13994, 1060, '출발지', 18, 86, 1395, NULL, '37.39262362955681', '126.8133253998362', '경기 시흥시 하상동 370', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13995, 1061, '출발지', 18, 62, 953, NULL, '37.65138718271052', '126.68308854217798', '경기 김포시 운양동 573-6', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13996, 1062, '출발지', 18, 70, 1173, NULL, '37.620516784572246', '126.82058188179572', '경기 고양시 덕양구 토당동 444-1', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13997, 1063, '출발지', 18, 81, 1307, NULL, '37.431034088134766', '127.12928771972656', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:33:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13998, 1064, '출발지', 25, 178, 3107, NULL, '36.61003970748824', '127.50447717913505', '충북 청주시 상당구 용암동 1595', '2016-09-02 22:33:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(13999, 1065, '출발지', 25, 179, 3125, NULL, '36.608487149794875', '127.48158486802832', '충북 청주시 서원구 분평동 233', '2016-09-02 22:33:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14000, 1066, '출발지', 28, 237, 4413, NULL, '34.83794984390212', '128.40012077252902', '경남 통영시 인평동 117-4', '2016-09-02 22:33:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14001, 1067, '출발지', 25, 178, 3078, NULL, '36.62823584057401', '127.5094389943143', '충북 청주시 상당구 금천동 317', '2016-09-02 22:33:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14002, 1068, '출발지', 28, 235, 4329, NULL, '35.24570155076541', '128.6929096839179', '경남 창원시 의창구 퇴촌동 169', '2016-09-02 22:33:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14003, 1069, '출발지', 31, 277, 5194, 20659, '33.20948814580358', '126.29035630088494', '제주특별자치도 서귀포시 대정읍 상모리 88-1', '2016-09-02 22:33:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14004, 1070, '출발지', 23, 149, 2658, NULL, '35.164390563964844', '126.8451919555664', '광주 서구 유촌동 602-4', '2016-09-02 22:33:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14005, 1071, '출발지', 22, 143, 2379, NULL, '35.82984898914295', '128.69016915108065', '대구 수성구 노변동 650', '2016-09-02 22:33:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14006, 1072, '출발지', 22, 143, 2379, NULL, '35.82987060993004', '128.69016960967943', '대구 수성구 노변동 650', '2016-09-02 22:33:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14007, 1073, '출발지', 40, 12, 440, NULL, '37.60246658325195', '127.042236328125', '서울 성북구 하월곡동 37-5', '2016-09-02 22:33:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14008, 1074, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:33:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14009, 1075, '출발지', 18, 88, 1414, NULL, '37.30285235924208', '126.8666056400078', '경기 안산시 상록구 본오동 1177', '2016-09-02 22:33:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14010, 1076, '출발지', 18, 104, 1680, NULL, '37.54712474425193', '127.22035557337068', '경기 하남시 신장동 60-1', '2016-09-02 22:33:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14011, 1077, '출발지', 40, 8, 348, NULL, '37.57281556954827', '126.89240149824839', '서울 마포구 성산동 산 53-7', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14012, 1078, '출발지', 27, 221, 3993, 15054, '36.1036654677773', '129.38812063589265', '경북 포항시 북구 흥해읍 남송리 78-1', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14013, 1079, '출발지', 18, 61, 921, 5733, '37.88950691035409', '126.74016689318039', '경기 파주시 문산읍 마정리 1325-1', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14014, 1080, '출발지', 40, 3, 305, NULL, '37.47709324099654', '126.96352390500131', '서울 관악구 봉천동 1693-39', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14015, 1081, '출발지', 19, 113, 1802, NULL, '35.20548094606641', '128.9971139604997', '부산 북구 구포동 1060-470', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14016, 1082, '출발지', 18, 98, 1581, NULL, '37.33268356323242', '127.10631561279297', '경기 용인시 수지구 죽전동 861-1', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14017, 1083, '출발지', 28, 234, 4287, NULL, '35.203800201416016', '128.62815856933594', '경남 창원시 성산구 신촌동 49', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14018, 1084, '출발지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:33:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14019, 1085, '출발지', 18, 61, 929, NULL, '37.725581968954074', '126.76715202126218', '경기 파주시 야당동 299-4', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14020, 1086, '출발지', 40, 9, 372, NULL, '37.51162635872962', '127.08631432791267', '서울 송파구 잠실동 21', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14021, 1087, '출발지', 31, 59, 825, 5540, '33.55646939405399', '126.79580505788765', '제주특별자치도 제주시 구좌읍 월정리 33-3', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14022, 1088, '출발지', 30, 266, 5044, NULL, '34.94576782765587', '127.50323613315005', '전남 순천시 덕암동 188-100', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14023, 1089, '출발지', 25, 181, 3178, NULL, '36.65705480449103', '127.4669985989176', '충북 청주시 흥덕구 신봉동 177', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14024, 1090, '출발지', 18, 86, 1389, NULL, '37.37679157552156', '126.78808313830667', '경기 시흥시 장곡동 340', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14025, 1091, '출발지', 39, 282, 5292, NULL, '35.574494478310015', '129.34577703572825', '울산 중구 서동 260-2', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14026, 1092, '출발지', 18, 105, 1701, NULL, '37.2315950028332', '127.05608682490673', '경기 화성시 반월동 868', '2016-09-02 22:33:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14027, 1093, '출발지', 39, 282, 5293, NULL, '35.55376493487039', '129.31942437661397', '울산 중구 성남동 219-59', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14028, 1094, '출발지', 18, 71, 1184, NULL, '37.64327521235525', '126.78975769935164', '경기 고양시 일산동구 백석동 1242', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14029, 1095, '출발지', 18, 71, 1184, NULL, '37.64327521235525', '126.78975769935164', '경기 고양시 일산동구 백석동 1242', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14030, 1096, '출발지', 40, 1, 292, NULL, '37.48756024879805', '127.10241053071529', '서울 강남구 수서동 719', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14031, 1097, '출발지', 27, 60, 898, 5684, '36.27818776702667', '128.24880974860562', '경북 구미시 옥성면 대원리 31-6', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14032, 1098, '출발지', 24, 150, 2686, 7716, '37.85199520715658', '128.80830106370055', '강원 강릉시 연곡면 송림리 430', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14033, 1099, '출발지', 40, 17, 623, NULL, '37.555190606633865', '126.97061124330898', '서울 중구 봉래동2가 122-21', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14034, 1100, '출발지', 40, 9, 371, NULL, '37.508695833819324', '127.12677909492812', '서울 송파구 오금동 17-7', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14035, 1101, '출발지', 27, 220, 3957, NULL, '36.01337230130159', '129.32302726338415', '경북 포항시 남구 지곡동 174', '2016-09-02 22:33:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14036, 1102, '출발지', 20, 126, 1979, NULL, '37.483259336926054', '126.62550884415194', '인천 동구 만석동 18-4', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14037, 1103, '출발지', 30, 67, 1116, NULL, '34.76377487182617', '127.68006134033203', '전남 여수시 신기동 6', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14038, 1104, '출발지', 22, 143, 2402, NULL, '35.839776774950515', '128.62425149623434', '대구 수성구 황금동 908', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14039, 1105, '출발지', 18, 99, 1584, NULL, '37.237911300345324', '127.20905264479066', '경기 용인시 처인구 김량장동 144-2', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14040, 1106, '출발지', 20, 127, 1988, NULL, '37.5070416849512', '126.72187321551391', '인천 부평구 부평동 879', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14041, 1107, '출발지', 21, 134, 2151, NULL, '36.33291424532744', '127.39077595584527', '대전 서구 가장동 18-1', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14042, 1108, '출발지', 26, 190, 3375, NULL, '36.7818502298669', '126.45855123509097', '충남 서산시 동문동 309-3', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14043, 1109, '출발지', 28, 66, 1068, 6213, '35.32542419433594', '129.0192108154297', '경남 양산시 물금읍 범어리 2383', '2016-09-02 22:33:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14044, 1110, '출발지', 18, 101, 1620, NULL, '37.73272124050446', '127.04888923496766', '경기 의정부시 의정부동 371', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14045, 1111, '출발지', 18, 70, 1150, NULL, '37.612124975171845', '126.83412064593116', '경기 고양시 덕양구 강매동 622-1', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14046, 1112, '출발지', 40, 10, 378, NULL, '37.50443649291992', '127.02449798583984', '서울 서초구 서초동 1373', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14047, 1113, '출발지', 30, 266, 5060, NULL, '34.93083190917969', '127.4957046508789', '전남 순천시 오천동 713-31', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14048, 1114, '출발지', 18, 99, 1584, NULL, '37.23290003222803', '127.20987721587498', '경기 용인시 처인구 김량장동 23-1', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14049, 1115, '출발지', 18, 70, 1171, NULL, '37.658421712325044', '126.83196416784395', '경기 고양시 덕양구 주교동 600', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14050, 1116, '출발지', 40, 12, 402, NULL, '37.603394782557096', '127.02505906491119', '서울 성북구 길음동 1276-2', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14051, 1117, '출발지', 26, 190, 3375, NULL, '36.7818502298669', '126.45855123509097', '충남 서산시 동문동 309-3', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14052, 1118, '출발지', 18, 51, 750, NULL, '37.485450744628906', '126.81232452392578', '경기 부천시 역곡동 382', '2016-09-02 22:33:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14053, 1119, '출발지', 18, 102, 1643, NULL, '37.27742061817926', '127.44693565240527', '경기 이천시 중리동 219-1', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14054, 1120, '출발지', 40, 8, 348, NULL, '37.56406021118164', '126.9033432006836', '서울 마포구 성산동 592-6', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14055, 1121, '출발지', 22, 142, 2376, NULL, '35.87162399291992', '128.5586395263672', '대구 서구 평리동 1230-9', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14056, 1122, '출발지', 18, 92, 1485, NULL, '37.77414216221653', '127.04472131969086', '경기 양주시 남방동 117-1', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14057, 1123, '출발지', 18, 92, 1485, NULL, '37.77414216221653', '127.04472131969086', '경기 양주시 남방동 117-1', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14058, 1124, '출발지', 30, 270, 5126, 19796, '34.316510469112266', '126.7604975909342', '전남 완도군 완도읍 군내리 1255', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14059, 1125, '출발지', 18, 83, 1333, NULL, '37.29085358287077', '127.050717543829', '경기 수원시 영통구 이의동 1332', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14060, 1126, '출발지', 18, 51, 735, NULL, '37.523948669433594', '126.8153076171875', '경기 부천시 고강동 338-12', '2016-09-02 22:33:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14061, 1127, '출발지', 40, 7, 335, NULL, '37.50695895518824', '126.96079045178726', '서울 동작구 흑석동 224-1', '2016-09-02 22:33:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14062, 1128, '출발지', 18, 90, 1473, NULL, '37.40149417095967', '126.9766798551872', '경기 안양시 동안구 관양동 1563', '2016-09-02 22:33:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14063, 1129, '출발지', 40, 10, 378, NULL, '37.48463821411133', '127.01775360107422', '서울 서초구 서초동 1445-3', '2016-09-02 22:33:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14064, 1130, '출발지', 40, 37, 725, NULL, '37.580940375145936', '127.08850455421192', '서울 중랑구 면목동 495', '2016-09-02 22:33:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14065, 1131, '출발지', 20, 124, 1960, NULL, '37.44177703574615', '126.70148087214662', '인천 남구 관교동 15', '2016-09-02 22:33:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14066, 1132, '출발지', 18, 71, 1183, NULL, '37.7039599180926', '126.8192424162269', '경기 고양시 일산동구 문봉동 232-16', '2016-09-02 22:33:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14067, 1133, '출발지', 22, 140, 2324, NULL, '35.87602233886719', '128.62718200683594', '대구 동구 신천동 327-1', '2016-09-02 22:33:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14068, 1134, '출발지', 19, 121, 1922, NULL, '35.175052642822266', '129.17086791992188', '부산 해운대구 좌동 1282', '2016-09-02 22:33:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14069, 1135, '출발지', 20, 124, 1962, NULL, '37.436251384774934', '126.68865775250502', '인천 남구 문학동 482', '2016-09-02 22:33:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14070, 1136, '출발지', 18, 81, 1306, NULL, '37.435420989990234', '127.17974853515625', '경기 성남시 중원구 상대원동 379', '2016-09-02 22:33:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14071, 1137, '출발지', 40, 9, 373, NULL, '37.48065183748587', '127.12777637674903', '서울 송파구 장지동 838-3', '2016-09-02 22:33:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14072, 1138, '출발지', 18, 70, 1164, NULL, '37.653110205851604', '126.84291844160651', '경기 고양시 덕양구 성사동 411-5', '2016-09-02 22:33:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14073, 1139, '출발지', 18, 70, 1164, NULL, '37.653110205851604', '126.84291844160651', '경기 고양시 덕양구 성사동 411-5', '2016-09-02 22:33:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14074, 1140, '출발지', 40, 36, 716, NULL, '37.55519907036358', '126.93698075917935', '서울 서대문구 창천동 30-16', '2016-09-02 22:33:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14075, 1141, '출발지', 18, 81, 1308, NULL, '37.4199249073357', '127.12651632305776', '경기 성남시 중원구 여수동 200', '2016-09-02 22:33:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14076, 1142, '출발지', 40, 12, 440, NULL, '37.60505119509541', '127.03099384004011', '서울 성북구 하월곡동 230', '2016-09-02 22:33:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14077, 1143, '출발지', 18, 77, NULL, NULL, '37.70262684878739', '127.12484979898062', '경기 남양주시 별내면 광전리 122-6', '2016-09-02 22:33:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14078, 1144, '출발지', 40, 12, 440, NULL, '37.60505119509541', '127.03099384004011', '서울 성북구 하월곡동 230', '2016-09-02 22:33:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14079, 1145, '출발지', 18, 77, NULL, NULL, '37.70262684878739', '127.12484979898062', '경기 남양주시 별내면 광전리 122-6', '2016-09-02 22:33:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14080, 1146, '출발지', 18, 80, 1297, NULL, '37.443870544433594', '127.14207458496094', '경기 성남시 수정구 신흥동 5512-1', '2016-09-02 22:33:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14081, 1147, '출발지', 40, 10, 380, NULL, '37.46713067562178', '127.03956855233378', '서울 서초구 양재동 232-4', '2016-09-02 22:33:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14082, 1148, '출발지', 40, 10, 380, NULL, '37.46713067562178', '127.03956855233378', '서울 서초구 양재동 232-4', '2016-09-02 22:33:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14083, 1149, '출발지', 40, 9, 370, NULL, '37.51449486059582', '127.10452405014374', '서울 송파구 신천동 29-8', '2016-09-02 22:33:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14084, 1150, '출발지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:33:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14085, 1151, '출발지', 18, 97, 1560, NULL, '37.27580737911758', '127.13289110059462', '경기 용인시 기흥구 구갈동 111', '2016-09-02 22:33:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14086, 1152, '출발지', 40, 36, 716, NULL, '37.5566858864465', '126.94079124834315', '서울 서대문구 창천동 20-23', '2016-09-02 22:33:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14087, 1153, '출발지', 40, 17, 665, NULL, '37.566826005485716', '126.9786567859313', '서울 중구 태평로1가 31', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14088, 1154, '출발지', 40, 9, 372, NULL, '37.511184658245405', '127.0981221332625', '서울 송파구 잠실동 40-1', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14089, 1155, '출발지', 18, 77, 1238, NULL, '37.63602723465508', '127.21648030719112', '경기 남양주시 금곡동 185-10', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14090, 1156, '출발지', 22, 144, 2454, NULL, '35.87585492424066', '128.5938438463906', '대구 중구 태평로2가 1-1', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14091, 1157, '출발지', 22, 144, 2454, NULL, '35.87585492424066', '128.5938438463906', '대구 중구 태평로2가 1-1', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14092, 1158, '출발지', 40, 283, 5309, NULL, '37.528053283691406', '127.13478088378906', '서울 강동구 성내동 450-39', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14093, 1159, '출발지', 22, 141, 2340, NULL, '35.88210012483372', '128.587426985071', '대구 북구 고성동3가 2', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14094, 1160, '출발지', 22, 141, 2340, NULL, '35.88210012483372', '128.587426985071', '대구 북구 고성동3가 2', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14095, 1161, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:33:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14096, 1162, '출발지', 31, 277, 5192, NULL, '33.25565719604492', '126.48197937011719', '제주특별자치도 서귀포시 강정동 3962-3', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14097, 1163, '출발지', 20, 127, 1988, NULL, '37.48944904290551', '126.72433108861824', '인천 부평구 부평동 738-21', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14098, 1164, '출발지', 40, 16, NULL, NULL, '37.57757996540927', '126.97696919893002', '서울 종로구 세종로 1-91', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14099, 1165, '출발지', 18, 61, 921, 5734, '37.85819568964416', '126.78597606148665', '경기 파주시 문산읍 문산리 9-1', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14100, 1166, '출발지', 18, 71, 1190, NULL, '37.661481723229855', '126.76831798625773', '경기 고양시 일산동구 장항동 1479', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14101, 1167, '출발지', 40, 17, 660, NULL, '37.56096346718411', '126.98640008671087', '서울 중구 충무로2가 93-2', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14102, 1168, '출발지', 18, 51, 735, NULL, '37.52853775024414', '126.8226089477539', '경기 부천시 고강동 393-15', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14103, 1169, '출발지', 18, 75, 1222, NULL, '37.59435957776788', '127.12964638272388', '경기 구리시 교문동 390-1', '2016-09-02 22:33:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14104, 1170, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14105, 1171, '출발지', 19, 121, 1920, NULL, '35.161336750384486', '129.14799015218242', '부산 해운대구 우동 991-3', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14106, 1172, '출발지', 40, 16, 535, NULL, '37.58204391790862', '127.0019427455018', '서울 종로구 동숭동 67-2', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14107, 1173, '출발지', 40, 34, 681, NULL, '37.60980983870889', '126.90899680427647', '서울 은평구 구산동 182-45', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14108, 1174, '출발지', 40, 13, 443, NULL, '37.516988475267716', '126.86650140965972', '서울 양천구 신정동 321-4', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14109, 1175, '출발지', 30, 266, 5072, NULL, '34.97325936202112', '127.51961550642945', '전남 순천시 조례동 766', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14110, 1176, '출발지', 22, 138, 2279, NULL, '35.81103510956587', '128.52851728652834', '대구 달서구 진천동 253-9', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14111, 1177, '출발지', 30, 266, 5072, NULL, '34.97325936202112', '127.51961550642945', '전남 순천시 조례동 766', '2016-09-02 22:33:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14112, 1178, '출발지', 28, 56, NULL, NULL, '35.193035011090736', '128.8012799800938', '경남 김해시 대청동 300', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14113, 1179, '출발지', 40, 32, 676, NULL, '37.65634035132777', '127.06344913745482', '서울 노원구 상계동 335-4', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14114, 1180, '출발지', 18, 58, 821, 5514, '36.9846305847168', '126.8456802368164', '경기 평택시 포승읍 도곡리 1208-10', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14115, 1181, '출발지', 18, 90, 1476, NULL, '37.38978375404288', '126.95078326951835', '경기 안양시 동안구 호계동 1039-2', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14116, 1182, '출발지', 40, 1, 289, NULL, '37.48457591094836', '127.03416413339725', '서울 강남구 도곡동 958-2', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14117, 1183, '출발지', 18, 91, 1479, NULL, '37.384460419154614', '126.93559279166685', '경기 안양시 만안구 안양동 1163-1', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14118, 1184, '출발지', 18, 91, 1479, NULL, '37.384460419154614', '126.93559279166685', '경기 안양시 만안구 안양동 1163-1', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14119, 1185, '출발지', 18, 64, 1021, NULL, '37.407807024343604', '127.23546178587247', '경기 광주시 장지동 756', '2016-09-02 22:33:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14120, 1186, '출발지', 18, 64, 1010, NULL, '37.415287126989746', '127.25213577816041', '경기 광주시 경안동 120-1', '2016-09-02 22:33:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14121, 1187, '출발지', 24, 158, 2826, NULL, '37.34207281365522', '127.92009743096789', '강원 원주시 무실동 1', '2016-09-02 22:33:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14122, 1188, '출발지', 22, 143, 2395, NULL, '35.83702977317186', '128.71531001125027', '대구 수성구 신매동 8-2', '2016-09-02 22:33:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14123, 1189, '출발지', 26, 189, 3359, 11215, '36.28188705444336', '126.92549896240234', '충남 부여군 부여읍 쌍북리 113', '2016-09-02 22:33:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14124, 1190, '출발지', 30, 266, 5072, NULL, '34.97325936202112', '127.51961550642945', '전남 순천시 조례동 766', '2016-09-02 22:33:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14125, 1191, '출발지', 22, 143, 2393, NULL, '35.863561447203026', '128.6179793377118', '대구 수성구 수성동4가 1031', '2016-09-02 22:33:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14126, 1192, '출발지', 19, 113, 1806, NULL, '35.23579250465757', '129.01386233424984', '부산 북구 화명동 1458-17', '2016-09-02 22:33:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14127, 1193, '출발지', 26, 189, 3359, 11206, '36.279884338378906', '126.91030883789063', '충남 부여군 부여읍 구아리 324-2', '2016-09-02 22:33:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14128, 1194, '출발지', 40, 4, 308, NULL, '37.53841781616211', '127.09648132324219', '서울 광진구 구의동 611', '2016-09-02 22:33:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14129, 1195, '출발지', 19, 121, 1922, NULL, '35.16995583130151', '129.17702254504522', '부산 해운대구 좌동 1491', '2016-09-02 22:33:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14130, 1196, '출발지', 21, 135, 2209, NULL, '36.413650750528106', '127.3380196998474', '대전 유성구 신봉동 230-17', '2016-09-02 22:33:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14131, 1197, '출발지', 21, 135, 2224, NULL, '36.38410733913553', '127.31949777830208', '대전 유성구 지족동 836-6', '2016-09-02 22:33:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14132, 1198, '출발지', 22, 143, 2402, NULL, '35.84678338427256', '128.6277635372978', '대구 수성구 황금동 626', '2016-09-02 22:33:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14133, 1199, '출발지', 18, 83, 1332, NULL, '37.27620166556182', '127.05304848445547', '경기 수원시 영통구 원천동 80', '2016-09-02 22:33:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14134, 1200, '출발지', 18, 98, 1582, NULL, '37.32212249837715', '127.09769076505333', '경기 용인시 수지구 풍덕천동 720', '2016-09-02 22:33:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14135, 1201, '출발지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14136, 1202, '출발지', 18, 98, 1582, NULL, '37.32212249837715', '127.09769076505333', '경기 용인시 수지구 풍덕천동 720', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14137, 1203, '출발지', 20, 124, 1965, NULL, '37.46591559112053', '126.68704720170881', '인천 남구 주안동 20-1', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14138, 1204, '출발지', 20, 124, 1965, NULL, '37.46591559112053', '126.68704720170881', '인천 남구 주안동 20-1', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14139, 1205, '출발지', 23, 145, 2495, NULL, '35.1375617980957', '126.79083251953125', '광주 광산구 송정동 1003-1', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14140, 1206, '출발지', 23, 145, 2495, NULL, '35.13763516025067', '126.79086437039878', '광주 광산구 송정동 1003-1', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14141, 1207, '출발지', 22, 138, 2263, NULL, '35.80813942882033', '128.53115671999913', '대구 달서구 도원동 1428-3', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14142, 1208, '출발지', 20, 124, 1965, NULL, '37.46448516845703', '126.6937484741211', '인천 남구 주안동 294', '2016-09-02 22:33:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14143, 1209, '출발지', 19, 111, 1789, NULL, '35.220278910869006', '129.08636945909194', '부산 동래구 온천동 1750-1', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14144, 1210, '출발지', 19, 114, 1813, NULL, '35.15446853637695', '128.99562072753906', '부산 사상구 주례동 1010-3', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14145, 1211, '출발지', 28, 227, 4088, 15612, '35.08363723754883', '128.08616638183594', '경남 사천시 사천읍 수석리 259-9', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14146, 1212, '출발지', 18, 85, 1360, NULL, '37.26386421452187', '127.03465491410616', '경기 수원시 팔달구 인계동 1140', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14147, 1213, '출발지', 24, 164, 2928, 8489, '37.64602220716593', '128.68075653214953', '강원 평창군 대관령면 용산리 136', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14148, 1214, '출발지', 40, 32, 675, NULL, '37.618459513198964', '127.07540530057803', '서울 노원구 공릉동 678-1', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14149, 1215, '출발지', 30, 263, 4977, NULL, '34.80689171793696', '126.42496532702073', '전남 목포시 상동 860', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14150, 1216, '출발지', 30, 263, 4977, NULL, '34.80689171793696', '126.42496532702073', '전남 목포시 상동 860', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14151, 1217, '출발지', 40, 9, 363, NULL, '37.49333045007361', '127.14377384191096', '서울 송파구 거여동 20-14', '2016-09-02 22:33:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14152, 1218, '출발지', 40, 6, 324, NULL, '37.48225021362305', '126.8859634399414', '서울 금천구 가산동 60-7', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14153, 1219, '출발지', 24, 152, 2748, NULL, '37.532322549939785', '129.10585755367956', '강원 동해시 평릉동 191', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14154, 1220, '출발지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14155, 1221, '출발지', 28, 235, 4325, NULL, '35.2279398140385', '128.68183407564754', '경남 창원시 의창구 용호동 1', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14156, 1222, '출발지', 21, 135, 2185, NULL, '36.36286999054008', '127.34613427797699', '대전 유성구 궁동 220', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14157, 1223, '출발지', 40, 15, 501, NULL, '37.520484924316406', '126.9725112915039', '서울 용산구 이촌동 405-2', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14158, 1224, '출발지', 19, 121, 1917, NULL, '35.20272225217253', '129.11989788047327', '부산 해운대구 반여동 1206-39', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14159, 1225, '출발지', 40, 16, 594, NULL, '37.585910994801374', '127.00072913334674', '서울 종로구 혜화동 111-3', '2016-09-02 22:33:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14160, 1226, '출발지', 18, 74, 1220, NULL, '37.46925735473633', '126.86842346191406', '경기 광명시 하안동 864-2', '2016-09-02 22:33:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14161, 1227, '출발지', 19, 121, 1917, NULL, '35.201485099592524', '129.11911916211724', '부산 해운대구 반여동 1441-37', '2016-09-02 22:33:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14162, 1228, '출발지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:33:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14163, 1229, '출발지', 40, 13, 441, NULL, '37.55072808062136', '126.86557213923145', '서울 양천구 목동 605-22', '2016-09-02 22:33:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14164, 1230, '출발지', 28, 235, 4325, NULL, '35.2279398140385', '128.68183407564754', '경남 창원시 의창구 용호동 1', '2016-09-02 22:33:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14165, 1231, '출발지', 28, 235, 4325, NULL, '35.2279398140385', '128.68183407564754', '경남 창원시 의창구 용호동 1', '2016-09-02 22:33:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14166, 1232, '출발지', 40, 17, 637, NULL, '37.5649528503418', '126.98189544677734', '서울 중구 을지로1가 132-2', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14167, 1233, '출발지', 19, 111, 1789, NULL, '35.220278910869006', '129.08636945909194', '부산 동래구 온천동 1750-1', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14168, 1234, '출발지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14169, 1235, '출발지', 22, 138, 2275, NULL, '35.853458404541016', '128.50965881347656', '대구 달서구 이곡동 1253', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14170, 1236, '출발지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14171, 1237, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14172, 1238, '출발지', 18, 71, 1184, NULL, '37.643360614313615', '126.78914560407827', '경기 고양시 일산동구 백석동 1242', '2016-09-02 22:33:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14173, 1239, '출발지', 20, 127, 1987, NULL, '37.488477043182044', '126.74073008970379', '인천 부평구 부개동 468', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14174, 1240, '출발지', 40, 36, 723, NULL, '37.588795380608765', '126.94415800798484', '서울 서대문구 홍제동 161-1', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14175, 1241, '출발지', 18, 71, 1190, NULL, '37.66478604709861', '126.76625401494879', '경기 고양시 일산동구 장항동 730-1', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14176, 1242, '출발지', 40, 8, 360, NULL, '37.54991226059395', '126.91445632946227', '서울 마포구 합정동 420', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14177, 1243, '출발지', 18, 71, 1190, NULL, '37.661481723229855', '126.76831798625773', '경기 고양시 일산동구 장항동 1479', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14178, 1244, '출발지', 30, 270, 5126, 19796, '34.316510469112266', '126.7604975909342', '전남 완도군 완도읍 군내리 1255', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14179, 1245, '출발지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:33:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14180, 1246, '출발지', 29, 252, 4712, NULL, '35.821665424888394', '127.17712798876305', '전북 전주시 덕진구 우아동1가 1067', '2016-09-02 22:33:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14181, 1247, '출발지', 29, 252, 4712, NULL, '35.821665424888394', '127.17712798876305', '전북 전주시 덕진구 우아동1가 1067', '2016-09-02 22:33:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14182, 1248, '출발지', 40, 14, 468, NULL, '37.52151585688202', '126.92432132907928', '서울 영등포구 여의도동 3-6', '2016-09-02 22:33:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14183, 1249, '출발지', 30, 272, 5147, 20045, '34.68161206761634', '126.90705843110489', '전남 장흥군 장흥읍 건산리 715-11', '2016-09-02 22:33:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14184, 1250, '출발지', 40, 10, 378, NULL, '37.48519963352929', '127.01620028390957', '서울 서초구 서초동 1748-30', '2016-09-02 22:33:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14185, 1251, '출발지', 20, 129, 2016, NULL, '37.38789367675781', '126.66199493408203', '인천 연수구 송도동 3-47', '2016-09-02 22:33:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14186, 1252, '출발지', 40, 35, 691, NULL, '37.55795669555664', '126.86135864257813', '서울 강서구 가양동 449-19', '2016-09-02 22:33:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14187, 1253, '출발지', 23, 145, 2527, NULL, '35.19865798950195', '126.81812286376953', '광주 광산구 장덕동 1111', '2016-09-02 22:33:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14188, 1254, '출발지', 18, 97, 1560, NULL, '37.27742004394531', '127.13007354736328', '경기 용인시 기흥구 구갈동 609', '2016-09-02 22:33:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14189, 1255, '출발지', 40, 1, 288, NULL, '37.49097578417469', '127.05549770571403', '서울 강남구 대치동 600-7', '2016-09-02 22:33:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14190, 1256, '출발지', 18, 84, 1341, NULL, '37.29413986206055', '126.98973083496094', '경기 수원시 장안구 정자동 880-3', '2016-09-02 22:33:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14191, 1257, '출발지', 18, 97, 1560, NULL, '37.276222229003906', '127.12881469726563', '경기 용인시 기흥구 구갈동 609', '2016-09-02 22:33:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14192, 1258, '출발지', 28, 237, 4396, 16273, '34.87572901490357', '128.41353078605295', '경남 통영시 광도면 죽림리 384-11', '2016-09-02 22:33:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14193, 1259, '출발지', 40, 32, 676, NULL, '37.64370346069336', '127.05997467041016', '서울 노원구 상계동 712-20', '2016-09-02 22:33:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14194, 1260, '출발지', 22, 141, 2340, NULL, '35.88132365285674', '128.58617573733838', '대구 북구 고성동3가 2', '2016-09-02 22:33:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14195, 1261, '출발지', 18, 91, 1479, NULL, '37.399638690302076', '126.92023370540176', '경기 안양시 만안구 안양동 676-1', '2016-09-02 22:33:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14196, 1262, '출발지', 18, 91, 1479, NULL, '37.399638690302076', '126.92023370540176', '경기 안양시 만안구 안양동 676-1', '2016-09-02 22:33:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14197, 1263, '출발지', 28, 233, 4263, NULL, '35.236209189149875', '128.57717764054635', '경남 창원시 마산회원구 합성동 764-3', '2016-09-02 22:33:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14198, 1264, '출발지', 24, 158, 2845, 8228, '37.30313074459085', '127.91973102767078', '강원 원주시 흥업면 흥업리 590-2', '2016-09-02 22:33:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14199, 1265, '출발지', 40, 1, 289, NULL, '37.489546568827336', '127.0316606804403', '서울 강남구 도곡동 958-2', '2016-09-02 22:33:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14200, 1266, '출발지', 18, 91, 1479, NULL, '37.384460419154614', '126.93559279166685', '경기 안양시 만안구 안양동 1163-1', '2016-09-02 22:33:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14201, 1267, '출발지', 40, 17, 632, NULL, '37.546580510456096', '127.00703402265032', '서울 중구 신당동 844', '2016-09-02 22:33:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14202, 1268, '출발지', 40, 4, 310, NULL, '37.557149685320596', '127.0795128772072', '서울 광진구 능동 275-5', '2016-09-02 22:33:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14203, 1269, '출발지', 21, 133, 2148, NULL, '36.318233489990234', '127.44108581542969', '대전 동구 효동 135-1', '2016-09-02 22:33:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14204, 1270, '출발지', 29, 243, 4540, NULL, '35.98684310913086', '126.71232604980469', '전북 군산시 중앙로1가 25-1', '2016-09-02 22:33:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14205, 1271, '출발지', 40, 17, 623, NULL, '37.555190606633865', '126.97061124330898', '서울 중구 봉래동2가 122-21', '2016-09-02 22:33:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14206, 1272, '출발지', 24, 153, 2757, NULL, '37.44014690015752', '129.16903788969748', '강원 삼척시 남양동 341', '2016-09-02 22:33:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14207, 1273, '출발지', 24, 153, 2757, NULL, '37.44014690015752', '129.16903788969748', '강원 삼척시 남양동 341', '2016-09-02 22:33:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14208, 1274, '출발지', 22, 141, 2341, NULL, '35.93527536407159', '128.53527182707137', '대구 북구 관음동 산 120-1', '2016-09-02 22:33:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14209, 1275, '출발지', 22, 141, 2360, NULL, '35.945170914359046', '128.55172722475388', '대구 북구 읍내동 794', '2016-09-02 22:33:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14210, 1276, '출발지', 22, 141, 2360, NULL, '35.945170914359046', '128.55172722475388', '대구 북구 읍내동 794', '2016-09-02 22:33:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14211, 1277, '출발지', 28, 237, 4396, 16273, '34.87572901490357', '128.41353078605295', '경남 통영시 광도면 죽림리 384-11', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14212, 1278, '출발지', 18, 97, 1569, NULL, '37.28614836198466', '127.11128475010675', '경기 용인시 기흥구 신갈동 167', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14213, 1279, '출발지', 40, 34, 686, NULL, '37.59023972566066', '126.9082235268078', '서울 은평구 신사동 163-13', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14214, 1280, '출발지', 19, 109, 1773, NULL, '35.13846431972801', '129.0901678901298', '부산 남구 대연동 1463-1', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14215, 1281, '출발지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14216, 1282, '출발지', 28, 225, 4046, 15397, '34.71184539794922', '128.0461883544922', '경남 남해군 미조면 미조리 102-10', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14217, 1283, '출발지', 40, 15, 502, NULL, '37.534525205051125', '126.99433386191822', '서울 용산구 이태원동 119-23', '2016-09-02 22:33:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14218, 1284, '출발지', 20, 128, 1994, NULL, '37.53237602053362', '126.6643231309214', '인천 서구 가정동 71-122', '2016-09-02 22:34:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14219, 1285, '출발지', 40, 35, 692, NULL, '37.57789271523635', '126.79823296235084', '서울 강서구 개화동 664', '2016-09-02 22:34:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14220, 1286, '출발지', 18, 61, 934, 5755, '37.796214638087356', '126.79258587550426', '경기 파주시 월롱면 위전리 415-1', '2016-09-02 22:34:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14221, 1287, '출발지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:34:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14222, 1288, '출발지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:34:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14223, 1289, '출발지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:34:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14224, 1290, '출발지', 18, 51, 745, NULL, '37.483606192101895', '126.76393421646247', '경기 부천시 송내동 389-6', '2016-09-02 22:34:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14225, 1291, '출발지', 40, 10, 382, NULL, '37.46185872617907', '127.02306308039505', '서울 서초구 우면동 735', '2016-09-02 22:34:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14226, 1292, '출발지', 18, 80, 1297, NULL, '37.44900879821232', '127.14309678916733', '경기 성남시 수정구 신흥동 89', '2016-09-02 22:34:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14227, 1293, '출발지', 18, 102, 1633, 7092, '37.251955934757724', '127.48661480369933', '경기 이천시 부발읍 아미리 712-7', '2016-09-02 22:34:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14228, 1294, '출발지', 40, 36, 713, NULL, '37.56545542206431', '126.9295514835355', '서울 서대문구 연희동 193-1', '2016-09-02 22:34:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14229, 1295, '출발지', 40, 1, 289, NULL, '37.48457591094836', '127.03416413339725', '서울 강남구 도곡동 958-2', '2016-09-02 22:34:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14230, 1296, '출발지', 27, 60, 899, NULL, '36.12907799944851', '128.3347266332317', '경북 구미시 원평동 147-9', '2016-09-02 22:34:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14231, 1297, '출발지', 40, 5, 322, NULL, '37.48331785107084', '126.84436906470215', '서울 구로구 천왕동 산 9-3', '2016-09-02 22:34:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14232, 1298, '출발지', 40, 38, 733, NULL, '37.6531763536138', '127.04759956682808', '서울 도봉구 창동 135-1', '2016-09-02 22:34:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14233, 1299, '출발지', 30, 266, 5072, NULL, '34.97325936202112', '127.51961550642945', '전남 순천시 조례동 766', '2016-09-02 22:34:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14234, 1300, '출발지', 22, 138, 2267, NULL, '35.818926658974426', '128.5377635503462', '대구 달서구 상인동 204-4', '2016-09-02 22:34:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14235, 1301, '출발지', 26, 196, 3479, 12170, '36.44651996465428', '126.80272322925056', '충남 청양군 청양읍 읍내리 376-8', '2016-09-02 22:34:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14236, 1302, '출발지', 40, 35, 703, NULL, '37.53223067244712', '126.84644426406456', '서울 강서구 화곡동 662-5', '2016-09-02 22:34:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14237, 1303, '출발지', 18, 75, 1221, NULL, '37.63338771970752', '127.11482313660792', '경기 구리시 갈매동 502-18', '2016-09-02 22:34:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14238, 1304, '출발지', 18, 75, 1221, NULL, '37.634068925224426', '127.114760741021', '경기 구리시 갈매동 502-39', '2016-09-02 22:34:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14239, 1305, '출발지', 18, 75, 1221, NULL, '37.634068925224426', '127.114760741021', '경기 구리시 갈매동 502-39', '2016-09-02 22:34:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14240, 1306, '출발지', 18, 100, 1601, NULL, '37.37627841313619', '126.96991344829551', '경기 의왕시 내손동 799', '2016-09-02 22:34:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14241, 1307, '출발지', 26, 65, 1039, 6092, '36.77769650141727', '127.05278809064765', '충남 아산시 배방읍 구령리 579-1', '2016-09-02 22:34:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14242, 1308, '출발지', 25, 178, 3119, NULL, '36.63069491576521', '127.49903046709933', '충북 청주시 상당구 탑동 261', '2016-09-02 22:34:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14243, 1309, '출발지', 40, 7, 331, NULL, '37.47688293457031', '126.97734832763672', '서울 동작구 사당동 1046-11', '2016-09-02 22:34:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14244, 1310, '출발지', 28, 222, 4008, NULL, '34.866030530610594', '128.69214473392753', '경남 거제시 아주동 338', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14245, 1311, '출발지', 18, 79, 1273, NULL, '37.394776627382875', '127.11119669891646', '경기 성남시 분당구 백현동 산 4-14', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14246, 1312, '출발지', 23, 148, 2612, NULL, '35.180876858820206', '126.92414711115296', '광주 북구 문흥동 920', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14247, 1313, '출발지', 18, 51, 753, NULL, '37.49658864160561', '126.7870937216059', '경기 부천시 원미동 71', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14248, 1314, '출발지', 19, 114, 1808, NULL, '35.16323947215814', '128.982525426422', '부산 사상구 괘법동 533-1', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14249, 1315, '출발지', 24, 165, 2944, 8669, '37.68897139031863', '127.87870476505354', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14250, 1316, '출발지', 29, 253, 4776, NULL, '35.82643669749569', '127.10069847111647', '전북 전주시 완산구 효자동3가 436-2', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14251, 1317, '출발지', 29, 247, 4640, 17424, '35.7016361472384', '126.78817742225702', '전북 부안군 백산면 평교리 205', '2016-09-02 22:34:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14252, 1318, '출발지', 29, 247, 4643, 17446, '35.72702654456769', '126.73686877752536', '전북 부안군 부안읍 봉덕리 574-13', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14253, 1319, '출발지', 29, 247, 4640, 17424, '35.7016361472384', '126.78817742225702', '전북 부안군 백산면 평교리 205', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14254, 1320, '출발지', 24, 165, 2944, 8669, '37.68897139031863', '127.87870476505354', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14255, 1321, '출발지', 20, 129, 2017, NULL, '37.41236887824079', '126.6878891140885', '인천 연수구 연수동 647', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14256, 1322, '출발지', 18, 79, 1274, NULL, '37.37160693072703', '127.14663006338294', '경기 성남시 분당구 분당동 114', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14257, 1323, '출발지', 40, 32, 676, NULL, '37.6556014462199', '127.06363436198957', '서울 노원구 상계동 327-3', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14258, 1324, '출발지', 40, 3, 305, NULL, '37.47087189107584', '126.96108966266034', '서울 관악구 봉천동 228', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14259, 1325, '출발지', 18, 105, 1705, 7270, '37.22008935088448', '126.949541693523', '경기 화성시 봉담읍 상리 27-1', '2016-09-02 22:34:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14260, 1326, '출발지', 18, 80, 1302, NULL, '37.439789189736125', '127.12774754546503', '경기 성남시 수정구 태평동 6988-1', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14261, 1327, '출발지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14262, 1328, '출발지', 20, 125, 1977, NULL, '37.45778283719208', '126.76013184669524', '인천 남동구 장수동 산 78', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14263, 1329, '출발지', 40, 34, 681, NULL, '37.61124669069027', '126.91725834457428', '서울 은평구 구산동 1-21', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14264, 1330, '출발지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14265, 1331, '출발지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14266, 1332, '출발지', 40, 32, 676, NULL, '37.65634035132777', '127.06344913745482', '서울 노원구 상계동 335-4', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14267, 1333, '출발지', 40, 5, 317, NULL, '37.49330994444172', '126.89493103605085', '서울 구로구 구로동 1204', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14268, 1334, '출발지', 40, 284, 5315, NULL, '37.59627324166528', '127.06369251068966', '서울 동대문구 이문동 360-9', '2016-09-02 22:34:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14269, 1335, '출발지', 40, 284, 5316, NULL, '37.57235270309624', '127.07167756114302', '서울 동대문구 장안동 469-15', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14270, 1336, '출발지', 19, 114, 1813, NULL, '35.15391016269249', '129.0133559747122', '부산 사상구 주례동 10-4', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14271, 1337, '출발지', 19, 114, 1813, NULL, '35.15125604580608', '129.01211873083642', '부산 사상구 주례동 64-2', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14272, 1338, '출발지', 28, 235, 4325, NULL, '35.2279398140385', '128.68183407564754', '경남 창원시 의창구 용호동 1', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14273, 1339, '출발지', 28, 235, 4325, NULL, '35.2279398140385', '128.68183407564754', '경남 창원시 의창구 용호동 1', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14274, 1340, '출발지', 18, 102, 1645, NULL, '37.28896212827187', '127.45234028468832', '경기 이천시 증포동 152-2', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14275, 1341, '출발지', 20, 125, 1970, NULL, '37.42957305908203', '126.71405792236328', '인천 남동구 남촌동 556-20', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14276, 1342, '출발지', 18, 74, 1214, NULL, '37.480064392089844', '126.8521957397461', '경기 광명시 광명동 158-211', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14277, 1343, '출발지', 28, 222, 3997, NULL, '34.87920700529146', '128.73459932659935', '경남 거제시 능포동 401-4', '2016-09-02 22:34:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14278, 1344, '출발지', 21, 135, 2200, NULL, '36.353599635846855', '127.34581248385706', '대전 유성구 봉명동 547-6', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14279, 1345, '출발지', 28, 230, 4151, NULL, '35.18493763728067', '128.117602553641', '경남 진주시 상대동 330-12', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14280, 1346, '출발지', 18, 51, 745, NULL, '37.483606192101895', '126.76393421646247', '경기 부천시 송내동 389-6', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14281, 1347, '출발지', 18, 51, 747, NULL, '37.48398888429165', '126.78308174352948', '경기 부천시 심곡본동 316-2', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14282, 1348, '출발지', 18, 91, 1477, NULL, '37.40340923665859', '126.9064053309216', '경기 안양시 만안구 박달동 107', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14283, 1349, '출발지', 18, 91, 1478, NULL, '37.43004574264762', '126.90489434446532', '경기 안양시 만안구 석수동 388-16', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14284, 1350, '출발지', 40, 3, 306, NULL, '37.46741071010902', '126.94829979336212', '서울 관악구 신림동 145-6', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14285, 1351, '출발지', 18, 75, 1224, NULL, '37.59408050859705', '127.14927122599191', '경기 구리시 수택동 280-13', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14286, 1352, '출발지', 27, 220, 3957, NULL, '36.01573074777797', '129.32239560064002', '경북 포항시 남구 지곡동 151-2', '2016-09-02 22:34:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14287, 1353, '출발지', 18, 97, 1566, NULL, '37.263824462890625', '127.10484313964844', '경기 용인시 기흥구 상갈동 42-1', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14288, 1354, '출발지', 18, 101, 1616, NULL, '37.73884582519531', '127.09245300292969', '경기 의정부시 민락동 550-4', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14289, 1355, '출발지', 40, 38, 733, NULL, '37.646542341049', '127.03493164804483', '서울 도봉구 창동 651-3', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14290, 1356, '출발지', 18, 90, 1476, NULL, '37.372459411621094', '126.9483871459961', '경기 안양시 동안구 호계동 555-21', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14291, 1357, '출발지', 18, 97, 1566, NULL, '37.26657388579284', '127.1076978782952', '경기 용인시 기흥구 상갈동 472-1', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14292, 1358, '출발지', 40, 17, 623, NULL, '37.55598023963206', '126.97209125123605', '서울 중구 봉래동2가 122-12', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14293, 1359, '출발지', 18, 51, 756, NULL, '37.50295254026216', '126.7768972045779', '경기 부천시 중동 1242-1', '2016-09-02 22:34:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14294, 1360, '출발지', 26, 190, 3375, NULL, '36.7818502298669', '126.45855123509097', '충남 서산시 동문동 309-3', '2016-09-02 22:34:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14295, 1361, '출발지', 26, 190, 3375, NULL, '36.7818502298669', '126.45855123509097', '충남 서산시 동문동 309-3', '2016-09-02 22:34:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14296, 1362, '출발지', 28, 56, NULL, NULL, '35.193035011090736', '128.8012799800938', '경남 김해시 대청동 300', '2016-09-02 22:34:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14297, 1363, '출발지', 39, 281, 5281, 20775, '35.431053161621094', '129.30917358398438', '울산 울주군 온산읍 덕신리 535-20', '2016-09-02 22:34:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14298, 1364, '출발지', 18, 100, 1607, NULL, '37.39235648311212', '126.99774144575753', '경기 의왕시 청계동 975', '2016-09-02 22:34:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14299, 1365, '출발지', 18, 51, 745, NULL, '37.483606192101895', '126.76393421646247', '경기 부천시 송내동 389-6', '2016-09-02 22:34:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14300, 1366, '출발지', 29, 253, 4776, NULL, '35.814916390872554', '127.08982681032836', '전북 전주시 완산구 효자동3가 1203', '2016-09-02 22:34:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14301, 1367, '출발지', 40, 5, 320, NULL, '37.499298711231305', '126.83943691211556', '서울 구로구 오류동 338', '2016-09-02 22:34:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14302, 1368, '출발지', 40, 38, 732, NULL, '37.657415341066134', '127.03513619867074', '서울 도봉구 쌍문동 56', '2016-09-02 22:34:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14303, 1369, '출발지', 18, 75, 1226, NULL, '37.60327074050881', '127.14335098418687', '경기 구리시 인창동 244-2', '2016-09-02 22:34:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14304, 1370, '출발지', 40, 35, 703, NULL, '37.53240685166257', '126.86372693103046', '서울 강서구 화곡동 939-2', '2016-09-02 22:34:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14305, 1371, '출발지', 40, 37, 726, NULL, '37.61061938461967', '127.0777621879676', '서울 중랑구 묵동 189-5', '2016-09-02 22:34:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14306, 1372, '출발지', 18, 51, 746, NULL, '37.49169971958658', '126.77443394153673', '경기 부천시 심곡동 305-3', '2016-09-02 22:34:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14307, 1373, '출발지', 18, 97, 1571, NULL, '37.26951599121094', '127.09841918945313', '경기 용인시 기흥구 영덕동 1-16', '2016-09-02 22:34:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14308, 1374, '출발지', 40, 14, 477, NULL, '37.52667236328125', '126.90451049804688', '서울 영등포구 영등포동8가 92', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14309, 1375, '출발지', 40, 17, 632, NULL, '37.559452056884766', '127.01998901367188', '서울 중구 신당동 850', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14310, 1376, '출발지', 18, 64, 1017, NULL, '37.41815185546875', '127.26472473144531', '경기 광주시 송정동 35', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14311, 1377, '출발지', 24, 154, 2795, NULL, '38.19001388549805', '128.60227966308594', '강원 속초시 조양동 1450-4', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14312, 1378, '출발지', 18, 85, 1352, NULL, '37.26568218296588', '127.00004960484385', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14313, 1379, '출발지', 23, 145, 2519, NULL, '35.1537806043175', '126.81310205351191', '광주 광산구 우산동 1062-3', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14314, 1380, '출발지', 40, 4, 311, NULL, '37.533853236644845', '127.06835056740347', '서울 광진구 자양동 553-339', '2016-09-02 22:34:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14315, 1381, '출발지', 18, 87, 1407, NULL, '37.34150788390959', '126.8235093105428', '경기 안산시 단원구 와동 763-19', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14316, 1382, '출발지', 40, 1, 292, NULL, '37.49050314515798', '127.10006710608225', '서울 강남구 수서동 707', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14317, 1383, '출발지', 18, 51, 750, NULL, '37.491092681884766', '126.8119125366211', '경기 부천시 역곡동 411', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14318, 1384, '출발지', 40, 1, 288, NULL, '37.50447082519531', '127.0492935180664', '서울 강남구 대치동 1011', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14319, 1385, '출발지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14320, 1386, '출발지', 19, 111, 1789, NULL, '35.20684373722558', '129.06898966333804', '부산 동래구 온천동 1470', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14321, 1387, '출발지', 20, 127, 1990, NULL, '37.52191925048828', '126.74301147460938', '인천 부평구 삼산동 395-3', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14322, 1388, '출발지', 40, 32, 676, NULL, '37.6806640625', '127.05506896972656', '서울 노원구 상계동 1257-5', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14323, 1389, '출발지', 27, 60, 899, NULL, '36.12818145751953', '128.3310546875', '경북 구미시 원평동 1008-1', '2016-09-02 22:34:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14324, 1390, '출발지', 20, 128, 1995, NULL, '37.492637634277344', '126.68693542480469', '인천 서구 가좌동 43-12', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14325, 1391, '출발지', 18, 105, 1729, 7397, '37.13267135620117', '126.9214859008789', '경기 화성시 향남읍 행정리 569', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14326, 1392, '출발지', 18, 98, 1578, NULL, '37.297298431396484', '127.06904602050781', '경기 용인시 수지구 상현동 1043', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14327, 1393, '출발지', 18, 105, 1700, NULL, '37.19702244819027', '127.07722781097799', '경기 화성시 반송동 120-6', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14328, 1394, '출발지', 18, 99, 1597, 7028, '37.27361036822781', '127.22107123340504', '경기 용인시 처인구 포곡읍 둔전리 449', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14329, 1395, '출발지', 29, 249, 4668, 17687, '35.9152442163422', '127.0674052188685', '전북 완주군 삼례읍 후정리 21-1', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14330, 1396, '출발지', 27, 60, 899, NULL, '36.12815475463867', '128.33094787597656', '경북 구미시 원평동 1008-1', '2016-09-02 22:34:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14331, 1397, '출발지', 40, 13, 442, NULL, '37.51948928833008', '126.84334564208984', '서울 양천구 신월동 535-7', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14332, 1398, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14333, 1399, '출발지', 18, 82, 1320, NULL, '37.25395584106445', '127.01117706298828', '경기 수원시 권선구 세류동 1033-6', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14334, 1400, '출발지', 18, 83, 1332, NULL, '37.26841354370117', '127.06680297851563', '경기 수원시 영통구 원천동 288', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14335, 1401, '출발지', 18, 82, 1320, NULL, '37.25392150878906', '127.01119232177734', '경기 수원시 권선구 세류동 1033-6', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14336, 1402, '출발지', 18, 103, 1663, 7218, '37.957454808842904', '127.31748924944638', '경기 포천시 일동면 기산리 91-209', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14337, 1403, '출발지', 18, 86, 1391, NULL, '37.34166274982586', '126.75297221306276', '경기 시흥시 정왕동 1631', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14338, 1404, '출발지', 19, 121, 1920, NULL, '35.168479919433594', '129.13893127441406', '부산 해운대구 우동 1196-2', '2016-09-02 22:34:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14339, 1405, '출발지', 19, 121, 1920, NULL, '35.161336750384486', '129.14799015218242', '부산 해운대구 우동 991-3', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14340, 1406, '출발지', 28, 234, 4280, NULL, '35.22311205169639', '128.70021157243056', '경남 창원시 성산구 사파동 501-1', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14341, 1407, '출발지', 24, 154, 2795, NULL, '38.188846656071604', '128.60245242925495', '강원 속초시 조양동 1463-52', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14342, 1408, '출발지', 24, 154, 2795, NULL, '38.188846656071604', '128.60245242925495', '강원 속초시 조양동 1463-52', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14343, 1409, '출발지', 20, 127, 1988, NULL, '37.48575210571289', '126.7202377319336', '인천 부평구 부평동 675-19', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14344, 1410, '출발지', 18, 85, 1360, NULL, '37.27295768866483', '127.03409082616358', '경기 수원시 팔달구 인계동 345-1', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14345, 1411, '출발지', 19, 117, 1847, NULL, '35.157858583447', '129.11314541829142', '부산 수영구 광안동 205', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14346, 1412, '출발지', 22, 139, 2286, 7627, '35.874446868896484', '128.4785614013672', '대구 달성군 다사읍 세천리 1633', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14347, 1413, '출발지', 18, 78, 1265, NULL, '37.89234273217019', '127.05579763910349', '경기 동두천시 지행동 482', '2016-09-02 22:34:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14348, 1414, '출발지', 22, 138, 2267, NULL, '35.81080656099434', '128.54526275052154', '대구 달서구 상인동 1162', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14349, 1415, '출발지', 19, 110, 1781, NULL, '35.11454123811815', '129.0393442633158', '부산 동구 초량동 1206-1', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14350, 1416, '출발지', 19, 106, 1737, NULL, '35.172908782958984', '128.9473876953125', '부산 강서구 대저2동 2350-1', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14351, 1417, '출발지', 68, NULL, NULL, NULL, '36.601431718221704', '127.29649209390175', '세종특별자치시 조치원읍 원리 141-54', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14352, 1418, '출발지', 18, 86, 1387, NULL, '37.39062660677218', '126.73726866642235', '경기 시흥시 월곶동 1010-4', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14353, 1419, '출발지', 22, 140, 2324, NULL, '35.87236004134286', '128.6339642295441', '대구 동구 신천동 481-1', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14354, 1420, '출발지', 40, 6, 325, NULL, '37.46549664117578', '126.90220889807681', '서울 금천구 독산동 1081-17', '2016-09-02 22:34:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14355, 1421, '출발지', 40, 10, 378, NULL, '37.50425338745117', '127.02457427978516', '서울 서초구 서초동 1373', '2016-09-02 22:34:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14356, 1422, '출발지', 40, 4, 307, NULL, '37.54532241821289', '127.10392761230469', '서울 광진구 광장동 238', '2016-09-02 22:34:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14357, 1423, '출발지', 27, 200, 3577, NULL, '35.834370509908695', '129.22708810469297', '경북 경주시 인왕동 517', '2016-09-02 22:34:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14358, 1424, '출발지', 20, 123, 1942, NULL, '37.559264194502404', '126.75468216297456', '인천 계양구 동양동 575', '2016-09-02 22:34:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14359, 1425, '출발지', 20, 127, 1988, NULL, '37.49420960444457', '126.72418241857008', '인천 부평구 부평동 211-148', '2016-09-02 22:34:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14360, 1426, '출발지', 20, 127, 1988, NULL, '37.49420960444457', '126.72418241857008', '인천 부평구 부평동 211-148', '2016-09-02 22:34:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14361, 1427, '출발지', 21, 134, 2150, NULL, '36.302931433884595', '127.35331093392894', '대전 서구 가수원동 471', '2016-09-02 22:34:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14362, 1428, '출발지', 21, 134, 2159, NULL, '36.35992431640625', '127.37960052490234', '대전 서구 둔산동 1516', '2016-09-02 22:34:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14363, 1429, '출발지', 18, 77, 1240, NULL, '37.64894050186959', '127.11296151467441', '경기 남양주시 별내동 1047', '2016-09-02 22:34:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14364, 1430, '출발지', 21, 134, 2159, NULL, '36.35963439941406', '127.37950134277344', '대전 서구 둔산동 1516', '2016-09-02 22:34:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14365, 1431, '출발지', 40, 37, 728, NULL, '37.616302490234375', '127.10729217529297', '서울 중랑구 신내동 114-10', '2016-09-02 22:34:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14366, 1432, '출발지', 40, 10, 377, NULL, '37.49442264219592', '126.9861091040627', '서울 서초구 방배동 767-27', '2016-09-02 22:34:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14367, 1433, '출발지', 40, 10, 377, NULL, '37.49442264219592', '126.9861091040627', '서울 서초구 방배동 767-27', '2016-09-02 22:34:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14368, 1434, '출발지', 18, 99, 1597, 7028, '37.26721221736258', '127.21363872279483', '경기 용인시 처인구 포곡읍 둔전리 406-78', '2016-09-02 22:34:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14369, 1435, '출발지', 40, 5, 317, NULL, '37.49330994444172', '126.89493103605085', '서울 구로구 구로동 1204', '2016-09-02 22:34:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14370, 1436, '출발지', 18, 76, 1230, NULL, '37.348533630371094', '126.95506286621094', '경기 군포시 당정동 994-6', '2016-09-02 22:34:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14371, 1437, '출발지', 18, 79, 1279, NULL, '37.4120979309082', '127.12881469726563', '경기 성남시 분당구 야탑동 488-1', '2016-09-02 22:34:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14372, 1438, '출발지', 18, 51, 756, NULL, '37.50295254026216', '126.7768972045779', '경기 부천시 중동 1242-1', '2016-09-02 22:34:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14373, 1439, '출발지', 40, 7, 333, NULL, '37.504899062181444', '126.93907238135584', '서울 동작구 상도동 26-20', '2016-09-02 22:34:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14374, 1440, '출발지', 40, 7, 333, NULL, '37.504899062181444', '126.93907238135584', '서울 동작구 상도동 26-20', '2016-09-02 22:34:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14375, 1441, '출발지', 40, 7, 333, NULL, '37.504899062181444', '126.93907238135584', '서울 동작구 상도동 26-20', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14376, 1442, '출발지', 40, 7, 333, NULL, '37.504899062181444', '126.93907238135584', '서울 동작구 상도동 26-20', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14377, 1443, '출발지', 18, 77, 1245, 6374, '37.58689032920783', '127.20884271060858', '경기 남양주시 와부읍 덕소리 590-17', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14378, 1444, '출발지', 40, 7, 327, NULL, '37.513003438179986', '126.9370479253865', '서울 동작구 노량진동 27-2', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14379, 1445, '출발지', 31, 59, NULL, NULL, '33.49045287609284', '126.4311320656317', '제주특별자치도 제주시 외도1동 449-4', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14380, 1446, '출발지', 18, 82, 1315, NULL, '37.25108002142407', '127.01982909035733', '경기 수원시 권선구 권선동 1189', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14381, 1447, '출발지', 21, 134, 2152, NULL, '36.34648895263672', '127.3748779296875', '대전 서구 갈마동 1458', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14382, 1448, '출발지', 40, 13, 443, NULL, '37.52022312317206', '126.85288956764204', '서울 양천구 신정동 1092', '2016-09-02 22:34:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14383, 1449, '출발지', 18, 103, 1658, NULL, '37.89738715429774', '127.20370929098539', '경기 포천시 신읍동 42-11', '2016-09-02 22:34:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14384, 1450, '출발지', 28, 233, 4263, NULL, '35.23871280061304', '128.58311403328221', '경남 창원시 마산회원구 합성동 267', '2016-09-02 22:34:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14385, 1451, '출발지', 40, 5, 317, NULL, '37.49330994444172', '126.89493103605085', '서울 구로구 구로동 1204', '2016-09-02 22:34:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14386, 1452, '출발지', 18, 61, 940, 5801, '37.788174254448144', '126.69895306284312', '경기 파주시 탄현면 법흥리 1652-239', '2016-09-02 22:34:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14387, 1453, '출발지', 18, 79, 1278, NULL, '37.378468767404556', '127.11428884629078', '경기 성남시 분당구 수내동 14', '2016-09-02 22:34:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14388, 1454, '출발지', 18, 103, 1658, NULL, '37.89738715429774', '127.20370929098539', '경기 포천시 신읍동 42-11', '2016-09-02 22:34:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14389, 1455, '출발지', 23, 148, 2620, NULL, '35.21138451112641', '126.87473642727603', '광주 북구 양산동 240-1', '2016-09-02 22:34:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14390, 1456, '출발지', 23, 148, 2615, NULL, '35.20036145890434', '126.90051073798318', '광주 북구 삼각동 793-1', '2016-09-02 22:34:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14391, 1457, '출발지', 40, 5, 317, NULL, '37.484737396240234', '126.90135192871094', '서울 구로구 구로동 1119', '2016-09-02 22:34:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14392, 1458, '출발지', 40, 1, 295, NULL, '37.500674418599395', '127.03646946846997', '서울 강남구 역삼동 804', '2016-09-02 22:34:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14393, 1459, '출발지', 28, 222, 3995, NULL, '34.89100695657428', '128.62419656852768', '경남 거제시 고현동 979-1', '2016-09-02 22:34:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14394, 1460, '출발지', 18, 51, 750, NULL, '37.485314358615625', '126.81205932067193', '경기 부천시 역곡동 382', '2016-09-02 22:34:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14395, 1461, '출발지', 40, 1, 289, NULL, '37.48457591094836', '127.03416413339725', '서울 강남구 도곡동 958-2', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14396, 1462, '출발지', 40, 1, 289, NULL, '37.48457591094836', '127.03416413339725', '서울 강남구 도곡동 958-2', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14397, 1463, '출발지', 40, 13, 442, NULL, '37.52188578145726', '126.83472787369138', '서울 양천구 신월동 962-10', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14398, 1464, '출발지', 30, 270, 5126, 19796, '34.31857052786835', '126.74495481321776', '전남 완도군 완도읍 군내리 1230', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14399, 1465, '출발지', 39, 280, 5270, NULL, '35.62839653832955', '129.3562291202934', '울산 북구 호계동 284-12', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14400, 1466, '출발지', 39, 278, 5226, NULL, '35.53617858886719', '129.34991455078125', '울산 남구 삼산동 1653-6', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14401, 1467, '출발지', 39, 278, 5226, NULL, '35.54037857055664', '129.34864807128906', '울산 남구 삼산동 220-10', '2016-09-02 22:34:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14402, 1468, '출발지', 39, 280, 5270, NULL, '35.62839653832955', '129.3562291202934', '울산 북구 호계동 284-12', '2016-09-02 22:34:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14403, 1469, '출발지', 39, 280, 5270, NULL, '35.631241651110315', '129.35376095782482', '울산 북구 호계동 262-2', '2016-09-02 22:34:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14404, 1470, '출발지', 39, 280, 5270, NULL, '35.62839653832955', '129.3562291202934', '울산 북구 호계동 284-12', '2016-09-02 22:34:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14405, 1471, '출발지', 22, 141, 2351, NULL, '35.91715621948242', '128.60093688964844', '대구 북구 동변동 617-1', '2016-09-02 22:34:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14406, 1472, '출발지', 22, 141, 2351, NULL, '35.91657638549805', '128.60377502441406', '대구 북구 동변동 681', '2016-09-02 22:34:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14407, 1473, '출발지', 22, 141, 2351, NULL, '35.91766932352101', '128.60239282675485', '대구 북구 동변동 679', '2016-09-02 22:34:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14408, 1474, '출발지', 40, 35, 702, NULL, '37.54950996700396', '126.8220106090575', '서울 강서구 외발산동 425', '2016-09-02 22:34:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14409, 1475, '출발지', 24, 150, 2707, NULL, '37.75078198129206', '128.87613587018114', '강원 강릉시 홍제동 1001', '2016-09-02 22:34:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14410, 1476, '출발지', 18, 72, 1200, NULL, '37.67637252807617', '126.76876068115234', '경기 고양시 일산서구 일산동 1086', '2016-09-02 22:34:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14411, 1477, '출발지', 18, 71, 1190, NULL, '37.661481723229855', '126.76831798625773', '경기 고양시 일산동구 장항동 1479', '2016-09-02 22:34:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14412, 1478, '출발지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:34:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14413, 1479, '출발지', 18, 71, 1192, NULL, '37.693355560302734', '126.78070068359375', '경기 고양시 일산동구 중산동 1619', '2016-09-02 22:34:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14414, 1480, '출발지', 40, 5, 320, NULL, '37.49262734631082', '126.833991770026', '서울 구로구 오류동 91-1', '2016-09-02 22:34:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14415, 1481, '출발지', 18, 71, 1184, NULL, '37.64301300048828', '126.78805541992188', '경기 고양시 일산동구 백석동 1538', '2016-09-02 22:34:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14416, 1482, '출발지', 18, 51, 750, NULL, '37.485314358615625', '126.81205932067193', '경기 부천시 역곡동 382', '2016-09-02 22:34:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14417, 1483, '출발지', 18, 64, 1025, 6047, '37.42515563964844', '127.28213500976563', '경기 광주시 초월읍 지월리 747-18', '2016-09-02 22:34:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14418, 1484, '출발지', 18, 87, 1398, NULL, '37.3160120850251', '126.83849638923743', '경기 안산시 단원구 고잔동 167-378', '2016-09-02 22:34:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14419, 1485, '출발지', 20, 124, 1965, NULL, '37.46511459350586', '126.67984771728516', '인천 남구 주안동 125', '2016-09-02 22:34:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14420, 1486, '출발지', 40, 4, 308, NULL, '37.53511803859746', '127.09474110186275', '서울 광진구 구의동 546-6', '2016-09-02 22:34:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14421, 1487, '출발지', 40, 4, 308, NULL, '37.53511803859746', '127.09474110186275', '서울 광진구 구의동 546-6', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14422, 1488, '출발지', 22, 144, 2409, NULL, '35.87085365823157', '128.59397394452267', '대구 중구 남일동 143-1', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14423, 1489, '출발지', 40, 1, 287, NULL, '37.50946807861328', '127.0364990234375', '서울 강남구 논현동 231-6', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14424, 1490, '출발지', 20, 129, 2018, NULL, '37.42654116152506', '126.64247619171982', '인천 연수구 옥련동 194-28', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14425, 1491, '출발지', 40, 4, 308, NULL, '37.53511803859746', '127.09474110186275', '서울 광진구 구의동 546-6', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14426, 1492, '출발지', 18, 71, 1184, NULL, '37.64555499557227', '126.79298286754815', '경기 고양시 일산동구 백석동 1232', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14427, 1493, '출발지', 40, 37, 728, NULL, '37.61541398605814', '127.09100549442891', '서울 중랑구 신내동 650', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14428, 1494, '출발지', 30, 67, 1136, NULL, '34.766030076098474', '127.66352968935291', '전남 여수시 학동 43-2', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14429, 1495, '출발지', 20, 128, 2009, NULL, '37.53477096557617', '126.65184020996094', '인천 서구 연희동 797-1', '2016-09-02 22:34:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14430, 1496, '출발지', 19, 112, 1795, NULL, '35.15730667114258', '129.0496826171875', '부산 부산진구 범천동 1059-2', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14431, 1497, '출발지', 40, 283, 5311, NULL, '37.53942985153209', '127.12766841623964', '서울 강동구 천호동 411-4', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14432, 1498, '출발지', 40, 7, 331, NULL, '37.47707748413086', '126.9813232421875', '서울 동작구 사당동 1043-15', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14433, 1499, '출발지', 40, 7, 331, NULL, '37.4766960144043', '126.9814224243164', '서울 동작구 사당동 1112', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14434, 1500, '출발지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14435, 1501, '출발지', 18, 101, 1620, NULL, '37.738362492359904', '127.04595682676671', '경기 의정부시 의정부동 168-54', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14436, 1502, '출발지', 18, 71, 1192, NULL, '37.69329833984375', '126.78042602539063', '경기 고양시 일산동구 중산동 1614', '2016-09-02 22:34:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14437, 1503, '출발지', 28, 56, 783, 5406, '35.30275011106321', '128.73649210332275', '경남 김해시 진영읍 여래리 711-1', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14438, 1504, '출발지', 20, 125, 1969, NULL, '37.44865036010742', '126.70720672607422', '인천 남동구 구월동 1149-3', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14439, 1505, '출발지', 18, 79, 1278, NULL, '37.378468767404556', '127.11428884629078', '경기 성남시 분당구 수내동 14', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14440, 1506, '출발지', 40, 35, 691, NULL, '37.56333813337279', '126.85913414671592', '서울 강서구 가양동 1485', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14441, 1507, '출발지', 40, 35, 691, NULL, '37.56333813337279', '126.85913414671592', '서울 강서구 가양동 1485', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14442, 1508, '출발지', 19, 112, 1797, NULL, '35.15793906251196', '129.0593008835454', '부산 부산진구 부전동 573-1', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14443, 1509, '출발지', 18, 82, 1324, NULL, '37.273048400878906', '126.9710464477539', '경기 수원시 권선구 탑동 746-1', '2016-09-02 22:34:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14444, 1510, '출발지', 24, 160, 2855, 8282, '37.21208574070655', '128.82173074025715', '강원 정선군 사북읍 사북리 424', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14445, 1511, '출발지', 40, 8, 342, NULL, '37.55686569213867', '126.92371368408203', '서울 마포구 동교동 192-5', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14446, 1512, '출발지', 20, 123, 1939, NULL, '37.57176995117024', '126.7362759440596', '인천 계양구 귤현동 451-264', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14447, 1513, '출발지', 20, 123, 1939, NULL, '37.57176995117024', '126.7362759440596', '인천 계양구 귤현동 451-264', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14448, 1514, '출발지', 19, 121, 1920, NULL, '35.169171621214346', '129.1362561625503', '부산 해운대구 우동 1500', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14449, 1515, '출발지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14450, 1516, '출발지', 39, 280, 5263, NULL, '35.582746995767096', '129.36114667524288', '울산 북구 연암동 1004-1', '2016-09-02 22:34:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14451, 1517, '출발지', 28, 230, 4131, NULL, '35.15236274362956', '128.10523473124562', '경남 진주시 가좌동 996-12', '2016-09-02 22:34:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14452, 1518, '출발지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:34:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14453, 1519, '출발지', 19, 108, NULL, NULL, '35.32128883375568', '129.20558277921472', '부산 기장군 정관읍 달산리 939-1', '2016-09-02 22:34:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14454, 1520, '출발지', 40, 6, 326, NULL, '37.45474434524018', '126.90050497384404', '서울 금천구 시흥동 1000-48', '2016-09-02 22:34:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14455, 1521, '출발지', 18, 85, 1367, NULL, '37.27881935775828', '126.99935953528839', '경기 수원시 팔달구 화서동 184-90', '2016-09-02 22:34:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14456, 1522, '출발지', 18, 83, 1332, NULL, '37.273685455322266', '127.0495834350586', '경기 수원시 영통구 원천동 90-11', '2016-09-02 22:34:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14457, 1523, '출발지', 40, 36, 723, NULL, '37.59632056181034', '126.9526223794956', '서울 서대문구 홍제동 287-207', '2016-09-02 22:34:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14458, 1524, '출발지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:34:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14459, 1525, '출발지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:34:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14460, 1526, '출발지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:34:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14461, 1527, '출발지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:34:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14462, 1528, '출발지', 27, 221, 3989, NULL, '36.04964829933723', '129.3695029075259', '경북 포항시 북구 학산동 127-9', '2016-09-02 22:34:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14463, 1529, '출발지', 30, 263, 4977, NULL, '34.81274205617025', '126.41782064997933', '전남 목포시 상동 220', '2016-09-02 22:34:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14464, 1530, '출발지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:34:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14465, 1531, '출발지', 18, 82, 1322, NULL, '37.29905700683594', '126.95459747314453', '경기 수원시 권선구 입북동 129-3', '2016-09-02 22:34:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14466, 1532, '출발지', 39, 278, 5221, NULL, '35.53427818040993', '129.3288856115384', '울산 남구 달동 119-7', '2016-09-02 22:34:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14467, 1533, '출발지', 26, 65, 1049, NULL, '36.780544883769295', '127.00318147294173', '충남 아산시 온천동 56-9', '2016-09-02 22:34:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14468, 1534, '출발지', 20, 123, 1939, NULL, '37.57176995117024', '126.7362759440596', '인천 계양구 귤현동 451-264', '2016-09-02 22:34:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14469, 1535, '출발지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:34:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14470, 1536, '출발지', 40, 7, 335, NULL, '37.5057786193814', '126.96659075156063', '서울 동작구 흑석동 335-2', '2016-09-02 22:34:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14471, 1537, '출발지', 39, 278, 5230, NULL, '35.532213795402285', '129.30747611098664', '울산 남구 신정동 720-4', '2016-09-02 22:34:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14472, 1538, '출발지', 40, 10, 378, NULL, '37.484453425987155', '127.03398317173767', '서울 서초구 서초동 1375', '2016-09-02 22:34:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14473, 1539, '출발지', 30, 67, 1136, NULL, '34.766030076098474', '127.66352968935291', '전남 여수시 학동 43-2', '2016-09-02 22:34:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14474, 1540, '출발지', 29, 253, 4774, NULL, '35.79928004501928', '127.11648865770108', '전북 전주시 완산구 효자동1가 670', '2016-09-02 22:34:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14475, 1541, '출발지', 25, 174, 3031, NULL, '37.17317400677721', '128.21056352067316', '충북 제천시 모산동 241', '2016-09-02 22:34:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14476, 1542, '출발지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:34:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14477, 1543, '출발지', 26, 65, 1039, 6092, '36.777381896972656', '127.05345153808594', '충남 아산시 배방읍 구령리 148-6', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14478, 1544, '출발지', 22, 137, 2256, NULL, '35.854105165827015', '128.58018278577555', '대구 남구 대명동 2139-11', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14479, 1545, '출발지', 40, 283, 5311, NULL, '37.53942985153209', '127.12766841623964', '서울 강동구 천호동 411-4', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14480, 1546, '출발지', 40, 7, 332, NULL, '37.50287062510492', '126.94791797555355', '서울 동작구 상도1동 752-2', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14481, 1547, '출발지', 20, 125, 1968, NULL, '37.39774703979492', '126.68450164794922', '인천 남동구 고잔동 688-5', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14482, 1548, '출발지', 27, 220, 3961, 14968, '36.07698440551758', '129.56776428222656', '경북 포항시 남구 호미곶면 대보리 225-2', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14483, 1549, '출발지', 27, 220, 3943, NULL, '36.01576614379883', '129.3421173095703', '경북 포항시 남구 대잠동 978-9', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14484, 1550, '출발지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14485, 1551, '출발지', 40, 4, 310, NULL, '37.557149685320596', '127.0795128772072', '서울 광진구 능동 275-5', '2016-09-02 22:34:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14486, 1552, '출발지', 19, 109, 1773, NULL, '35.12950335312022', '129.09224670293352', '부산 남구 대연동 948-25', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14487, 1553, '출발지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14488, 1554, '출발지', 26, 198, 3498, 12378, '36.655517578125', '126.67363739013672', '충남 홍성군 홍북면 신경리 1971', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14489, 1555, '출발지', 40, 1, 288, NULL, '37.502852652816046', '127.05197344180716', '서울 강남구 대치동 900', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14490, 1556, '출발지', 24, 162, 2897, NULL, '37.87020370131089', '127.71112744350684', '강원 춘천시 온의동 78-27', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14491, 1557, '출발지', 21, 134, 2159, NULL, '36.35053889930785', '127.38483484675275', '대전 서구 둔산동 1420', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14492, 1558, '출발지', 18, 105, 1708, 7296, '37.17220919691373', '126.62402279490884', '경기 화성시 서신면 제부리 220-14', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14493, 1559, '출발지', 18, 90, 1474, NULL, '37.40137994845066', '126.93924664506541', '경기 안양시 동안구 비산동 425', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14494, 1560, '출발지', 40, 6, 324, NULL, '37.48039596609824', '126.882661758356', '서울 금천구 가산동 371-28', '2016-09-02 22:34:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14495, 1561, '출발지', 40, 1, 294, NULL, '37.528076171875', '127.04151916503906', '서울 강남구 압구정동 515', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14496, 1562, '출발지', 39, 278, 5226, NULL, '35.54023310922632', '129.34112723233335', '울산 남구 삼산동 1564-14', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14497, 1563, '출발지', 40, 38, 733, NULL, '37.653370644919505', '127.04838841056007', '서울 도봉구 창동 20', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14498, 1564, '출발지', 19, 109, 1772, NULL, '35.11618305691272', '129.0814299363276', '부산 남구 감만동 146-1', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14499, 1565, '출발지', 23, 148, 2633, NULL, '35.19814682006836', '126.88469696044922', '광주 북구 일곡동 685', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14500, 1566, '출발지', 40, 9, 372, NULL, '37.51132165580067', '127.09806802140692', '서울 송파구 잠실동 40-1', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14501, 1567, '출발지', 18, 76, 1235, NULL, '37.35815634380001', '126.93318617488264', '경기 군포시 산본동 1231', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14502, 1568, '출발지', 18, 51, 742, NULL, '37.50612016093973', '126.74806573141805', '경기 부천시 상동 21', '2016-09-02 22:34:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14503, 1569, '출발지', 24, 150, 2707, NULL, '37.75425338745117', '128.88027954101563', '강원 강릉시 홍제동 992-2', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14504, 1570, '출발지', 18, 105, 1727, NULL, '37.20676350957843', '127.03320938987461', '경기 화성시 진안동 824-1', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14505, 1571, '출발지', 40, 10, 380, NULL, '37.468121168084885', '127.04137773957265', '서울 서초구 양재동 328-8', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14506, 1572, '출발지', 18, 90, 1474, NULL, '37.403006821381446', '126.94999756988027', '경기 안양시 동안구 비산동 1032-14', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14507, 1573, '출발지', 26, 183, 3240, 10471, '36.28791046142578', '127.24356842041016', '충남 계룡시 엄사면 엄사리 575', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14508, 1574, '출발지', 40, 8, 360, NULL, '37.54919646842774', '126.91146962124319', '서울 마포구 합정동 471', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14509, 1575, '출발지', 20, 127, 1993, NULL, '37.50621032714844', '126.71910095214844', '인천 부평구 청천동 166', '2016-09-02 22:34:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14510, 7, '도착지', 40, 2, 301, NULL, '37.637979', '127.02562', '서울 강북구 번동 386-16', '2016-09-02 22:35:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14511, 8, '도착지', 18, 85, 1360, NULL, '37.264071', '127.027454', '경기 수원시 팔달구 인계동 1027-6', '2016-09-02 22:35:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14512, 9, '도착지', 40, 13, 443, NULL, '37.519911', '126.877056', '서울 양천구 신정동 1279', '2016-09-02 22:35:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14513, 10, '도착지', 40, 3, 305, NULL, '37.471248', '126.966620', '서울 관악구 봉천동 180-88', '2016-09-02 22:35:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14514, 11, '도착지', 40, 11, 400, NULL, '37.561982', '127.03726', '서울 성동구 행당동 168-13', '2016-09-02 22:35:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14515, 12, '도착지', 40, 9, 372, NULL, '37.512899', '127.082993', '서울 송파구 잠실동 19', '2016-09-02 22:35:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14516, 15, '도착지', 40, 16, 599, NULL, '37.571942', '127.004327', '서울 종로구 효제동 198', '2016-09-02 22:35:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14517, 16, '도착지', 40, 7, 327, NULL, '37.514072', '126.94167', '서울 동작구 노량진동 67-2', '2016-09-02 22:35:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14518, 17, '도착지', 40, 5, 317, NULL, '37.48525', '126.901472', '서울 구로구 구로동 810-3', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14519, 18, '도착지', 40, 7, 331, NULL, '37.476559', '126.981633', '서울 동작구 사당동 588-45', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14520, 19, '도착지', 40, 13, 441, NULL, '37.524553', '126.87505', '서울 양천구 목동 406-30', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14521, 21, '도착지', 40, 13, 441, NULL, '37.524553', '126.87505', '서울 양천구 목동 406-30', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14522, 22, '도착지', 18, 51, 750, NULL, '37.486753130987246', '126.81017518043518', '경기 부천시 역곡동 74-2', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14523, 23, '도착지', 18, 51, 750, NULL, '37.485127', '126.811523', '경기 부천시 역곡동 382', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14524, 24, '도착지', 40, 6, 326, NULL, '37.449286', '126.910466', '서울 금천구 시흥동 384-12', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14525, 25, '도착지', 18, 74, 1219, NULL, '37.478488', '126.864289', '경기 광명시 철산동 222-1', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14526, 38, '도착지', 40, 1, 294, NULL, '37.530595', '127.030688', '서울 강남구 압구정동 458', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14527, 39, '도착지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:35:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14528, 40, '도착지', 40, 13, 443, NULL, '37.516601', '126.863871', '서울 양천구 신정동 322-13', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14529, 41, '도착지', 40, 13, 443, NULL, '37.516601', '126.863871', '서울 양천구 신정동 322-13', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14530, 42, '도착지', 18, 76, 1228, NULL, '37.372213', '126.943407', '경기 군포시 금정동 613', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14531, 43, '도착지', 18, 90, 1473, NULL, '37.394253', '126.956821', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14532, 44, '도착지', 40, 7, 331, NULL, '37.476559', '126.981633', '서울 동작구 사당동 588-45', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14533, 45, '도착지', 40, 1, 286, NULL, '37.47587451119188', '127.04733107239008', '서울 강남구 개포동 1227-9', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14534, 46, '도착지', 40, 3, 305, NULL, '37.4704033', '126.967185', '서울 관악구 봉천동 180-325', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14535, 49, '도착지', 40, 10, 378, NULL, '37.49344505779553', '127.01225582510232', '서울 서초구 서초동 1716-8', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14536, 50, '도착지', 40, 14, 447, NULL, '37.52415345598502', '126.89620267599821', '서울 영등포구 당산동3가 337-1', '2016-09-02 22:35:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14537, 52, '도착지', 40, 1, 297, NULL, '37.49154514890236', '127.07361470907927', '서울 강남구 일원동 611-1', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14538, 53, '도착지', 40, 15, 488, NULL, '37.536183153735955', '126.9677060097456', '서울 용산구 신계동 48', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14539, 54, '도착지', 40, 7, 328, NULL, '37.50522782935791', '126.92294161766769', '서울 동작구 대방동 384-10', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14540, 55, '도착지', 40, 5, 317, NULL, '37.491502585282106', '126.89545769244432', '서울 구로구 구로동 125-83', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14541, 56, '도착지', 40, 8, 336, NULL, '37.54440585801365', '126.95051807910203', '서울 마포구 공덕동 467', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14542, 57, '도착지', 40, 15, 492, NULL, '37.54572730795828', '126.9843504577875', '서울 용산구 용산동2가 1-1485', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14543, 58, '도착지', 40, 1, 287, NULL, '37.5116125236213', '127.02246766537428', '서울 강남구 논현동 51-6', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14544, 59, '도착지', 40, 11, 396, NULL, '37.5405474410346', '127.01216731220484', '서울 성동구 옥수동 475', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14545, 60, '도착지', 40, 7, 334, NULL, '37.49119266819094', '126.91729959100485', '서울 동작구 신대방동 395', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14546, 61, '도착지', 18, 51, 734, NULL, '37.463608090886034', '126.80903255939482', '경기 부천시 계수동 12', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14547, 62, '도착지', 40, 14, 458, NULL, '37.519404748902836', '126.8834950402379', '서울 영등포구 문래동6가 43', '2016-09-02 22:35:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14548, 63, '도착지', 40, 5, 317, NULL, '37.485134794468415', '126.90097633749247', '서울 구로구 구로동 1118', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14549, 64, '도착지', 40, 1, 295, NULL, '37.498124926850906', '127.02792126685381', '서울 강남구 역삼동 804', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14550, 65, '도착지', 40, 10, 378, NULL, '37.497745345149724', '127.02714577317238', '서울 서초구 서초동 1377', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14551, 66, '도착지', 40, 6, 326, NULL, '37.449286', '126.910466', '서울 금천구 시흥동 384-12', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14552, 67, '도착지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14553, 68, '도착지', 18, 71, 1182, NULL, '37.659485', '126.773387', '경기 고양시 일산동구 마두동 1123', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14554, 69, '도착지', 18, 76, 1235, NULL, '37.358019', '126.932969', '경기 군포시 산본동 1231', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14555, 70, '도착지', 20, 127, 1993, NULL, '37.522897', '126.721135', '인천 부평구 청천동 437-10', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14556, 71, '도착지', 40, 6, 325, NULL, '37.47831361165123', '126.90257158130409', '서울 금천구 독산동 958-60', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14557, 72, '도착지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:35:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14558, 73, '도착지', 18, 75, 1226, NULL, '37.617688454790255', '127.14150175452231', '경기 구리시 인창동 30-7', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14559, 74, '도착지', 40, 12, 403, NULL, '37.598254', '127.02102', '서울 성북구 돈암동 48-84', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14560, 75, '도착지', 18, 72, 1201, NULL, '37.670138', '126.761232', '경기 고양시 일산서구 주엽동 166', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14561, 76, '도착지', 40, 17, 609, NULL, '37.55998', '126.98583', '서울 중구 남산동2가 9-6', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14562, 77, '도착지', 30, 261, NULL, NULL, '35.019089', '126.779556', '전남 나주시 빛가람동 4-1117', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14563, 78, '도착지', 40, 4, 310, NULL, '37.557157', '127.079489', '서울 광진구 능동 275-5', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14564, 79, '도착지', 40, 7, 334, NULL, '37.493234', '126.919711', '서울 동작구 신대방동 395', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14565, 80, '도착지', 40, 1, 290, NULL, '37.517236', '127.047325', '서울 강남구 삼성동 16-1', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14566, 81, '도착지', 20, 125, 1969, NULL, '37.447201', '126.701233', '인천 남동구 구월동 1455', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14567, 82, '도착지', 19, 108, NULL, NULL, '35.317512', '129.184266', '부산 기장군 정관읍 달산리 1033-2', '2016-09-02 22:35:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14568, 83, '도착지', 22, 140, 2326, NULL, '35.875245427341575', '128.68594989180565', '대구 동구 용계동 935-3', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14569, 84, '도착지', 22, 140, 2309, NULL, '35.88147517701338', '128.6650588363409', '대구 동구 방촌동 1139-1', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14570, 85, '도착지', 22, 140, 2329, NULL, '35.86832019170483', '128.69912523776293', '대구 동구 율하동 955-11', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14571, 86, '도착지', 40, 9, 370, NULL, '37.51347628539848', '127.10071306675671', '서울 송파구 신천동 8', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14572, 87, '도착지', 40, 14, 468, NULL, '37.52112844379072', '126.92473098635674', '서울 영등포구 여의도동 3-6', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14573, 88, '도착지', 25, 179, 3125, NULL, '36.608208', '127.47954', '충북 청주시 서원구 분평동 335-3', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14574, 89, '도착지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14575, 90, '도착지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14576, 91, '도착지', 24, 167, 2953, 8754, '37.536418', '127.961736', '강원 횡성군 공근면 학담리 201-3', '2016-09-02 22:35:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14577, 92, '도착지', 27, 220, 3950, 14918, '35.991602', '129.344177', '경북 포항시 남구 연일읍 괴정리 289-1', '2016-09-02 22:35:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14578, 93, '도착지', 20, 123, 1950, NULL, '37.57476245565324', '126.75431985408066', '인천 계양구 선주지동 255-13', '2016-09-02 22:35:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14579, 94, '도착지', 27, 220, 3950, 14918, '35.991602', '129.344177', '경북 포항시 남구 연일읍 괴정리 289-1', '2016-09-02 22:35:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14580, 95, '도착지', 40, 7, 331, NULL, '37.476559', '126.981633', '서울 동작구 사당동 588-45', '2016-09-02 22:35:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14581, 96, '도착지', 18, 79, 1276, NULL, '37.384931', '127.123249', '경기 성남시 분당구 서현동 263', '2016-09-02 22:35:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14582, 97, '도착지', 26, 65, 1034, 6079, '36.926725', '127.059063', '충남 아산시 둔포면 석곡리 1341', '2016-09-02 22:35:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14583, 98, '도착지', 40, 1, 295, NULL, '37.496413', '127.028337', '서울 강남구 역삼동 858', '2016-09-02 22:35:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14584, 99, '도착지', 18, 86, 1368, NULL, '37.34314691540454', '126.78560547530653', '경기 시흥시 거모동 1835', '2016-09-02 22:35:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14585, 100, '도착지', 19, 108, NULL, NULL, '35.325539', '129.180294', '부산 기장군 정관읍 용수리 141', '2016-09-02 22:35:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14586, 101, '도착지', 25, 175, 3056, 9747, '36.785502', '127.581656', '충북 증평군 증평읍 창동리 100', '2016-09-02 22:35:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14587, 102, '도착지', 40, 1, 295, NULL, '37.50132642356142', '127.03689191490412', '서울 강남구 역삼동 679-5', '2016-09-02 22:35:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14588, 103, '도착지', 18, 85, 1367, NULL, '37.282827', '126.998727', '경기 수원시 팔달구 화서동 250-4', '2016-09-02 22:35:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14589, 104, '도착지', 40, 3, 305, NULL, '37.47499', '126.960835', '서울 관악구 봉천동 218-14', '2016-09-02 22:35:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14590, 105, '도착지', 40, 13, 442, NULL, '37.532758', '126.83154', '서울 양천구 신월동 135-18', '2016-09-02 22:35:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14591, 106, '도착지', 40, 9, 372, NULL, '37.512899', '127.082993', '서울 송파구 잠실동 19', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14592, 107, '도착지', 18, 79, 1276, NULL, '37.384931', '127.123249', '경기 성남시 분당구 서현동 263', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14593, 108, '도착지', 27, 60, 905, NULL, '36.1052531', '128.4015719', '경북 구미시 진평동 645', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14594, 109, '도착지', 40, 1, 290, NULL, '37.508861', '127.063149', '서울 강남구 삼성동 172-66', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14595, 110, '도착지', 20, 125, 1969, NULL, '37.456256', '126.705206', '인천 남동구 구월동 1138', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14596, 111, '도착지', 40, 8, 342, NULL, '37.556838', '126.923774', '서울 마포구 동교동 192-5', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14597, 112, '도착지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14598, 113, '도착지', 18, 62, 951, NULL, '37.619153', '126.729982', '경기 김포시 사우동 133-3', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14599, 114, '도착지', 28, 234, 4280, NULL, '35.2264837252437', '128.69816701859236', '경남 창원시 성산구 사파동 501-1', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14600, 115, '도착지', 18, 79, 1278, NULL, '37.378435', '127.114216', '경기 성남시 분당구 수내동 14', '2016-09-02 22:35:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14601, 116, '도착지', 29, 243, 4516, NULL, '35.976698409005465', '126.68334390968084', '전북 군산시 소룡동 1386-10', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14602, 117, '도착지', 28, 233, 4258, 16216, '35.262415', '128.52099', '경남 창원시 마산회원구 내서읍 호계리 790-3', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14603, 118, '도착지', 40, 34, 686, NULL, '37.591014', '126.913582', '서울 은평구 신사동 352-2', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14604, 119, '도착지', 40, 3, 305, NULL, '37.47624', '126.958391', '서울 관악구 봉천동 1624-24', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14605, 120, '도착지', 20, 127, 1988, NULL, '37.506982', '126.721774', '인천 부평구 부평동 879', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14606, 121, '도착지', 40, 8, 348, NULL, '37.563756', '126.908421', '서울 마포구 성산동 275-3', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14607, 123, '도착지', 30, 266, 5058, NULL, '34.93847982040648', '127.51996580511332', '전남 순천시 연향동 721', '2016-09-02 22:35:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14608, 124, '도착지', 30, 266, 5058, NULL, '34.938636', '127.519867', '전남 순천시 연향동 721', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14609, 125, '도착지', 18, 90, 1473, NULL, '37.394253', '126.956821', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14610, 126, '도착지', 30, 266, 5058, NULL, '34.938636', '127.519867', '전남 순천시 연향동 721', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14611, 127, '도착지', 24, 165, 2938, 8599, '37.82524049473423', '128.15786015242338', '강원 홍천군 내촌면 와야리 산 12-1', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14612, 128, '도착지', 22, 142, 2376, NULL, '35.871769', '128.559115', '대구 서구 평리동 1230-9', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14613, 129, '도착지', 18, 86, 1385, NULL, '37.440602', '126.783548', '경기 시흥시 신천동 738-3', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14614, 130, '도착지', 18, 86, 1385, NULL, '37.440602', '126.783548', '경기 시흥시 신천동 738-3', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14615, 131, '도착지', 40, 13, 441, NULL, '37.537019', '126.87353', '서울 양천구 목동 902', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14616, 132, '도착지', 40, 13, 441, NULL, '37.537019', '126.87353', '서울 양천구 목동 902', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14617, 133, '도착지', 18, 70, 1173, NULL, '37.618914', '126.821067', '경기 고양시 덕양구 토당동 454-3', '2016-09-02 22:35:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14618, 134, '도착지', 40, 1, 295, NULL, '37.501777537354826', '127.03708671033382', '서울 강남구 역삼동 679-1', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14619, 135, '도착지', 40, 15, 482, NULL, '37.55451883294469', '126.96949303150176', '서울 용산구 동자동 44-6', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14620, 136, '도착지', 40, 3, 306, NULL, '37.46551802422389', '126.95174619555472', '서울 관악구 신림동 산 56-1', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14621, 137, '도착지', 18, 90, 1474, NULL, '37.398997', '126.935692', '경기 안양시 동안구 비산동 400', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14622, 138, '도착지', 40, 3, 305, NULL, '37.477117', '126.963418', '서울 관악구 봉천동 1693-39', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14623, 139, '도착지', 21, 132, 2090, NULL, '36.44851274085733', '127.4266504123807', '대전 대덕구 석봉동 751', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14624, 140, '도착지', 40, 13, 442, NULL, '37.532926', '126.831345', '서울 양천구 신월동 135-21', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14625, 141, '도착지', 18, 87, 1398, NULL, '37.318393', '126.837594', '경기 안산시 단원구 고잔동 539-19', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14626, 142, '도착지', 40, 6, 324, NULL, '37.478016', '126.88737', '서울 금천구 가산동 60-22', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14627, 143, '도착지', 30, 266, 5058, NULL, '34.938636', '127.519867', '전남 순천시 연향동 721', '2016-09-02 22:35:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14628, 144, '도착지', 18, 79, 1279, NULL, '37.402863', '127.130515', '경기 성남시 분당구 야탑동 757', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14629, 145, '도착지', 18, 72, 1200, NULL, '37.678376', '126.771177', '경기 고양시 일산서구 일산동 1102', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14630, 146, '도착지', 20, 127, 1990, NULL, '37.517775', '126.7399', '인천 부평구 삼산동 157', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14631, 147, '도착지', 18, 72, 1200, NULL, '37.678376', '126.771177', '경기 고양시 일산서구 일산동 1102', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14632, 148, '도착지', 40, 5, 317, NULL, '37.48525', '126.901472', '서울 구로구 구로동 810-3', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14633, 149, '도착지', 40, 13, 443, NULL, '37.516872', '126.866398', '서울 양천구 신정동 321-4', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14634, 150, '도착지', 18, 64, 1020, 6028, '37.366234', '127.228578', '경기 광주시 오포읍 추자리 102-16', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14635, 151, '도착지', 40, 35, 700, NULL, '37.558654', '126.794474', '서울 강서구 오곡동 1', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14636, 152, '도착지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14637, 153, '도착지', 23, 149, 2659, NULL, '35.159545', '126.852601', '광주 서구 치평동 1200', '2016-09-02 22:35:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14638, 154, '도착지', 25, 175, 3056, 9748, '36.775092', '127.574914', '충북 증평군 증평읍 초중리 348-17', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14639, 155, '도착지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14640, 156, '도착지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14641, 157, '도착지', 18, 85, 1360, NULL, '37.263573', '127.028601', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14642, 158, '도착지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14643, 159, '도착지', 40, 3, 305, NULL, '37.48121', '126.952712', '서울 관악구 봉천동 979-2', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14644, 160, '도착지', 40, 14, 460, NULL, '37.539083', '126.888352', '서울 영등포구 양평동 33-3', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14645, 161, '도착지', 40, 14, 470, NULL, '37.51728477828123', '126.91538516432047', '서울 영등포구 영등포동1가 11', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14646, 162, '도착지', 19, 112, 1797, NULL, '35.157456', '129.059164', '부산 부산진구 부전동 573-1', '2016-09-02 22:35:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14647, 163, '도착지', 40, 10, 378, NULL, '37.493291566530495', '127.01359625905751', '서울 서초구 서초동 1573-5', '2016-09-02 22:35:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14648, 164, '도착지', 18, 72, 1200, NULL, '37.678376', '126.771177', '경기 고양시 일산서구 일산동 1102', '2016-09-02 22:35:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14649, 165, '도착지', 40, 5, 317, NULL, '37.50822343228891', '126.89183469861746', '서울 구로구 구로동 3-46', '2016-09-02 22:35:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14650, 166, '도착지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:35:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14651, 167, '도착지', 40, 17, 609, NULL, '37.55998', '126.98583', '서울 중구 남산동2가 9-6', '2016-09-02 22:35:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14652, 168, '도착지', 25, 179, 3127, NULL, '36.634137', '127.462708', '충북 청주시 서원구 사창동 266-31', '2016-09-02 22:35:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14653, 169, '도착지', 18, 86, 1391, NULL, '37.348602', '126.727109', '경기 시흥시 정왕동 1848-2', '2016-09-02 22:35:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14654, 170, '도착지', 40, 32, 677, NULL, '37.615206', '127.065594', '서울 노원구 월계동 36-4', '2016-09-02 22:35:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14655, 171, '도착지', 25, 182, 3201, NULL, '36.991011', '127.92595', '충북 충주시 금릉동 700', '2016-09-02 22:35:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14656, 172, '도착지', 28, 233, 4263, NULL, '35.23865', '128.583825', '경남 창원시 마산회원구 합성동 267', '2016-09-02 22:35:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14657, 173, '도착지', 40, 10, 376, NULL, '37.500718905160234', '126.99842870235445', '서울 서초구 반포동 117-3', '2016-09-02 22:35:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14658, 174, '도착지', 25, 181, 3151, NULL, '36.62507591805676', '127.43232093751429', '충북 청주시 흥덕구 가경동 1449', '2016-09-02 22:35:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14659, 175, '도착지', 24, 150, 2707, NULL, '37.747714', '128.855337', '강원 강릉시 홍제동 1015', '2016-09-02 22:35:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14660, 176, '도착지', 28, 66, 1082, NULL, '35.33879', '129.026457', '경남 양산시 중부동 475-1', '2016-09-02 22:35:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14661, 177, '도착지', 20, 125, 1971, NULL, '37.400963', '126.733533', '인천 남동구 논현동 731-7', '2016-09-02 22:35:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14662, 178, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14663, 179, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14664, 180, '도착지', 40, 3, 305, NULL, '37.477117', '126.963418', '서울 관악구 봉천동 1693-39', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14665, 181, '도착지', 23, 147, 2600, NULL, '35.133274983153264', '126.92857895046471', '광주 동구 학동 1004-1', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14666, 182, '도착지', 19, 121, 1923, NULL, '35.15989761410114', '129.16177712380886', '부산 해운대구 중동 1391-4', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14667, 183, '도착지', 18, 98, 1581, NULL, '37.32906', '127.126491', '경기 용인시 수지구 죽전동 1226', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14668, 184, '도착지', 40, 8, 345, NULL, '37.550563', '126.925398', '서울 마포구 상수동 72-1', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14669, 185, '도착지', 20, 131, 2057, NULL, '37.44801091574849', '126.45178813487291', '인천 중구 운서동 2851', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14670, 186, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14671, 187, '도착지', 18, 79, 1275, NULL, '37.400261', '127.104363', '경기 성남시 분당구 삼평동 629', '2016-09-02 22:35:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14672, 188, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14673, 189, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14674, 190, '도착지', 40, 10, 378, NULL, '37.493511295696344', '127.01446931809188', '서울 서초구 서초동 1739-5', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14675, 191, '도착지', 40, 10, 378, NULL, '37.49338813039607', '127.01399154961109', '서울 서초구 서초동 1672-10', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14676, 192, '도착지', 40, 5, 319, NULL, '37.508996', '126.891583', '서울 구로구 신도림동 460-27', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14677, 193, '도착지', 19, 118, 1853, NULL, '35.186192', '129.081582', '부산 연제구 연산동 1515-16', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14678, 194, '도착지', 28, 235, 4330, NULL, '35.2570607507122', '128.61287713050842', '경남 창원시 의창구 팔용동 120-12', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14679, 195, '도착지', 18, 81, 1306, NULL, '37.433156203040454', '127.17398565262556', '경기 성남시 중원구 상대원동 333-7', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14680, 196, '도착지', 18, 71, 1182, NULL, '37.65928248405682', '126.77360225468874', '경기 고양시 일산동구 마두동 1123', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14681, 197, '도착지', 18, 76, 1229, NULL, '37.35358056423139', '126.94843769073488', '경기 군포시 당동 134-1', '2016-09-02 22:35:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14682, 198, '도착지', 40, 15, 511, NULL, '37.53640195906547', '127.00471814721823', '서울 용산구 한남동 699-17', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14683, 199, '도착지', 18, 90, 1476, NULL, '37.39076432551141', '126.94451093673706', '경기 안양시 동안구 호계동 893-4', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14684, 200, '도착지', 19, 118, 1853, NULL, '35.179554', '129.075642', '부산 연제구 연산동 1000', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14685, 201, '도착지', 24, 162, 2880, NULL, '37.885398', '127.729776', '강원 춘천시 봉의동 15', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14686, 202, '도착지', 18, 90, 1476, NULL, '37.38832903013484', '126.94883700460196', '경기 안양시 동안구 호계동 1020', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14687, 203, '도착지', 40, 10, 378, NULL, '37.49747668419513', '127.02776234596969', '서울 서초구 서초동 1374', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14688, 204, '도착지', 18, 90, 1476, NULL, '37.389854', '126.950627', '경기 안양시 동안구 호계동 1039-2', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14689, 205, '도착지', 40, 9, 372, NULL, '37.512899', '127.082993', '서울 송파구 잠실동 19', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14690, 206, '도착지', 40, 34, 686, NULL, '37.591014', '126.913582', '서울 은평구 신사동 352-2', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14691, 207, '도착지', 22, 144, 2421, NULL, '35.871435', '128.601445', '대구 중구 동인동1가 2-1', '2016-09-02 22:35:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14692, 208, '도착지', 29, 243, 4537, NULL, '35.96424120306537', '126.73698607832195', '전북 군산시 조촌동 773-7', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14693, 209, '도착지', 28, 230, NULL, NULL, '35.17966444167963', '128.11732593923807', '경상남도 진주시 대신로', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14694, 210, '도착지', 39, 278, 5230, NULL, '35.538377', '129.31136', '울산 남구 신정동 646-4', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14695, 211, '도착지', 28, 230, 4131, NULL, '35.1602801', '128.1054107', '경남 진주시 가좌동 816-3', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14696, 212, '도착지', 28, 230, 4131, NULL, '35.1602801', '128.1054107', '경남 진주시 가좌동 816-3', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14697, 213, '도착지', 26, 185, 3287, 10731, '36.192099', '127.448518', '충남 금산군 추부면 마전리 755', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14698, 214, '도착지', 22, 140, 2322, NULL, '35.879667', '128.628476', '대구 동구 신암동 295', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14699, 215, '도착지', 21, 135, 2183, NULL, '36.369392', '127.364025', '대전 유성구 구성동 23', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14700, 216, '도착지', 40, 5, 317, NULL, '37.493366', '126.894906', '서울 구로구 구로동 1204', '2016-09-02 22:35:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14701, 217, '도착지', 40, 16, 576, NULL, '37.570467', '126.990141', '서울 종로구 종로3가 10-5', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14702, 218, '도착지', 24, 164, 2935, 8572, '37.370474', '128.389977', '강원 평창군 평창읍 하리 210-2', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14703, 219, '도착지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14704, 220, '도착지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14705, 221, '도착지', 40, 5, 317, NULL, '37.48283399859411', '126.89611349254848', '서울 구로구 구로동 222-8', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14706, 222, '도착지', 28, 230, 4151, NULL, '35.179982', '128.107621', '경남 진주시 상대동 284', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14707, 223, '도착지', 40, 3, 306, NULL, '37.484269', '126.929676', '서울 관악구 신림동 1467-10', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14708, 224, '도착지', 40, 34, 686, NULL, '37.591014', '126.913582', '서울 은평구 신사동 352-2', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14709, 225, '도착지', 23, 148, 2608, NULL, '35.17964032635376', '126.86278872191905', '광주 북구 동림동 산 85', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14710, 226, '도착지', 30, 261, NULL, NULL, '35.01637688259001', '126.7781864851713', '전남 나주시 빛가람동 394', '2016-09-02 22:36:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14711, 227, '도착지', 18, 90, 1476, NULL, '37.39068547667065', '126.94594759494066', '경기 안양시 동안구 호계동 1020', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14712, 228, '도착지', 30, 261, 4932, NULL, '34.994965344460255', '126.71409979462622', '전남 나주시 이창동 188-2', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14713, 229, '도착지', 21, 135, 2222, NULL, '36.39755314489589', '127.39921778440475', '대전 유성구 전민동 460-2', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14714, 231, '도착지', 30, 261, 4919, NULL, '35.003633948019484', '126.71119865030049', '전남 나주시 삼영동 94-1', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14715, 232, '도착지', 18, 74, 1219, NULL, '37.47561322179234', '126.8668170645833', '경기 광명시 철산동 526', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14716, 233, '도착지', 18, 74, 1219, NULL, '37.47581464353844', '126.86736926436424', '경기 광명시 철산동 526', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14717, 234, '도착지', 18, 74, 1219, NULL, '37.47581464353844', '126.86736926436424', '경기 광명시 철산동 526', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14718, 235, '도착지', 40, 3, 305, NULL, '37.476827065625486', '126.9634922593832', '서울 관악구 봉천동 1658-1', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14719, 236, '도착지', 40, 3, 305, NULL, '37.47676773088546', '126.96369610726833', '서울 관악구 봉천동 1658-2', '2016-09-02 22:36:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14720, 237, '도착지', 40, 3, 305, NULL, '37.48607579105172', '126.95678807795048', '서울 관악구 봉천동 738-419', '2016-09-02 22:36:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14721, 238, '도착지', 29, 243, 4519, NULL, '35.96857698634672', '126.72149196267128', '전북 군산시 수송동 830-1', '2016-09-02 22:36:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14722, 240, '도착지', 25, 179, 3121, NULL, '36.6286334', '127.4575502', '충북 청주시 서원구 개신동 12', '2016-09-02 22:36:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14723, 241, '도착지', 68, NULL, NULL, NULL, '36.55244637389832', '127.27444745600224', '세종특별자치시 연기면 연기리 518', '2016-09-02 22:36:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14724, 242, '도착지', 40, 3, 305, NULL, '37.48118843912323', '126.95243820548056', '서울 관악구 봉천동 979-2', '2016-09-02 22:36:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14725, 243, '도착지', 30, 261, NULL, NULL, '35.018560919586974', '126.78184300661086', '전남 나주시 빛가람동 377', '2016-09-02 22:36:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14726, 244, '도착지', 18, 90, 1476, NULL, '37.389854', '126.950627', '경기 안양시 동안구 호계동 1039-2', '2016-09-02 22:36:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14727, 245, '도착지', 40, 35, 699, NULL, '37.55094057296912', '126.87206916511059', '서울 강서구 염창동 284-46', '2016-09-02 22:36:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14728, 246, '도착지', 40, 10, NULL, NULL, '37.483665', '127.034796', '서울특별시 서초구 양재1동', '2016-09-02 22:36:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14729, 247, '도착지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:36:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14730, 248, '도착지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:36:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14731, 249, '도착지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:36:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14732, 250, '도착지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:36:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14733, 251, '도착지', 20, 124, 1960, NULL, '37.440941', '126.701426', '인천 남구 관교동 15', '2016-09-02 22:36:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14734, 252, '도착지', 40, 3, 306, NULL, '37.470546', '126.9368929', '서울 관악구 신림동 1516', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14735, 253, '도착지', 18, 58, 802, 5455, '36.97758797151999', '126.92326750606297', '경기 평택시 안중읍 현화리 838', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14736, 254, '도착지', 40, 34, 686, NULL, '37.591014', '126.913582', '서울 은평구 신사동 352-2', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14737, 255, '도착지', 18, 80, 1291, NULL, '37.41384455631715', '127.11314108222722', '경기 성남시 수정구 사송동 483', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14738, 256, '도착지', 40, 8, 346, NULL, '37.581248541999166', '126.88584331423046', '서울 마포구 상암동 1715-2', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14739, 257, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14740, 258, '도착지', 22, 139, 2283, 7583, '35.7879237', '128.6354721', '대구 달성군 가창면 냉천리 27-9', '2016-09-02 22:36:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14741, 259, '도착지', 30, 260, 4887, 18605, '35.2024947', '127.4626534', '전남 구례군 구례읍 봉남리 51', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14742, 260, '도착지', 27, 203, 3626, NULL, '36.1195207', '128.0960352', '경북 김천시 부곡동 산 96-8', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14743, 261, '도착지', 18, 92, 1483, 6568, '37.8246038', '126.9836808', '경기 양주시 광적면 가납리 848-2', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14744, 262, '도착지', 25, 178, 3093, NULL, '36.6424341', '127.4890319', '충북 청주시 상당구 북문로3가 89-1', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14745, 263, '도착지', 25, 178, 3093, NULL, '36.6424341', '127.4890319', '충북 청주시 상당구 북문로3가 89-1', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14746, 264, '도착지', 18, 81, 1307, NULL, '37.433040392739954', '127.12931614369153', '경기 성남시 중원구 성남동 3212', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14747, 265, '도착지', 21, 132, 2097, NULL, '36.409367972413285', '127.43232060223818', '대전 대덕구 와동 산 18-2', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14748, 266, '도착지', 29, 253, 4748, NULL, '35.8242238', '127.1479532', '전북 전주시 완산구 서노송동 568-1', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14749, 267, '도착지', 40, 3, 306, NULL, '37.4626176', '126.9383251', '서울 관악구 신림동 산 63-5', '2016-09-02 22:36:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14750, 268, '도착지', 18, 96, 1550, NULL, '37.14553746092666', '127.06723976880312', '경기 오산시 오산동 603-116', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14751, 269, '도착지', 18, 97, 1569, NULL, '37.2823204', '127.099173', '경기 용인시 기흥구 신갈동 산 90-2', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14752, 270, '도착지', 20, 124, 1965, NULL, '37.465035', '126.679954', '인천 남구 주안동 125', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14753, 271, '도착지', 18, 86, 1391, NULL, '37.3403953', '126.7498704', '경기 시흥시 정왕동 1413-3', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14754, 272, '도착지', 18, 62, 952, 5843, '37.61836991105135', '126.62562813609838', '경기 김포시 양촌읍 학운리 3019', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14755, 273, '도착지', 18, 97, 1569, NULL, '37.2716842', '127.1056598', '경기 용인시 기흥구 신갈동 83', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14756, 274, '도착지', 18, 99, 1597, 7034, '37.2939104', '127.2025664', '경기 용인시 처인구 포곡읍 전대리 519-19', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14757, 275, '도착지', 18, 83, 1331, NULL, '37.251521', '127.07134', '경기 수원시 영통구 영통동 1055', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14758, 276, '도착지', 28, 235, 4325, NULL, '35.227917', '128.681656', '경남 창원시 의창구 용호동 1', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14759, 277, '도착지', 20, 124, 1965, NULL, '37.465035', '126.679954', '인천 남구 주안동 125', '2016-09-02 22:36:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14760, 278, '도착지', 18, 81, 1306, NULL, '37.43288518003323', '127.17463642358778', '경기 성남시 중원구 상대원동 333-5', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14761, 279, '도착지', 18, 81, 1306, NULL, '37.43327041578202', '127.17396821826696', '경기 성남시 중원구 상대원동 333-7', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14762, 280, '도착지', 18, 81, 1306, NULL, '37.43345864012968', '127.17383477836847', '경기 성남시 중원구 상대원동 333-7', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14763, 281, '도착지', 18, 70, 1171, NULL, '37.6583599', '126.8320201', '경기 고양시 덕양구 주교동 600', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14764, 282, '도착지', 68, NULL, NULL, NULL, '36.50359255238688', '127.25301895290615', '세종특별자치시 종촌동 151-42', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14765, 283, '도착지', 40, 9, 373, NULL, '37.478688', '127.126175', '서울 송파구 장지동 217-4', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14766, 284, '도착지', 19, 109, 1772, NULL, '35.12375084391481', '129.08362559974194', '부산 남구 감만동 44-84', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14767, 285, '도착지', 20, 128, 1996, NULL, '37.568872940001405', '126.67364604771137', '인천 서구 검암동 414-154', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14768, 286, '도착지', 20, 128, 1996, NULL, '37.5648367', '126.6835943', '인천 서구 검암동 592', '2016-09-02 22:36:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14769, 287, '도착지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14770, 288, '도착지', 20, 127, 1988, NULL, '37.490473', '126.723469', '인천 부평구 부평동 224-1', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14771, 289, '도착지', 27, 60, 902, NULL, '36.09325202151198', '128.35924811661243', '경북 구미시 임은동 497', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14772, 290, '도착지', 27, 60, 902, NULL, '36.09318483258358', '128.35921190679073', '경북 구미시 임은동 497', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14773, 291, '도착지', 27, 60, 902, NULL, '36.09315963672063', '128.35922464728355', '경북 구미시 임은동 497', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14774, 292, '도착지', 40, 32, 678, NULL, '37.646957559455984', '127.07090903073549', '서울 노원구 중계동 361', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14775, 293, '도착지', 18, 74, 1220, NULL, '37.4587087', '126.8694939', '경기 광명시 하안동 862', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14776, 294, '도착지', 19, 118, 1853, NULL, '35.1795543', '129.0756416', '부산 연제구 연산동 1000', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14777, 295, '도착지', 19, 112, 1800, NULL, '35.1611399', '129.0685316', '부산 부산진구 전포동 산 99-46', '2016-09-02 22:36:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14778, 296, '도착지', 18, 92, 1485, NULL, '37.7852875', '127.0458453', '경기 양주시 남방동 1-1', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14779, 297, '도착지', 24, 158, 2836, NULL, '37.34703658160048', '127.9480242356658', '강원 원주시 일산동 141-1', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14780, 298, '도착지', 40, 9, 372, NULL, '37.511624', '127.085585', '서울 송파구 잠실동 33', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14781, 299, '도착지', 27, 60, 890, NULL, '36.119485', '128.3445734', '경북 구미시 송정동 50', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14782, 300, '도착지', 18, 64, 1017, NULL, '37.4171413', '127.2561413', '경기 광주시 송정동 120-8', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14783, 301, '도착지', 27, 60, 890, NULL, '36.119485', '128.3445734', '경북 구미시 송정동 50', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14784, 302, '도착지', 19, 118, 1853, NULL, '35.1795543', '129.0756416', '부산 연제구 연산동 1000', '2016-09-02 22:36:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14785, 303, '도착지', 19, 118, 1853, NULL, '35.1795543', '129.0756416', '부산 연제구 연산동 1000', '2016-09-02 22:36:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14786, 304, '도착지', 18, 81, 1306, NULL, '37.4326344', '127.1731511', '경기 성남시 중원구 상대원동 333-9', '2016-09-02 22:36:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14787, 305, '도착지', 18, 90, 1476, NULL, '37.391520044822535', '126.94430775940417', '경기 안양시 동안구 호계동 894-3', '2016-09-02 22:36:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14788, 306, '도착지', 18, 87, 1398, NULL, '37.316055', '126.838532', '경기 안산시 단원구 고잔동 167-378', '2016-09-02 22:36:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14789, 307, '도착지', 18, 71, 1184, NULL, '37.64558507691591', '126.78409505635499', '경기 고양시 일산동구 백석동 1350', '2016-09-02 22:36:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14790, 308, '도착지', 40, 6, 324, NULL, '37.4768775', '126.8917581', '서울 금천구 가산동 144-3', '2016-09-02 22:36:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14791, 309, '도착지', 40, 6, 324, NULL, '37.4768775', '126.8917581', '서울 금천구 가산동 144-3', '2016-09-02 22:36:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14792, 310, '도착지', 40, 32, 675, NULL, '37.617321', '127.074739', '서울 노원구 공릉동 678-1', '2016-09-02 22:36:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14793, 311, '도착지', 40, 32, 675, NULL, '37.617321', '127.074739', '서울 노원구 공릉동 678-1', '2016-09-02 22:36:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14794, 312, '도착지', 18, 64, 1017, NULL, '37.4294407', '127.2552948', '경기 광주시 송정동 570', '2016-09-02 22:36:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14795, 313, '도착지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:36:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14796, 314, '도착지', 18, 88, 1421, NULL, '37.33141592502862', '126.84833865612745', '경기 안산시 상록구 월피동 447', '2016-09-02 22:36:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14797, 315, '도착지', 40, 13, 443, NULL, '37.5101787', '126.8728425', '서울 양천구 신정동 330-8', '2016-09-02 22:36:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14798, 316, '도착지', 40, 13, 443, NULL, '37.5101787', '126.8728425', '서울 양천구 신정동 330-8', '2016-09-02 22:36:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14799, 317, '도착지', 18, 83, 1332, NULL, '37.2829873', '127.0462486', '경기 수원시 영통구 원천동 산 5-1', '2016-09-02 22:36:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14800, 318, '도착지', 29, 252, 4699, NULL, '35.8468291', '127.1293628', '전북 전주시 덕진구 덕진동1가 664-14', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14801, 319, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14802, 320, '도착지', 18, 80, 1302, NULL, '37.4449168', '127.1388684', '경기 성남시 수정구 태평동 3309', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14803, 321, '도착지', 18, 80, 1302, NULL, '37.4449168', '127.1388684', '경기 성남시 수정구 태평동 3309', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14804, 322, '도착지', 23, 149, 2647, NULL, '35.1528248', '126.8910977', '광주 서구 농성동 299-1', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14805, 323, '도착지', 18, 76, 1231, NULL, '37.328304', '126.91716', '경기 군포시 대야미동 229-1', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14806, 324, '도착지', 40, 3, 305, NULL, '37.49028046698957', '126.92499820142983', '서울 관악구 봉천동 729-22', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14807, 325, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14808, 326, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14809, 327, '도착지', 40, 8, 342, NULL, '37.5578854', '126.9265227', '서울 마포구 동교동 172-75', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14810, 328, '도착지', 18, 81, 1306, NULL, '37.43352200267487', '127.17408992350101', '경기 성남시 중원구 상대원동 333-6', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14811, 329, '도착지', 40, 37, 728, NULL, '37.6127813', '127.0981787', '서울 중랑구 신내동 316', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14812, 330, '도착지', 18, 70, 1172, NULL, '37.66721876827277', '126.95119701325893', '경기 고양시 덕양구 지축동 119-4', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14813, 331, '도착지', 18, 82, 1313, NULL, '37.2370493', '127.0298271', '경기 수원시 권선구 곡반정동 575-6', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14814, 332, '도착지', 40, 16, 579, NULL, '37.57089', '127.009241', '서울 종로구 종로6가 287-1', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14815, 333, '도착지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14816, 334, '도착지', 19, 110, 1781, NULL, '35.114979', '129.041549', '부산 동구 초량동 1187-21', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14817, 335, '도착지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:36:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14818, 336, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14819, 342, '도착지', 40, 17, 606, NULL, '37.5612839', '126.9774483', '서울 중구 남대문로4가 17-42', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14820, 344, '도착지', 18, 90, 1476, NULL, '37.39018734187443', '126.95141024887562', '경기 안양시 동안구 호계동 1124', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14821, 345, '도착지', 40, 4, 308, NULL, '37.535144', '127.094672', '서울 광진구 구의동 546-6', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14822, 346, '도착지', 19, 121, 1922, NULL, '35.169916', '129.176831', '부산 해운대구 좌동 1491', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14823, 347, '도착지', 27, 220, 3957, NULL, '36.0138857', '129.3231836', '경북 포항시 남구 지곡동 산 260-1', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14824, 348, '도착지', 18, 89, 1438, NULL, '37.013393276048525', '127.25773528218271', '경기 안성시 당왕동 557', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14825, 349, '도착지', 18, 82, 1313, NULL, '37.2370493', '127.0298271', '경기 수원시 권선구 곡반정동 575-6', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14826, 350, '도착지', 40, 10, 378, NULL, '37.4932666', '127.0139403', '서울 서초구 서초동 1672-14', '2016-09-02 22:36:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14827, 351, '도착지', 40, 9, 372, NULL, '37.5042944', '127.0879606', '서울 송파구 잠실동 347', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14828, 352, '도착지', 25, 175, 3056, 9729, '36.7864816', '127.5836753', '충북 증평군 증평읍 교동리 21-1', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14829, 353, '도착지', 25, 175, 3056, 9729, '36.7864816', '127.5836753', '충북 증평군 증평읍 교동리 21-1', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14830, 354, '도착지', 40, 38, 730, NULL, '37.6837277', '127.0318174', '서울 도봉구 도봉동 산 65', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14831, 355, '도착지', 18, 51, 744, NULL, '37.482755', '126.795654', '경기 부천시 소사본동 395', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14832, 356, '도착지', 18, 61, 914, NULL, '37.75570616884105', '126.773848682642', '경기 파주시 금촌동 953-5', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14833, 357, '도착지', 18, 84, 1337, NULL, '37.2904855', '127.0215837', '경기 수원시 장안구 연무동 202-51', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14834, 358, '도착지', 18, 84, 1337, NULL, '37.2904855', '127.0215837', '경기 수원시 장안구 연무동 202-51', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14835, 359, '도착지', 18, 82, 1314, NULL, '37.284121256115775', '126.96957651525736', '경기 수원시 권선구 구운동 30-4', '2016-09-02 22:36:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14836, 360, '도착지', 18, 104, 1680, NULL, '37.5392646', '127.2148919', '경기 하남시 신장동 520', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14837, 361, '도착지', 18, 99, 1584, NULL, '37.2328575', '127.2097619', '경기 용인시 처인구 김량장동 23-1', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14838, 362, '도착지', 18, 79, 1275, NULL, '37.404014281058984', '127.10269019007683', '경기 성남시 분당구 삼평동 622', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14839, 363, '도착지', 18, NULL, NULL, NULL, '37.2908754', '127.6354146', '경기 여주시 홍문동 269-5', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14840, 364, '도착지', 18, 79, 1275, NULL, '37.403676', '127.103126', '경기 성남시 분당구 삼평동 622', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14841, 365, '도착지', 18, 79, 1275, NULL, '37.403676', '127.103126', '경기 성남시 분당구 삼평동 622', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14842, 366, '도착지', 18, 79, 1275, NULL, '37.403676', '127.103126', '경기 성남시 분당구 삼평동 622', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14843, 367, '도착지', 20, 131, 2057, NULL, '37.43989019729646', '126.45860128104688', '인천 중구 운서동 2850-2', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14844, 368, '도착지', 40, 15, 502, NULL, '37.5400456', '126.9921017', '서울 용산구 이태원동 211-33', '2016-09-02 22:36:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14845, 369, '도착지', 40, 15, 502, NULL, '37.5400456', '126.9921017', '서울 용산구 이태원동 211-33', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14846, 370, '도착지', 40, 1, 286, NULL, '37.4763807', '127.0513545', '서울 강남구 개포동 1272', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14847, 371, '도착지', 18, 89, 1453, NULL, '37.00926042797288', '127.2645118832588', '경기 안성시 석정동 339', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14848, 372, '도착지', 18, 85, 1360, NULL, '37.2635727', '127.0286009', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14849, 373, '도착지', 18, 90, 1476, NULL, '37.389077847932164', '126.948506757617', '경기 안양시 동안구 호계동 1020', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14850, 374, '도착지', 18, 61, 914, NULL, '37.7658401', '126.7739838', '경기 파주시 금촌동 329-251', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14851, 375, '도착지', 18, 61, 914, NULL, '37.7658401', '126.7739838', '경기 파주시 금촌동 329-251', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14852, 376, '도착지', 18, 61, 914, NULL, '37.7658401', '126.7739838', '경기 파주시 금촌동 329-251', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14853, 377, '도착지', 18, 61, 914, NULL, '37.7658401', '126.7739838', '경기 파주시 금촌동 329-251', '2016-09-02 22:36:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14854, 378, '도착지', 18, 51, 750, NULL, '37.485319429734055', '126.81219555437565', '경기 부천시 역곡동 382', '2016-09-02 22:36:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14855, 379, '도착지', 18, 51, 750, NULL, '37.485127', '126.811523', '경기 부천시 역곡동 382', '2016-09-02 22:36:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14856, 380, '도착지', 40, 12, 440, NULL, '37.6041779', '127.0409997', '서울 성북구 하월곡동 25-29', '2016-09-02 22:36:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14857, 381, '도착지', 27, 208, 3778, NULL, '36.5627', '128.732944', '경북 안동시 운흥동 178-3', '2016-09-02 22:36:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14858, 382, '도착지', 18, 81, 1306, NULL, '37.4326988', '127.1733137', '경기 성남시 중원구 상대원동 333-9', '2016-09-02 22:36:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14859, 383, '도착지', 19, 118, 1852, NULL, '35.1954434', '129.0750953', '부산 연제구 거제동 256-1', '2016-09-02 22:36:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14860, 384, '도착지', 19, 118, 1852, NULL, '35.1954434', '129.0750953', '부산 연제구 거제동 256-1', '2016-09-02 22:36:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14861, 385, '도착지', 19, 118, 1852, NULL, '35.1954434', '129.0750953', '부산 연제구 거제동 256-1', '2016-09-02 22:36:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14862, 386, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14863, 387, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14864, 388, '도착지', 18, 51, 741, NULL, '37.5187422', '126.7641038', '경기 부천시 삼정동 365', '2016-09-02 22:36:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14865, 389, '도착지', 18, 51, 741, NULL, '37.5187422', '126.7641038', '경기 부천시 삼정동 365', '2016-09-02 22:36:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14866, 390, '도착지', 21, 134, 2159, NULL, '36.3504119', '127.3845475', '대전 서구 둔산동 1420', '2016-09-02 22:36:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14867, 391, '도착지', 21, 134, 2159, NULL, '36.3504119', '127.3845475', '대전 서구 둔산동 1420', '2016-09-02 22:36:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14868, 392, '도착지', 18, 99, 1584, NULL, '37.2328575', '127.2097619', '경기 용인시 처인구 김량장동 23-1', '2016-09-02 22:36:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14869, 393, '도착지', 18, 51, 741, NULL, '37.5187422', '126.7641038', '경기 부천시 삼정동 365', '2016-09-02 22:36:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14870, 394, '도착지', 24, 150, 2663, NULL, '37.8054863', '128.9078306', '강원 강릉시 강문동 산 1', '2016-09-02 22:36:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14871, 395, '도착지', 24, 150, 2663, NULL, '37.8054863', '128.9078306', '강원 강릉시 강문동 산 1', '2016-09-02 22:36:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14872, 396, '도착지', 20, 131, 2055, NULL, '37.5000629', '126.5358479', '인천 중구 운남동 651-5', '2016-09-02 22:36:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14873, 397, '도착지', 20, 131, 2055, NULL, '37.5000629', '126.5358479', '인천 중구 운남동 651-5', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14874, 398, '도착지', 18, 72, 1197, NULL, '37.668857', '126.7457284', '경기 고양시 일산서구 대화동 2600', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14875, 399, '도착지', 29, 253, 4750, NULL, '35.8341847', '127.1201181', '전북 전주시 완산구 서신동 970-2', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14876, 400, '도착지', 18, 51, 742, NULL, '37.496347233609185', '126.75463065505026', '경기 부천시 상동 394', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14877, 401, '도착지', 20, 129, 2016, NULL, '37.39199', '126.649736', '인천 연수구 송도동 42', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14878, 402, '도착지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14879, 403, '도착지', 28, 222, 4008, NULL, '34.8751089', '128.6893816', '경남 거제시 아주동 1665', '2016-09-02 22:36:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14880, 404, '도착지', 19, 109, 1773, NULL, '35.1349208', '129.0836701', '부산 남구 대연동 1768-2', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14881, 405, '도착지', 40, 5, 320, NULL, '37.4944', '126.844551', '서울 구로구 오류동 135-1', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14882, 406, '도착지', 40, 5, 320, NULL, '37.4944', '126.844551', '서울 구로구 오류동 135-1', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14883, 407, '도착지', 25, 179, 3129, NULL, '36.61392128897359', '127.45853550732137', '충북 청주시 서원구 성화동 17-8', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14884, 408, '도착지', 18, 90, 1474, NULL, '37.38924780269105', '126.94825999438763', '경기 안양시 동안구 비산동 1144', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14885, 409, '도착지', 19, 121, 1923, NULL, '35.1631139', '129.1635509', '부산 해운대구 중동 1378-95', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14886, 410, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14887, 411, '도착지', 25, 179, 3121, NULL, '36.62570448174897', '127.46794637292622', '충북 청주시 서원구 개신동 1-38', '2016-09-02 22:36:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14888, 412, '도착지', 18, 70, 1161, NULL, '37.6468131', '126.9732407', '경기 고양시 덕양구 북한동 산 1-1', '2016-09-02 22:36:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14889, 413, '도착지', 18, 70, 1161, NULL, '37.6468131', '126.9732407', '경기 고양시 덕양구 북한동 산 1-1', '2016-09-02 22:36:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14890, 414, '도착지', 18, 70, 1161, NULL, '37.6468131', '126.9732407', '경기 고양시 덕양구 북한동 산 1-1', '2016-09-02 22:36:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14891, 415, '도착지', 40, 14, 463, NULL, '37.526142675020765', '126.88567232340576', '서울 영등포구 양평동3가 24', '2016-09-02 22:36:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14892, 416, '도착지', 18, 70, 1174, NULL, '37.621027424566584', '126.84065613895655', '경기 고양시 덕양구 행신동 958', '2016-09-02 22:36:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14893, 417, '도착지', 20, 124, 1965, NULL, '37.4585214', '126.6835505', '인천 남구 주안동 80-1', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14894, 418, '도착지', 20, 124, 1965, NULL, '37.4585214', '126.6835505', '인천 남구 주안동 80-1', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14895, 419, '도착지', 18, 86, 1376, NULL, '37.4445464', '126.7895191', '경기 시흥시 대야동 469-3', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14896, 420, '도착지', 18, 99, 1588, 6979, '37.337531', '127.2684825', '경기 용인시 처인구 모현면 왕산리 157', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14897, 421, '도착지', 40, 16, NULL, NULL, '37.58256747870936', '127.00147200375795', '서울 종로구 명륜4가 30-4', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14898, 422, '도착지', 29, 253, 4775, NULL, '35.807847706109825', '127.10141513496639', '전북 전주시 완산구 효자동2가 1201-2', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14899, 423, '도착지', 30, 266, 5069, NULL, '34.950637', '127.4872135', '전남 순천시 장천동 53-1', '2016-09-02 22:36:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14900, 424, '도착지', 40, 8, 342, NULL, '37.5567295', '126.9236418', '서울 마포구 동교동 192-5', '2016-09-02 22:36:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14901, 425, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14902, 426, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14903, 427, '도착지', 18, 79, 1275, NULL, '37.40402972842877', '127.10492581129074', '경기 성남시 분당구 삼평동 694-1', '2016-09-02 22:36:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14904, 428, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14905, 429, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14906, 430, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14907, 431, '도착지', 40, 16, 520, NULL, '37.570169', '126.983099', '서울 종로구 관철동 291-2', '2016-09-02 22:36:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14908, 432, '도착지', 20, 124, 1965, NULL, '37.465035', '126.679954', '인천 남구 주안동 125', '2016-09-02 22:36:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14909, 433, '도착지', 18, 99, 1588, 6979, '37.33413591218042', '127.25047454237937', '경기 용인시 처인구 모현면 왕산리 478-2', '2016-09-02 22:36:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14910, 434, '도착지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:36:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14911, 435, '도착지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:36:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14912, 436, '도착지', 18, 91, 1479, NULL, '37.403051', '126.921776', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:36:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14913, 437, '도착지', 40, 16, 576, NULL, '37.5703665', '126.9919515', '서울 종로구 종로3가 137-3', '2016-09-02 22:36:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14914, 438, '도착지', 40, 16, 576, NULL, '37.5703665', '126.9919515', '서울 종로구 종로3가 137-3', '2016-09-02 22:36:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14915, 439, '도착지', 40, 16, 576, NULL, '37.5703665', '126.9919515', '서울 종로구 종로3가 137-3', '2016-09-02 22:36:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14916, 440, '도착지', 40, 16, 576, NULL, '37.5703665', '126.9919515', '서울 종로구 종로3가 137-3', '2016-09-02 22:36:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14917, 441, '도착지', 40, 16, 576, NULL, '37.5703665', '126.9919515', '서울 종로구 종로3가 137-3', '2016-09-02 22:36:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14918, 442, '도착지', 40, 17, 611, NULL, '37.558541', '126.978203', '서울 중구 남창동 64-1', '2016-09-02 22:36:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14919, 443, '도착지', 40, 17, 611, NULL, '37.558541', '126.978203', '서울 중구 남창동 64-1', '2016-09-02 22:36:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14920, 444, '도착지', 40, 17, 611, NULL, '37.558541', '126.978203', '서울 중구 남창동 64-1', '2016-09-02 22:36:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14921, 445, '도착지', 40, 17, 611, NULL, '37.558541', '126.978203', '서울 중구 남창동 64-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14922, 446, '도착지', 18, 87, 1398, NULL, '37.3218778', '126.8308848', '경기 안산시 단원구 고잔동 515', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14923, 447, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14924, 448, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14925, 449, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14926, 450, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14927, 451, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14928, 452, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14929, 453, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14930, 454, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14931, 455, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14932, 456, '도착지', 40, 4, 310, NULL, '37.547905', '127.074593', '서울 광진구 능동 463-1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14933, 457, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14934, 458, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14935, 459, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14936, 460, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14937, 461, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14938, 462, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14939, 463, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14940, 464, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14941, 465, '도착지', 40, 4, 313, NULL, '37.5435547', '127.073456', '서울 광진구 화양동 1', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14942, 466, '도착지', 18, 99, 1588, 6979, '37.337531', '127.2684825', '경기 용인시 처인구 모현면 왕산리 157', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14943, 467, '도착지', 18, 99, 1588, 6979, '37.337531', '127.2684825', '경기 용인시 처인구 모현면 왕산리 157', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14944, 468, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14945, 469, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14946, 470, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14947, 471, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14948, 472, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14949, 473, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14950, 474, '도착지', 40, 16, 582, NULL, '37.5712189', '127.0141328', '서울 종로구 창신동 390-6', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14951, 475, '도착지', 19, 109, 1776, NULL, '35.1155121', '129.115598', '부산 남구 용호동 522-2', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14952, 476, '도착지', 40, 16, 599, NULL, '37.5719416', '127.0043274', '서울 종로구 효제동 198', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14953, 477, '도착지', 40, 16, 599, NULL, '37.5719416', '127.0043274', '서울 종로구 효제동 198', '2016-09-02 22:36:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14954, 478, '도착지', 18, 87, 1410, NULL, '37.309841', '126.8108263', '경기 안산시 단원구 초지동 725-1', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14955, 479, '도착지', 19, 112, 1797, NULL, '35.157456', '129.059164', '부산 부산진구 부전동 573-1', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14956, 480, '도착지', 68, NULL, NULL, NULL, '36.56070013101561', '127.2591494768858', '세종특별자치시 연서면 와촌리 123', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14957, 481, '도착지', 68, NULL, NULL, NULL, '36.56070013101561', '127.2591494768858', '세종특별자치시 연서면 와촌리 123', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14958, 482, '도착지', 24, 150, 2707, NULL, '37.751853', '128.8760574', '강원 강릉시 홍제동 1001', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14959, 483, '도착지', 40, 11, 394, NULL, '37.5444278', '127.0567958', '서울 성동구 성수동2가 289-30', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14960, 484, '도착지', 40, 11, 394, NULL, '37.5444278', '127.0567958', '서울 성동구 성수동2가 289-30', '2016-09-02 22:36:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14961, 485, '도착지', 40, 11, 394, NULL, '37.5444278', '127.0567958', '서울 성동구 성수동2가 289-30', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14962, 486, '도착지', 40, 11, 394, NULL, '37.5444278', '127.0567958', '서울 성동구 성수동2가 289-30', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14963, 487, '도착지', 40, 11, 394, NULL, '37.5444278', '127.0567958', '서울 성동구 성수동2가 289-30', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14964, 488, '도착지', 40, 11, 394, NULL, '37.5444278', '127.0567958', '서울 성동구 성수동2가 289-30', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14965, 489, '도착지', 26, 198, 3499, 12390, '36.6014183', '126.6622533', '충남 홍성군 홍성읍 오관리 113-25', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14966, 490, '도착지', 18, 90, 1473, NULL, '37.3928059', '126.9731172', '경기 안양시 동안구 관양동 954-4', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14967, 491, '도착지', 18, 61, 920, NULL, '37.7145393', '126.6876326', '경기 파주시 문발동 541-2', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14968, 492, '도착지', 18, 61, 920, NULL, '37.7145393', '126.6876326', '경기 파주시 문발동 541-2', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14969, 493, '도착지', 18, 61, 920, NULL, '37.7145393', '126.6876326', '경기 파주시 문발동 541-2', '2016-09-02 22:36:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14970, 494, '도착지', 19, 109, 1776, NULL, '35.1103411', '129.1091959', '부산 남구 용호동 538-41', '2016-09-02 22:36:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14971, 495, '도착지', 18, 82, 1320, NULL, '37.2506574', '127.0185578', '경기 수원시 권선구 세류동 1121-4', '2016-09-02 22:36:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14972, 496, '도착지', 18, 85, 1352, NULL, '37.265669', '127.000223', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:36:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14973, 497, '도착지', 20, 127, 1988, NULL, '37.5069818', '126.7217739', '인천 부평구 부평동 879', '2016-09-02 22:36:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14974, 498, '도착지', 20, 127, 1988, NULL, '37.5069818', '126.7217739', '인천 부평구 부평동 879', '2016-09-02 22:36:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14975, 499, '도착지', 20, 124, 1965, NULL, '37.4565562', '126.6845807', '인천 남구 주안동 412-2', '2016-09-02 22:36:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14976, 501, '도착지', 40, 14, 468, NULL, '37.5279158', '126.9294135', '서울 영등포구 여의도동 20', '2016-09-02 22:36:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14977, 502, '도착지', 40, 14, 468, NULL, '37.5279158', '126.9294135', '서울 영등포구 여의도동 20', '2016-09-02 22:36:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14978, 503, '도착지', 18, 62, 957, NULL, '37.6023037', '126.7220213', '경기 김포시 풍무동 431', '2016-09-02 22:36:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14979, 504, '도착지', 18, 62, 957, NULL, '37.6023037', '126.7220213', '경기 김포시 풍무동 431', '2016-09-02 22:36:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14980, 505, '도착지', 18, 62, 957, NULL, '37.6023037', '126.7220213', '경기 김포시 풍무동 431', '2016-09-02 22:36:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14981, 506, '도착지', 18, 62, 957, NULL, '37.6023037', '126.7220213', '경기 김포시 풍무동 431', '2016-09-02 22:36:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14982, 507, '도착지', 28, 222, 3995, NULL, '34.8824091', '128.6231029', '경남 거제시 고현동 209-17', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14983, 508, '도착지', 22, 138, 2259, NULL, '35.849142634935305', '128.51094614714384', '대구 달서구 갈산동 977-1', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14984, 509, '도착지', 28, 232, 4230, NULL, '35.18035', '128.553385', '경남 창원시 마산합포구 월영동 500-2', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14985, 510, '도착지', 20, 128, 1995, NULL, '37.49754983455079', '126.67064968496561', '인천 서구 가좌동 118', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14986, 511, '도착지', 19, 106, 1740, NULL, '35.1083289', '128.9151681', '부산 강서구 명지동 777', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14987, 512, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14988, 513, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14989, 514, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14990, 515, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14991, 516, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14992, 517, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14993, 518, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:36:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14994, 519, '도착지', 25, 182, 3236, NULL, '36.96627856039084', '127.92467158287764', '충북 충주시 호암동 595-45', '2016-09-02 22:36:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14995, 520, '도착지', 18, 82, 1315, NULL, '37.253173454015915', '127.03657407313587', '경기 수원시 권선구 권선동 1240', '2016-09-02 22:36:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14996, 521, '도착지', 30, 269, 5110, 19664, '34.7588562', '126.3937624', '전남 영암군 삼호읍 용당리 1160-87', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14997, 522, '도착지', 30, 269, 5110, 19664, '34.7588562', '126.3937624', '전남 영암군 삼호읍 용당리 1160-87', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14998, 523, '도착지', 30, 263, 4995, NULL, '34.8002702', '126.37562', '전남 목포시 죽교동 575-2', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(14999, 524, '도착지', 18, 87, 1405, NULL, '37.3127873', '126.7483907', '경기 안산시 단원구 성곡동 673-16', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15000, 525, '도착지', 18, 58, 788, NULL, '37.040807827202144', '127.08721652626991', '경기 평택시 가재동 194-10', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15001, 526, '도착지', 25, 182, 3210, NULL, '36.98053632273388', '127.91500758379698', '충북 충주시 봉방동 77-1', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15002, 527, '도착지', 18, 76, 1229, NULL, '37.34316024291292', '126.93878140300511', '경기 군포시 당동 994', '2016-09-02 22:36:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15003, 528, '도착지', 29, 246, 4632, 17358, '36.0068191', '127.6607805', '전북 무주군 무주읍 읍내리 229-2', '2016-09-02 22:36:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15004, 529, '도착지', 28, 56, 768, NULL, '35.259539', '128.867245', '경남 김해시 삼계동 1520-2', '2016-09-02 22:36:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15005, 530, '도착지', 40, 10, 376, NULL, '37.5049032', '127.0020252', '서울 서초구 반포동 19-1', '2016-09-02 22:36:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15006, 531, '도착지', 21, 134, 2159, NULL, '36.3504119', '127.3845475', '대전 서구 둔산동 1420', '2016-09-02 22:36:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15007, 532, '도착지', 24, 160, 2852, 8270, '37.2130567', '128.8275509', '강원 정선군 고한읍 고한리 산 1-229', '2016-09-02 22:36:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15008, 533, '도착지', 22, 144, 2411, NULL, '35.8559656', '128.6063335', '대구 중구 대봉동 214', '2016-09-02 22:36:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15009, 534, '도착지', 22, 144, 2411, NULL, '35.8559656', '128.6063335', '대구 중구 대봉동 214', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15010, 535, '도착지', 26, 190, 3380, NULL, '36.7810666', '126.5034261', '충남 서산시 수석동 1-62', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15011, 536, '도착지', 26, 190, 3380, NULL, '36.7810666', '126.5034261', '충남 서산시 수석동 1-62', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15012, 537, '도착지', 26, 190, 3380, NULL, '36.7810666', '126.5034261', '충남 서산시 수석동 1-62', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15013, 538, '도착지', 18, 98, 1577, NULL, '37.339545469416', '127.10187144577502', '경기 용인시 수지구 동천동 249', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15014, 539, '도착지', 18, 98, 1577, NULL, '37.339545469416', '127.10187144577502', '경기 용인시 수지구 동천동 249', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15015, 540, '도착지', 20, 131, 2057, NULL, '37.492764', '126.493844', '인천 중구 운서동 1427-27', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15016, 541, '도착지', 20, 131, 2057, NULL, '37.492764', '126.493844', '인천 중구 운서동 1427-27', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15017, 542, '도착지', 40, 6, 324, NULL, '37.48035', '126.88251', '서울 금천구 가산동 371-28', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15018, 543, '도착지', 28, 56, 766, NULL, '35.2285451', '128.8893517', '경남 김해시 부원동 623', '2016-09-02 22:36:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15019, 544, '도착지', 28, 56, 766, NULL, '35.2285451', '128.8893517', '경남 김해시 부원동 623', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15020, 545, '도착지', 18, 90, 1473, NULL, '37.3942527', '126.9568209', '경기 안양시 동안구 관양동 1590', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15021, 546, '도착지', 19, 109, 1776, NULL, '35.1103411', '129.1091959', '부산 남구 용호동 538-41', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15022, 547, '도착지', 40, 3, 306, NULL, '37.470546', '126.9368929', '서울 관악구 신림동 1516', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15023, 548, '도착지', 39, 278, 5226, NULL, '35.538778853169674', '129.3388056010008', '울산 남구 삼산동 1480-1', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15024, 549, '도착지', 20, 129, 2016, NULL, '37.38173612718973', '126.6619036719203', '인천 연수구 송도동 172-1', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15025, 550, '도착지', 18, 105, 1700, NULL, '37.1963193', '127.080581', '경기 화성시 반송동 108', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15026, 551, '도착지', 40, 9, 362, NULL, '37.4963176', '127.1234353', '서울 송파구 가락동 58', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15027, 552, '도착지', 40, 9, 362, NULL, '37.4963176', '127.1234353', '서울 송파구 가락동 58', '2016-09-02 22:36:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15028, 553, '도착지', 40, 7, 331, NULL, '37.476559', '126.981633', '서울 동작구 사당동 588-45', '2016-09-02 22:36:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15029, 554, '도착지', 18, 74, 1219, NULL, '37.4784878', '126.8642888', '경기 광명시 철산동 222-1', '2016-09-02 22:36:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15030, 555, '도착지', 18, 74, 1219, NULL, '37.4784878', '126.8642888', '경기 광명시 철산동 222-1', '2016-09-02 22:36:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15031, 556, '도착지', 18, 64, 1020, 6027, '37.3706871', '127.2535711', '경기 광주시 오포읍 양벌리 727-4', '2016-09-02 22:36:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15032, 557, '도착지', 18, 64, 1020, 6027, '37.3706871', '127.2535711', '경기 광주시 오포읍 양벌리 727-4', '2016-09-02 22:36:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15033, 569, '도착지', 21, 133, 2138, NULL, '36.332344', '127.4342', '대전 동구 정동 1-280', '2016-09-02 22:36:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15034, 570, '도착지', 23, 148, 2609, NULL, '35.1711417', '126.9364396', '광주 북구 두암동 918-11', '2016-09-02 22:36:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15035, 571, '도착지', 40, 35, 698, NULL, '37.56500861410777', '126.80040758103132', '서울 강서구 방화동 886', '2016-09-02 22:36:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15036, 572, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15037, 573, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15038, 574, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15039, 575, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15040, 576, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15041, 577, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15042, 578, '도착지', 18, 90, 1473, NULL, '37.394346', '126.96388', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15043, 579, '도착지', 40, 1, 295, NULL, '37.4980371470915', '127.02888485044241', '서울 강남구 역삼동 825-17', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15044, 580, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:36:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15045, 581, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15046, 582, '도착지', 26, 195, 3459, NULL, '36.815129', '127.1138939', '충남 천안시 서북구 불당동 234-1', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15047, 583, '도착지', 18, 77, 1242, 6369, '37.711666382208726', '127.32214987277985', '경기 남양주시 수동면 입석리 471-8', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15048, 584, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15049, 585, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15050, 586, '도착지', 24, 167, 2954, 8765, '37.4735415', '128.2338225', '강원 횡성군 둔내면 조항리 103-1', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15051, 587, '도착지', 22, 143, 2394, NULL, '35.841670186126464', '128.69959093630314', '대구 수성구 시지동 314-19', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15052, 588, '도착지', 22, 143, 2394, NULL, '35.841670186126464', '128.69959093630314', '대구 수성구 시지동 314-19', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15053, 589, '도착지', 20, 125, 1967, NULL, '37.464689', '126.693408', '인천 남동구 간석동 757', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15054, 590, '도착지', 19, 117, 1847, NULL, '35.16779', '129.114608', '부산 수영구 광안동 1092', '2016-09-02 22:36:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15055, 591, '도착지', 39, 278, 5226, NULL, '35.5388484226632', '129.33888271450996', '울산 남구 삼산동 1480-1', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15056, 592, '도착지', 40, 10, 378, NULL, '37.49540450435555', '127.02832259237766', '서울 서초구 서초동 1328-7', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15057, 593, '도착지', 22, 143, 2395, NULL, '35.83210186925539', '128.70664112269878', '대구 수성구 신매동 601', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15058, 594, '도착지', 27, 220, 3943, NULL, '36.0190178', '129.3434808', '경북 포항시 남구 대잠동 1001', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15059, 595, '도착지', 27, 200, 3541, NULL, '35.7762415', '129.2985216', '경북 경주시 구정동 461-1', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15060, 596, '도착지', 27, 200, 3541, NULL, '35.7762415', '129.2985216', '경북 경주시 구정동 461-1', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15061, 597, '도착지', 22, 141, 2365, NULL, '35.9306497', '128.5331439', '대구 북구 태전동 산 20-17', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15062, 598, '도착지', 23, 149, 2644, NULL, '35.160879', '126.8808762', '광주 서구 광천동 49-1', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15063, 599, '도착지', 24, 160, 2852, 8270, '37.2041439', '128.851893', '강원 정선군 고한읍 고한리 80-4', '2016-09-02 22:36:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15064, 600, '도착지', 29, 252, 4697, NULL, '35.834368', '127.132692', '전북 전주시 덕진구 금암동 705-10', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15065, 601, '도착지', 24, 160, 2852, 8270, '37.2130567', '128.8275509', '강원 정선군 고한읍 고한리 산 1-229', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15066, 602, '도착지', 18, 71, 1184, NULL, '37.64582161294964', '126.78517162799835', '경기 고양시 일산동구 백석동 1288-2', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15067, 603, '도착지', 18, 71, 1184, NULL, '37.64582161294964', '126.78517162799835', '경기 고양시 일산동구 백석동 1288-2', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15068, 604, '도착지', 19, 120, 1881, NULL, '35.0973972', '129.031648', '부산 중구 남포동4가 32-2', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15069, 605, '도착지', 23, 146, 2546, NULL, '35.1347975685347', '126.89594183117151', '광주 남구 백운동 653-222', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15070, 606, '도착지', 18, 72, 1200, NULL, '37.6815601', '126.769111', '경기 고양시 일산서구 일산동 1408', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15071, 607, '도착지', 19, 117, 1850, NULL, '35.16156552214424', '129.12129387259483', '부산 수영구 민락동 186', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15072, 608, '도착지', 19, 114, 1813, NULL, '35.150416', '129.006358', '부산 사상구 주례동 516-4', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15073, 609, '도착지', 18, 81, 1306, NULL, '37.43518192251242', '127.17409897595644', '경기 성남시 중원구 상대원동 223-28', '2016-09-02 22:36:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15074, 610, '도착지', 18, 81, 1306, NULL, '37.43518192251242', '127.17409897595644', '경기 성남시 중원구 상대원동 223-28', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15075, 611, '도착지', 39, 278, 5224, NULL, '35.5510418', '129.260725', '울산 남구 무거동 1522-2', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15076, 612, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15077, 613, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15078, 614, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15079, 615, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15080, 616, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15081, 617, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15082, 618, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15083, 619, '도착지', 40, 17, 617, NULL, '37.5627667', '126.9821314', '서울 중구 명동2가 95-1', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15084, 620, '도착지', 40, 12, 438, NULL, '37.60167296600659', '127.01615005731581', '서울 성북구 정릉동 16-344', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15085, 621, '도착지', 18, 87, 1405, NULL, '37.31533205190994', '126.73037342727186', '경기 안산시 단원구 성곡동 728-5', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15086, 622, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15087, 623, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15088, 624, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15089, 625, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15090, 626, '도착지', 18, 81, 1307, NULL, '37.432124', '127.129064', '경기 성남시 중원구 성남동 1575', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15091, 627, '도착지', 18, 77, 1255, 6407, '37.653052190522715', '127.32692588120699', '경기 남양주시 화도읍 월산리 308-3', '2016-09-02 22:37:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15092, 628, '도착지', 40, 9, 372, NULL, '37.5079608', '127.1006814', '서울 송파구 잠실동 47', '2016-09-02 22:37:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15093, 629, '도착지', 40, 9, 372, NULL, '37.5079608', '127.1006814', '서울 송파구 잠실동 47', '2016-09-02 22:37:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15094, 630, '도착지', 40, 8, 342, NULL, '37.556707', '126.923933', '서울 마포구 동교동 165-4', '2016-09-02 22:37:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15095, 631, '도착지', 18, 77, 1255, 6405, '37.655955054224805', '127.29897256940603', '경기 남양주시 화도읍 마석우리 555', '2016-09-02 22:37:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15096, 632, '도착지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:37:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15097, 633, '도착지', 40, 6, 324, NULL, '37.46619', '126.889342', '서울 금천구 가산동 717', '2016-09-02 22:37:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15098, 634, '도착지', 40, 8, 340, NULL, '37.5513365', '126.9407529', '서울 마포구 대흥동 22-60', '2016-09-02 22:37:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15099, 635, '도착지', 40, 35, 700, NULL, '37.5586545', '126.7944739', '서울 강서구 오곡동 1', '2016-09-02 22:37:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15100, 636, '도착지', 18, 72, 1200, NULL, '37.6884848', '126.7701175', '경기 고양시 일산서구 일산동 600-32', '2016-09-02 22:37:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15101, 637, '도착지', 18, 72, 1200, NULL, '37.6884848', '126.7701175', '경기 고양시 일산서구 일산동 600-32', '2016-09-02 22:37:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15102, 638, '도착지', 40, 3, 306, NULL, '37.48424114269188', '126.93009104579689', '서울 관악구 신림동 1467-10', '2016-09-02 22:37:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15103, 639, '도착지', 18, 90, 1473, NULL, '37.4019', '126.976818', '경기 안양시 동안구 관양동 1563', '2016-09-02 22:37:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15104, 640, '도착지', 20, 123, 1955, NULL, '37.5285216', '126.7326164', '인천 계양구 작전동 140-2', '2016-09-02 22:37:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15105, 641, '도착지', 20, 123, 1955, NULL, '37.5285216', '126.7326164', '인천 계양구 작전동 140-2', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15106, 642, '도착지', 40, 1, 292, NULL, '37.487633', '127.101118', '서울 강남구 수서동 728', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15107, 643, '도착지', 18, 85, 1360, NULL, '37.2635727', '127.0286009', '경기 수원시 팔달구 인계동 1111', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15108, 644, '도착지', 19, 117, 1848, NULL, '35.137317600016964', '129.1109512746334', '부산 수영구 남천동 545-2', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15109, 645, '도착지', 40, 17, 617, NULL, '37.5627667', '126.9821314', '서울 중구 명동2가 95-1', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15110, 646, '도착지', 20, 127, 1985, NULL, '37.517056', '126.721545', '인천 부평구 갈산동 187', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15111, 647, '도착지', 20, 127, 1985, NULL, '37.517056', '126.721545', '인천 부평구 갈산동 187', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15112, 648, '도착지', 20, 127, 1988, NULL, '37.490473', '126.723469', '인천 부평구 부평동 224-1', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15113, 649, '도착지', 20, 127, 1985, NULL, '37.517056', '126.721545', '인천 부평구 갈산동 187', '2016-09-02 22:37:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15114, 650, '도착지', 20, 127, 1985, NULL, '37.517056', '126.721545', '인천 부평구 갈산동 187', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15115, 651, '도착지', 20, 127, 1985, NULL, '37.5135316', '126.7263146', '인천 부평구 갈산동 360', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15116, 652, '도착지', 20, 127, 1985, NULL, '37.5135316', '126.7263146', '인천 부평구 갈산동 360', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15117, 653, '도착지', 40, 9, 365, NULL, '37.4883437', '127.1245245', '서울 송파구 문정동 40-9', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15118, 654, '도착지', 40, 9, 365, NULL, '37.4883437', '127.1245245', '서울 송파구 문정동 40-9', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15119, 655, '도착지', 18, 74, 1214, NULL, '37.4794044', '126.8544007', '경기 광명시 광명동 158-211', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15120, 656, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15121, 657, '도착지', 40, 9, 372, NULL, '37.5128988', '127.0829932', '서울 송파구 잠실동 19', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15122, 658, '도착지', 18, 76, 1228, NULL, '37.361262412726305', '126.93981405347586', '경기 군포시 금정동 834', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15123, 659, '도착지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:37:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15124, 660, '도착지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15125, 661, '도착지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15126, 662, '도착지', 40, 1, 295, NULL, '37.504479', '127.048941', '서울 강남구 역삼동 802-31', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15127, 663, '도착지', 40, 9, 372, NULL, '37.5079608', '127.1006814', '서울 송파구 잠실동 47', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15128, 664, '도착지', 20, 127, 1988, NULL, '37.490473', '126.723469', '인천 부평구 부평동 224-1', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15129, 665, '도착지', 20, 127, 1988, NULL, '37.5069818', '126.7217739', '인천 부평구 부평동 879', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15130, 666, '도착지', 40, 9, 370, NULL, '37.513342', '127.100155', '서울 송파구 신천동 8', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15131, 667, '도착지', 40, 9, 370, NULL, '37.513342', '127.100155', '서울 송파구 신천동 8', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15132, 668, '도착지', 40, 16, 591, NULL, '37.62174709060577', '126.97697907686234', '서울 종로구 평창동 산 6-1', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15133, 669, '도착지', 40, 16, 591, NULL, '37.62174709060577', '126.97697907686234', '서울 종로구 평창동 산 6-1', '2016-09-02 22:37:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15134, 670, '도착지', 40, 16, 591, NULL, '37.62174709060577', '126.97697907686234', '서울 종로구 평창동 산 6-1', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15135, 671, '도착지', 22, 143, 2387, NULL, '35.8276258', '128.6739499', '대구 수성구 삼덕동 374', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15136, 672, '도착지', 28, 56, 766, NULL, '35.2285451', '128.8893517', '경남 김해시 부원동 623', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15137, 673, '도착지', 25, 182, 3201, NULL, '36.9910113', '127.9259497', '충북 충주시 금릉동 700', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15138, 674, '도착지', 40, 9, 372, NULL, '37.5079608', '127.1006814', '서울 송파구 잠실동 47', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15139, 675, '도착지', 40, 9, 372, NULL, '37.5079608', '127.1006814', '서울 송파구 잠실동 47', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15140, 676, '도착지', 20, 127, 1988, NULL, '37.5069818', '126.7217739', '인천 부평구 부평동 879', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15141, 677, '도착지', 40, 14, 451, NULL, '37.49450565519532', '126.90125830471516', '서울 영등포구 대림동 824-23', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15142, 678, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15143, 679, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15144, 680, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15145, 681, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15146, 682, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15147, 683, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15148, 684, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15149, 685, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15150, 686, '도착지', 18, 84, 1342, NULL, '37.3039008', '127.0101682', '경기 수원시 장안구 조원동 888', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15151, 687, '도착지', 40, 6, 324, NULL, '37.48163754609599', '126.8818112835288', '서울 금천구 가산동 459-11', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15152, 688, '도착지', 18, 101, 1620, NULL, '37.738424', '127.045998', '경기 의정부시 의정부동 168-54', '2016-09-02 22:37:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15153, 689, '도착지', 18, 101, 1620, NULL, '37.738424', '127.045998', '경기 의정부시 의정부동 168-54', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15154, 690, '도착지', 19, 112, 1797, NULL, '35.15699726396676', '129.0600362420082', '부산 부산진구 부전동 156-45', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15155, 691, '도착지', 18, 75, 1226, NULL, '37.603404', '127.143738', '경기 구리시 인창동 244-2', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15156, 692, '도착지', 18, 77, 1254, NULL, '37.65390957703538', '127.24275045096874', '경기 남양주시 호평동 699', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15157, 693, '도착지', 40, 2, 300, NULL, '37.6215554', '127.0254727', '서울 강북구 미아동 234', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15158, 694, '도착지', 40, 2, 300, NULL, '37.6215554', '127.0254727', '서울 강북구 미아동 234', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15159, 695, '도착지', 18, 75, 1224, NULL, '37.597617750510445', '127.14333605021237', '경기 구리시 수택동 486-3', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15160, 696, '도착지', 40, 9, 370, NULL, '37.513342', '127.100155', '서울 송파구 신천동 8', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15161, 697, '도착지', 40, 9, 370, NULL, '37.513342', '127.100155', '서울 송파구 신천동 8', '2016-09-02 22:37:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15162, 698, '도착지', 28, 222, 4011, NULL, '34.8941936', '128.6885165', '경남 거제시 옥포동 526-7', '2016-09-02 22:37:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15163, 699, '도착지', 19, 115, 1820, NULL, '35.0910819', '128.967099', '부산 사하구 신평동 472', '2016-09-02 22:37:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15164, 700, '도착지', 40, 9, 372, NULL, '37.5079608', '127.1006814', '서울 송파구 잠실동 47', '2016-09-02 22:37:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15165, 701, '도착지', 22, 137, 2256, NULL, '35.84019952963974', '128.57511766254902', '대구 남구 대명동 1292', '2016-09-02 22:37:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15166, 702, '도착지', 20, 127, 1988, NULL, '37.490473', '126.723469', '인천 부평구 부평동 224-1', '2016-09-02 22:37:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15167, 703, '도착지', 19, 121, 1923, NULL, '35.1631139', '129.1635509', '부산 해운대구 중동 1378-95', '2016-09-02 22:37:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15168, 704, '도착지', 19, 118, 1853, NULL, '35.1795543', '129.0756416', '부산 연제구 연산동 1000', '2016-09-02 22:37:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15169, 705, '도착지', 29, 252, 4697, NULL, '35.8346387', '127.1287498', '전북 전주시 덕진구 금암동 767-2', '2016-09-02 22:37:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15170, 706, '도착지', 18, 88, 1422, NULL, '37.309685', '126.853656', '경기 안산시 상록구 이동 산 17-2', '2016-09-02 22:37:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15171, 707, '도착지', 18, 88, 1422, NULL, '37.309685', '126.853656', '경기 안산시 상록구 이동 산 17-2', '2016-09-02 22:37:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15172, 708, '도착지', 18, 88, 1422, NULL, '37.309685', '126.853656', '경기 안산시 상록구 이동 산 17-2', '2016-09-02 22:37:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15173, 709, '도착지', 18, 75, 1222, NULL, '37.5943124', '127.1295646', '경기 구리시 교문동 390-1', '2016-09-02 22:37:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15174, 710, '도착지', 18, 75, 1222, NULL, '37.5943124', '127.1295646', '경기 구리시 교문동 390-1', '2016-09-02 22:37:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15175, 711, '도착지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:37:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15176, 712, '도착지', 40, 1, 290, NULL, '37.51912', '127.051937', '서울 강남구 삼성동 111-44', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15177, 713, '도착지', 18, 79, 1279, NULL, '37.4041411', '127.1517072', '경기 성남시 분당구 야탑동 151', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15178, 714, '도착지', 40, 32, 675, NULL, '37.6323917', '127.0780676', '서울 노원구 공릉동 172', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15179, 715, '도착지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15180, 716, '도착지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15181, 717, '도착지', 40, 8, 341, NULL, '37.539705', '126.94604', '서울 마포구 도화동 293-1', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15182, 718, '도착지', 40, 36, 716, NULL, '37.5584944', '126.9345627', '서울 서대문구 창천동 53-4', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15183, 719, '도착지', 40, 10, 378, NULL, '37.484204', '127.015399', '서울 서초구 서초동 1446-1', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15184, 720, '도착지', 40, 17, 617, NULL, '37.5627667', '126.9821314', '서울 중구 명동2가 95-1', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15185, 721, '도착지', 19, 121, 1916, NULL, '35.226202', '129.1513589', '부산 해운대구 반송동 산 51-99', '2016-09-02 22:37:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15186, 722, '도착지', 19, 121, 1916, NULL, '35.226202', '129.1513589', '부산 해운대구 반송동 산 51-99', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15187, 723, '도착지', 27, 209, 3796, 13741, '36.4150799', '129.3659681', '경북 영덕군 영덕읍 남석리 310-3', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15188, 724, '도착지', 27, 209, 3796, 13741, '36.4150799', '129.3659681', '경북 영덕군 영덕읍 남석리 310-3', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15189, 725, '도착지', 18, 81, 1306, NULL, '37.4404832', '127.1798248', '경기 성남시 중원구 상대원동 179', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15190, 726, '도착지', 18, 51, 756, NULL, '37.503394', '126.765962', '경기 부천시 중동 1156', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15191, 727, '도착지', 18, 51, 756, NULL, '37.503394', '126.765962', '경기 부천시 중동 1156', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15192, 728, '도착지', 18, 105, 1700, NULL, '37.1927378', '127.0753719', '경기 화성시 반송동 215', '2016-09-02 22:37:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15193, 729, '도착지', 18, 105, 1700, NULL, '37.1927378', '127.0753719', '경기 화성시 반송동 215', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15194, 730, '도착지', 27, 200, 3538, 12561, '35.798365', '129.138955', '경북 경주시 건천읍 화천리 1319-1', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15195, 731, '도착지', 27, 200, 3538, 12561, '35.798365', '129.138955', '경북 경주시 건천읍 화천리 1319-1', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15196, 732, '도착지', 28, 66, 1075, NULL, '35.353949', '129.0483188', '경남 양산시 신기동 135-2', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15197, 733, '도착지', 28, 234, 4283, NULL, '35.2197859', '128.6857217', '경남 창원시 성산구 상남동 505-4', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15198, 734, '도착지', 40, 284, 5321, NULL, '37.58971', '127.058018', '서울 동대문구 휘경동 317-101', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15199, 735, '도착지', 40, 5, 317, NULL, '37.508562', '126.891336', '서울 구로구 구로동 3-41', '2016-09-02 22:37:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15200, 736, '도착지', 40, 5, 317, NULL, '37.508562', '126.891336', '서울 구로구 구로동 3-41', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15201, 737, '도착지', 40, 5, 317, NULL, '37.508562', '126.891336', '서울 구로구 구로동 3-41', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15202, 738, '도착지', 19, 111, 1785, NULL, '35.2048575', '129.0836402', '부산 동래구 복천동 381', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15203, 739, '도착지', 29, 252, 4710, NULL, '35.8710201', '127.0745059', '전북 전주시 덕진구 여의동 606-4', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15204, 740, '도착지', 40, 1, 295, NULL, '37.497942', '127.027621', '서울 강남구 역삼동 858', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15205, 741, '도착지', 26, 65, 1034, 6079, '36.93209421978142', '127.06301629543304', '충남 아산시 둔포면 석곡리 1584', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15206, 742, '도착지', 40, 8, 336, NULL, '37.5438694027294', '126.95094421505927', '서울 마포구 공덕동 441-3', '2016-09-02 22:37:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15207, 743, '도착지', 40, 284, 5321, NULL, '37.58982546368594', '127.05795362591745', '서울 동대문구 휘경동 317-101', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15208, 744, '도착지', 20, 127, 1988, NULL, '37.5069818', '126.7217739', '인천 부평구 부평동 879', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15209, 745, '도착지', 20, 127, 1988, NULL, '37.5069818', '126.7217739', '인천 부평구 부평동 879', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15210, 746, '도착지', 18, 86, 1376, NULL, '37.4429628', '126.7884082', '경기 시흥시 대야동 491-3', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15211, 747, '도착지', 19, 117, 1847, NULL, '35.1531696', '129.118666', '부산 수영구 광안동 1306-2', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15212, 748, '도착지', 19, 117, 1847, NULL, '35.1531696', '129.118666', '부산 수영구 광안동 1306-2', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15213, 749, '도착지', 19, 117, 1847, NULL, '35.1531696', '129.118666', '부산 수영구 광안동 1306-2', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15214, 750, '도착지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15215, 751, '도착지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15216, 752, '도착지', 20, 131, 2057, NULL, '37.4601908', '126.4406957', '인천 중구 운서동 2851-29', '2016-09-02 22:37:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15217, 753, '도착지', 40, 35, 696, NULL, '37.558129', '126.860606', '서울 강서구 등촌동 666-40', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15218, 754, '도착지', 18, 89, 1444, 6465, '36.9658626', '127.2335449', '경기 안성시 미양면 보체리 365', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15219, 755, '도착지', 40, 10, 384, NULL, '37.5093479', '127.0072738', '서울 서초구 잠원동 70-2', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15220, 756, '도착지', 20, 125, 1973, NULL, '37.4615433', '126.7323595', '인천 남동구 만수동 1117-2', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15221, 757, '도착지', 40, 15, 482, NULL, '37.554531', '126.970663', '서울 용산구 동자동 43-205', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15222, 758, '도착지', 18, 79, 1275, NULL, '37.4044974093575', '127.11152907460927', '경기 성남시 분당구 삼평동 702', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15223, 759, '도착지', 30, 67, 1097, NULL, '34.752888', '127.748766', '전남 여수시 덕충동 61-7', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15224, 760, '도착지', 30, 67, 1097, NULL, '34.752888', '127.748766', '전남 여수시 덕충동 61-7', '2016-09-02 22:37:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15225, 761, '도착지', 40, 16, 535, NULL, '37.58208', '127.001892', '서울 종로구 동숭동 67-2', '2016-09-02 22:37:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15226, 762, '도착지', 24, 158, 2836, NULL, '37.3515232', '127.9467705', '강원 원주시 일산동 211', '2016-09-02 22:37:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15227, 763, '도착지', 18, 79, 1283, NULL, '37.366037', '127.10809', '경기 성남시 분당구 정자동 95-1', '2016-09-02 22:37:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15228, 764, '도착지', 18, 79, 1283, NULL, '37.366037', '127.10809', '경기 성남시 분당구 정자동 95-1', '2016-09-02 22:37:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15229, 765, '도착지', 20, 125, 1967, NULL, '37.4610431', '126.7201088', '인천 남동구 간석동 923-3', '2016-09-02 22:37:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15230, 766, '도착지', 20, 125, 1967, NULL, '37.4610431', '126.7201088', '인천 남동구 간석동 923-3', '2016-09-02 22:37:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15231, 767, '도착지', 20, 125, 1967, NULL, '37.4610431', '126.7201088', '인천 남동구 간석동 923-3', '2016-09-02 22:37:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15232, 768, '도착지', 18, 101, 1620, NULL, '37.738424', '127.045998', '경기 의정부시 의정부동 168-54', '2016-09-02 22:37:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15233, 769, '도착지', 18, 101, 1620, NULL, '37.738424', '127.045998', '경기 의정부시 의정부동 168-54', '2016-09-02 22:37:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15234, 770, '도착지', 40, 17, 617, NULL, '37.5627667', '126.9821314', '서울 중구 명동2가 95-1', '2016-09-02 22:37:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15235, 771, '도착지', 40, 17, 609, NULL, '37.55998', '126.9858296', '서울 중구 남산동2가 9-6', '2016-09-02 22:37:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15236, 772, '도착지', 19, 118, 1852, NULL, '35.19219577003405', '129.07385598868132', '부산 연제구 거제동 1500', '2016-09-02 22:37:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15237, 773, '도착지', 39, 279, 5245, NULL, '35.5048563', '129.4166007', '울산 동구 화정동 222', '2016-09-02 22:37:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15238, 774, '도착지', 40, 17, 665, NULL, '37.566535', '126.9779692', '서울 중구 태평로1가 31', '2016-09-02 22:37:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15239, 775, '도착지', 28, 237, 4403, NULL, '34.8544227', '128.433182', '경남 통영시 무전동 357', '2016-09-02 22:37:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15240, 776, '도착지', 18, 51, 747, NULL, '37.484074', '126.782787', '경기 부천시 심곡본동 316-2', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15241, 777, '도착지', 40, 10, 384, NULL, '37.5110832791301', '127.0208814740181', '서울 서초구 잠원동 99', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15242, 778, '도착지', 18, 91, 1479, NULL, '37.3988877', '126.9251183', '경기 안양시 만안구 안양동 1163-1', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15243, 779, '도착지', 18, 91, 1479, NULL, '37.3988877', '126.9251183', '경기 안양시 만안구 안양동 1163-1', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15244, 780, '도착지', 28, 235, 4305, NULL, '35.2574763', '128.6066035', '경남 창원시 의창구 동정동 708-76', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15245, 781, '도착지', 22, 141, 2363, NULL, '35.875932755880605', '128.59605230391026', '대구 북구 칠성동2가 302-155', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15246, 782, '도착지', 19, 121, 1920, NULL, '35.15882037676051', '129.1556978970766', '부산 해운대구 우동 651-2', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15247, 783, '도착지', 19, 121, 1920, NULL, '35.15882037676051', '129.1556978970766', '부산 해운대구 우동 651-2', '2016-09-02 22:37:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15248, 784, '도착지', 19, 121, 1920, NULL, '35.15882037676051', '129.1556978970766', '부산 해운대구 우동 651-2', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15249, 785, '도착지', 27, 220, 3950, 14918, '35.99162167837649', '129.344159273833', '경북 포항시 남구 연일읍 괴정리 289-1', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15250, 786, '도착지', 27, 220, 3950, 14918, '35.99162167837649', '129.344159273833', '경북 포항시 남구 연일읍 괴정리 289-1', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15251, 787, '도착지', 27, 220, 3950, 14918, '35.99162167837649', '129.344159273833', '경북 포항시 남구 연일읍 괴정리 289-1', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15252, 788, '도착지', 28, 235, 4305, NULL, '35.2574763', '128.6066035', '경남 창원시 의창구 동정동 708-76', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15253, 789, '도착지', 39, 279, 5242, NULL, '35.49578630113331', '129.43089852798772', '울산 동구 일산동', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15254, 790, '도착지', 18, 79, 1273, NULL, '37.394776627382875', '127.11119669891646', '경기 성남시 분당구 백현동 산 4-14', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15255, 791, '도착지', 22, 138, 2264, NULL, '35.8530176720935', '128.56578463905376', '대구 달서구 두류동 산 302-11', '2016-09-02 22:37:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15256, 792, '도착지', 18, 79, 1273, NULL, '37.394776627382875', '127.11119669891646', '경기 성남시 분당구 백현동 산 4-14', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15257, 793, '도착지', 22, 138, 2264, NULL, '35.8530176720935', '128.56578463905376', '대구 달서구 두류동 산 302-11', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15258, 794, '도착지', 18, 85, 1352, NULL, '37.265833557801415', '127.00022547701425', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15259, 795, '도착지', 18, 79, 1283, NULL, '37.366037', '127.10809', '경기 성남시 분당구 정자동 95-1', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15260, 796, '도착지', 40, 1, 287, NULL, '37.51643507392178', '127.02031082477168', '서울 강남구 논현동 279', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15261, 797, '도착지', 30, 67, 1097, NULL, '34.74855779882192', '127.74806487228464', '전남 여수시 덕충동 2000-1', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15262, 798, '도착지', 30, 67, 1093, NULL, '34.74193919881775', '127.73662238068356', '전남 여수시 군자동 472', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15263, 799, '도착지', 30, 67, 1093, NULL, '34.74193919881775', '127.73662238068356', '전남 여수시 군자동 472', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15264, 800, '도착지', 23, 148, 2636, NULL, '35.1653524622591', '126.90926429787295', '광주 북구 중흥동 611-8', '2016-09-02 22:37:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15265, 801, '도착지', 23, 148, 2636, NULL, '35.1653524622591', '126.90926429787295', '광주 북구 중흥동 611-8', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15266, 802, '도착지', 23, 148, 2636, NULL, '35.1653524622591', '126.90926429787295', '광주 북구 중흥동 611-8', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15267, 803, '도착지', 24, 166, 2948, 8695, '38.17363740249997', '127.59510185176546', '강원 화천군 상서면 다목리 1', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15268, 804, '도착지', 23, 149, 2644, NULL, '35.16040851215174', '126.87931030468478', '광주 서구 광천동 49-1', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15269, 805, '도착지', 18, 72, 1197, NULL, '37.67436501484097', '126.7503136761952', '경기 고양시 일산서구 대화동 2240', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15270, 806, '도착지', 18, 72, 1197, NULL, '37.67436501484097', '126.7503136761952', '경기 고양시 일산서구 대화동 2240', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15271, 807, '도착지', 22, 143, 2394, NULL, '35.84256362915039', '128.69419860839844', '대구 수성구 시지동 251-17', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15272, 808, '도착지', 40, 5, 317, NULL, '37.48526057525051', '126.90147308003853', '서울 구로구 구로동 810-3', '2016-09-02 22:37:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15273, 809, '도착지', 27, 200, 3588, NULL, '35.86791229248047', '129.21090698242188', '경북 경주시 황성동 893', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15274, 810, '도착지', 40, 6, 324, NULL, '37.48150957948399', '126.88262835968833', '서울 금천구 가산동 468-4', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15275, 811, '도착지', 19, 112, 1799, NULL, '35.17080607577345', '129.04962077257807', '부산 부산진구 연지동 353-5', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15276, 812, '도착지', 19, 112, 1799, NULL, '35.172102770102306', '129.04776124169655', '부산 부산진구 연지동 406', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15277, 813, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15278, 814, '도착지', 24, 152, 2745, NULL, '37.52472349705013', '129.11429878457704', '강원 동해시 천곡동 806', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15279, 815, '도착지', 40, 1, 287, NULL, '37.51643507392178', '127.02031082477168', '서울 강남구 논현동 279', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15280, 816, '도착지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:37:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15281, 817, '도착지', 19, 112, 1795, NULL, '35.15286441222577', '129.04927148694927', '부산 부산진구 범천동 1155-2', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15282, 818, '도착지', 19, 112, 1795, NULL, '35.15286441222577', '129.04927148694927', '부산 부산진구 범천동 1155-2', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15283, 819, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15284, 820, '도착지', 23, 148, 2616, NULL, '35.22440266314213', '126.8924979504127', '광주 북구 생용동 649', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15285, 821, '도착지', 29, 246, 4637, 17396, '35.946089640509896', '127.68984337459246', '전북 무주군 적상면 사천리 산 144', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15286, 822, '도착지', 29, 246, 4637, 17396, '35.946089640509896', '127.68984337459246', '전북 무주군 적상면 사천리 산 144', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15287, 823, '도착지', 40, 3, 305, NULL, '37.47709324099654', '126.96352390500131', '서울 관악구 봉천동 1693-39', '2016-09-02 22:37:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15288, 824, '도착지', 25, 176, 3062, 9805, '36.85959101958218', '127.43888375791717', '충북 진천군 진천읍 벽암리 569', '2016-09-02 22:37:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15289, 825, '도착지', 39, 281, 5276, 20726, '35.55154319080058', '129.13866004741357', '울산 울주군 삼남면 신화리 88', '2016-09-02 22:37:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15290, 826, '도착지', 18, 84, 1341, NULL, '37.29717875500584', '126.99374718458573', '경기 수원시 장안구 정자동 872-2', '2016-09-02 22:37:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15291, 827, '도착지', 18, 85, 1352, NULL, '37.26568218296588', '127.00004960484385', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:37:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15292, 828, '도착지', 18, 105, 1729, 7397, '37.130747211780026', '126.92174121962746', '경기 화성시 향남읍 행정리 487-1', '2016-09-02 22:37:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15293, 829, '도착지', 40, 1, 295, NULL, '37.500674418599395', '127.03646946846997', '서울 강남구 역삼동 804', '2016-09-02 22:37:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15294, 830, '도착지', 28, 222, 4007, NULL, '34.8677082721213', '128.7018588393325', '경남 거제시 아양동 182', '2016-09-02 22:37:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15295, 831, '도착지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:37:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15296, 832, '도착지', 23, 149, 2644, NULL, '35.16044817188492', '126.87931024610354', '광주 서구 광천동 49-1', '2016-09-02 22:37:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15297, 833, '도착지', 18, 82, 1312, NULL, '37.242671966552734', '126.97727966308594', '경기 수원시 권선구 고색동 958', '2016-09-02 22:37:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15298, 834, '도착지', 18, 74, 1218, NULL, '37.41645134181114', '126.88480397548885', '경기 광명시 일직동 276-8', '2016-09-02 22:37:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15299, 835, '도착지', 40, 1, 295, NULL, '37.4967771303817', '127.02818524559389', '서울 강남구 역삼동 858', '2016-09-02 22:37:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15300, 836, '도착지', 19, 110, 1781, NULL, '35.11454123811815', '129.0393442633158', '부산 동구 초량동 1206-1', '2016-09-02 22:37:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15301, 837, '도착지', 18, 77, 1250, 6386, '37.647229348636266', '127.19736303946753', '경기 남양주시 진건읍 사능리 107', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15302, 838, '도착지', 18, 77, 1250, 6386, '37.647229348636266', '127.19736303946753', '경기 남양주시 진건읍 사능리 107', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15303, 839, '도착지', 18, 77, 1250, 6386, '37.647229348636266', '127.19736303946753', '경기 남양주시 진건읍 사능리 107', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15304, 840, '도착지', 40, 3, 305, NULL, '37.47709324099654', '126.96352390500131', '서울 관악구 봉천동 1693-39', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15305, 841, '도착지', 40, 3, 305, NULL, '37.47709324099654', '126.96352390500131', '서울 관악구 봉천동 1693-39', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15306, 842, '도착지', 40, 5, 317, NULL, '37.48526057525051', '126.90147308003853', '서울 구로구 구로동 810-3', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15307, 843, '도착지', 22, 144, 2421, NULL, '35.871387353753676', '128.60181449109797', '대구 중구 동인동1가 2-1', '2016-09-02 22:37:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15308, 844, '도착지', 22, 144, 2421, NULL, '35.871387353753676', '128.60181449109797', '대구 중구 동인동1가 2-1', '2016-09-02 22:37:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15309, 845, '도착지', 19, 107, 1754, NULL, '35.246583990611526', '129.08852854548093', '부산 금정구 구서동 413-3', '2016-09-02 22:37:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15310, 846, '도착지', 40, 1, 297, NULL, '37.493708322241766', '127.0795269900498', '서울 강남구 일원동 700-9', '2016-09-02 22:37:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15311, 847, '도착지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:37:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15312, 848, '도착지', 24, 165, 2944, 8663, '37.68052673339844', '127.87232208251953', '강원 홍천군 홍천읍 연봉리 376', '2016-09-02 22:37:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15313, 849, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:37:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15314, 850, '도착지', 20, 129, 2016, NULL, '37.391238287428266', '126.6517728136133', '인천 연수구 송도동 3-32', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15315, 851, '도착지', 20, 129, 2016, NULL, '37.374513138362126', '126.6331538447936', '인천 연수구 송도동 12-1', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15316, 852, '도착지', 40, 7, 331, NULL, '37.477591207090164', '126.98169851997037', '서울 동작구 사당동 580-10', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15317, 853, '도착지', 40, 284, 5318, NULL, '37.586509704589844', '127.03851318359375', '서울 동대문구 제기동 856', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15318, 854, '도착지', 18, 91, 1479, NULL, '37.399171709091014', '126.92256523879053', '경기 안양시 만안구 안양동 674-243', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15319, 855, '도착지', 28, 234, 4295, NULL, '35.23141860961914', '128.67311096191406', '경남 창원시 성산구 중앙동 516-2', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15320, 856, '도착지', 18, 80, 1294, NULL, '37.43389129638672', '127.12918090820313', '경기 성남시 수정구 수진동 4808', '2016-09-02 22:37:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15321, 857, '도착지', 29, 253, 4748, NULL, '35.82292175292969', '127.1465835571289', '전북 전주시 완산구 서노송동 602-2', '2016-09-02 22:37:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15322, 858, '도착지', 22, 137, 2256, NULL, '35.854105165827015', '128.58018278577555', '대구 남구 대명동 2139-11', '2016-09-02 22:37:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15323, 859, '도착지', 40, 35, 703, NULL, '37.54165079257094', '126.84045502633539', '서울 강서구 화곡동 1089-54', '2016-09-02 22:37:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15324, 860, '도착지', 26, 194, 3445, NULL, '36.819172479875505', '127.15596145819433', '충남 천안시 동남구 신부동 356-3', '2016-09-02 22:37:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15325, 861, '도착지', 18, 64, 1017, NULL, '37.429286072538346', '127.25513835278178', '경기 광주시 송정동 570', '2016-09-02 22:37:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15326, 862, '도착지', 18, 91, 1479, NULL, '37.398841857910156', '126.92066955566406', '경기 안양시 만안구 안양동 676-91', '2016-09-02 22:37:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15327, 863, '도착지', 18, 91, 1479, NULL, '37.399171709091014', '126.92256523879053', '경기 안양시 만안구 안양동 674-243', '2016-09-02 22:37:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15328, 864, '도착지', 27, 208, 3772, NULL, '36.56151670179663', '128.7017195168196', '경북 안동시 옥동 792-1', '2016-09-02 22:37:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15329, 865, '도착지', 18, 85, 1363, NULL, '37.27823143508543', '127.03096758063916', '경기 수원시 팔달구 지동 505', '2016-09-02 22:37:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15330, 866, '도착지', 40, 6, 324, NULL, '37.47899627685547', '126.87879180908203', '서울 금천구 가산동 426-5', '2016-09-02 22:37:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15331, 867, '도착지', 40, 9, 370, NULL, '37.51331286269902', '127.10022875908237', '서울 송파구 신천동 8', '2016-09-02 22:37:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15332, 868, '도착지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:37:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15333, 869, '도착지', 20, 125, 1969, NULL, '37.455925200122365', '126.70526742296053', '인천 남동구 구월동 1138', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15334, 870, '도착지', 40, 1, 295, NULL, '37.4967771303817', '127.02818524559389', '서울 강남구 역삼동 858', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15335, 871, '도착지', 40, 1, 293, NULL, '37.52115586945625', '127.02283697718428', '서울 강남구 신사동 667-13', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15336, 872, '도착지', 19, 110, 1781, NULL, '35.11454123811815', '129.0393442633158', '부산 동구 초량동 1206-1', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15337, 873, '도착지', 18, 79, 1283, NULL, '37.3661737923199', '127.10809745724355', '경기 성남시 분당구 정자동 95-1', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15338, 874, '도착지', 30, 67, 1098, 6255, '34.73052578910066', '127.7416614484265', '전남 여수시 돌산읍 우두리 794-89', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15339, 875, '도착지', 40, 13, 441, NULL, '37.52613331392425', '126.86462527483147', '서울 양천구 목동 926-3', '2016-09-02 22:37:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15340, 876, '도착지', 27, 60, 897, NULL, '36.13669967651367', '128.4221954345703', '경북 구미시 옥계동 860', '2016-09-02 22:37:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15341, 877, '도착지', 40, 7, 331, NULL, '37.476560430328924', '126.98155858401644', '서울 동작구 사당동 1112', '2016-09-02 22:37:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15342, 878, '도착지', 40, 5, 315, NULL, '37.50161361694336', '126.84663391113281', '서울 구로구 개봉동 92-1', '2016-09-02 22:37:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15343, 879, '도착지', 25, 178, 3086, NULL, '36.65219005621992', '127.5197604200571', '충북 청주시 상당구 명암동 27-2', '2016-09-02 22:37:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15344, 880, '도착지', 25, 178, 3093, NULL, '36.64249463633137', '127.48894863756654', '충북 청주시 상당구 북문로3가 89-1', '2016-09-02 22:37:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15345, 881, '도착지', 25, 180, 3150, NULL, '36.673759519307524', '127.48555768341204', '충북 청주시 청원구 주중동 589-5', '2016-09-02 22:37:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15346, 882, '도착지', 20, 127, 1988, NULL, '37.490180958639066', '126.72445956524815', '인천 부평구 부평동 224-1', '2016-09-02 22:37:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15347, 883, '도착지', 20, 127, 1988, NULL, '37.490180958639066', '126.72445956524815', '인천 부평구 부평동 224-1', '2016-09-02 22:37:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15348, 884, '도착지', 18, 70, 1162, NULL, '37.653074953128204', '126.89567183910656', '경기 고양시 덕양구 삼송동 20-9', '2016-09-02 22:37:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15349, 885, '도착지', 40, 5, 317, NULL, '37.49543308637202', '126.88750531450943', '서울 구로구 구로동 435', '2016-09-02 22:37:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15350, 886, '도착지', 18, 80, 1297, NULL, '37.44502338696028', '127.15677205217493', '경기 성남시 수정구 신흥동 6949', '2016-09-02 22:37:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15351, 887, '도착지', 18, 88, 1414, NULL, '37.30285235924208', '126.8666056400078', '경기 안산시 상록구 본오동 1177', '2016-09-02 22:37:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15352, 888, '도착지', 18, 88, 1414, NULL, '37.30285235924208', '126.8666056400078', '경기 안산시 상록구 본오동 1177', '2016-09-02 22:37:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15353, 889, '도착지', 18, 70, 1162, NULL, '37.653074953128204', '126.89567183910656', '경기 고양시 덕양구 삼송동 20-9', '2016-09-02 22:37:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15354, 890, '도착지', 40, 15, 509, NULL, '37.52925914893749', '126.96796503918327', '서울 용산구 한강로2가 181-1', '2016-09-02 22:37:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15355, 891, '도착지', 40, 4, 308, NULL, '37.53717527255943', '127.08618083779476', '서울 광진구 구의동 245-24', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15356, 892, '도착지', 18, 79, 1275, NULL, '37.40035071854244', '127.10487127861745', '경기 성남시 분당구 삼평동 629', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15357, 893, '도착지', 18, 100, 1600, NULL, '37.344152492461944', '126.9746707147316', '경기 의왕시 고천동 78-3', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15358, 894, '도착지', 19, 112, 1797, NULL, '35.157456', '129.059164', '부산 부산진구 부전동 573-1', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15359, 895, '도착지', 25, 181, 3151, NULL, '36.62675764702577', '127.43097722583185', '충북 청주시 흥덕구 가경동 1416', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15360, 896, '도착지', 18, 97, 1566, NULL, '37.267002680737036', '127.10377513005835', '경기 용인시 기흥구 상갈동 311-3', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15361, 897, '도착지', 18, 51, 742, NULL, '37.50578860265002', '126.75319245027416', '경기 부천시 상동 633', '2016-09-02 22:37:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15362, 898, '도착지', 40, 2, 302, NULL, '37.637884492978024', '127.02551024127918', '서울 강북구 수유동 140', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15363, 899, '도착지', 40, 2, 302, NULL, '37.637884492978024', '127.02551024127918', '서울 강북구 수유동 140', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15364, 900, '도착지', 24, 150, 2662, 7686, '37.691497506844705', '129.03270048248706', '강원 강릉시 강동면 정동진리 303', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15365, 901, '도착지', 25, 181, 3182, 10292, '36.620050543373836', '127.32764562436229', '충북 청주시 흥덕구 오송읍 봉산리 369-1', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15366, 902, '도착지', 18, 76, 1228, NULL, '37.36225509643555', '126.94011688232422', '경기 군포시 금정동 721-8', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15367, 903, '도착지', 18, 98, 1581, NULL, '37.32437738305688', '127.10750502064248', '경기 용인시 수지구 죽전동 1288', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15368, 904, '도착지', 18, 75, 1226, NULL, '37.60197448730469', '127.14330291748047', '경기 구리시 인창동 260-14', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15369, 905, '도착지', 18, 79, 1279, NULL, '37.41178512573242', '127.12879943847656', '경기 성남시 분당구 야탑동 488-1', '2016-09-02 22:37:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15370, 906, '도착지', 40, 11, 397, NULL, '37.560359954833984', '127.06977081298828', '서울 성동구 용답동 237', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15371, 907, '도착지', 20, 127, 1988, NULL, '37.490081787109375', '126.7242431640625', '인천 부평구 부평동 738-21', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15372, 908, '도착지', 40, 15, 482, NULL, '37.553497314453125', '126.97301483154297', '서울 용산구 동자동 14-146', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15373, 909, '도착지', 19, 120, 1889, NULL, '35.106422424316406', '129.0311737060547', '부산 중구 대청동4가 97', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15374, 910, '도착지', 18, 83, 1332, NULL, '37.282840728759766', '127.04619598388672', '경기 수원시 영통구 원천동 산 5-1', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15375, 911, '도착지', 30, 261, NULL, NULL, '35.02750778198242', '126.77861022949219', '전남 나주시 빛가람동 135', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15376, 912, '도착지', 20, 124, 1964, NULL, '37.449161529541016', '126.65274047851563', '인천 남구 용현동 253', '2016-09-02 22:37:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15377, 913, '도착지', 18, 81, 1311, NULL, '37.4277458190918', '127.15335083007813', '경기 성남시 중원구 하대원동 246-4', '2016-09-02 22:37:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15378, 914, '도착지', 23, 148, 2622, NULL, '35.23127365112305', '126.84617614746094', '광주 북구 오룡동 1-2', '2016-09-02 22:37:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15379, 915, '도착지', 18, NULL, NULL, NULL, '37.25175857543945', '127.66460418701172', '경기 여주시 멱곡동 240-13', '2016-09-02 22:37:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15380, 916, '도착지', 19, 120, NULL, NULL, '35.10063934326172', '129.03855895996094', '부산광역시 중구 대교로 116', '2016-09-02 22:37:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15381, 917, '도착지', 40, 16, NULL, NULL, '37.57552719116211', '126.97501373291016', '서울 종로구 세종로 77-1', '2016-09-02 22:37:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15382, 918, '도착지', 18, 92, 1487, NULL, '37.84321975708008', '127.06167602539063', '경기 양주시 덕정동 350-14', '2016-09-02 22:37:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15383, 919, '도착지', 18, 79, 1279, NULL, '37.405330657958984', '127.15116119384766', '경기 성남시 분당구 야탑동 150', '2016-09-02 22:37:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15384, 920, '도착지', 40, 32, 676, NULL, '37.65557098388672', '127.0604248046875', '서울 노원구 상계동 689-4', '2016-09-02 22:37:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15385, 921, '도착지', 18, NULL, NULL, NULL, '37.29694747924805', '127.63339233398438', '경기 여주시 하동 280', '2016-09-02 22:37:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15386, 922, '도착지', 18, NULL, NULL, NULL, '37.298030853271484', '127.63600158691406', '경기 여주시 창동 40-3', '2016-09-02 22:37:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15387, 923, '도착지', 18, NULL, NULL, NULL, '37.29850769042969', '127.63613891601563', '경기 여주시 창동 8', '2016-09-02 22:37:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15388, 924, '도착지', 40, 1, 288, NULL, '37.497859954833984', '127.05744934082031', '서울 강남구 대치동 1026', '2016-09-02 22:37:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15389, 925, '도착지', 21, 134, 2174, NULL, '36.33998107910156', '127.39352416992188', '대전 서구 탄방동 80-9', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15390, 926, '도착지', 25, 179, 3130, NULL, '36.6184196472168', '127.4784927368164', '충북 청주시 서원구 수곡동 355', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15391, 927, '도착지', 26, 187, 3323, NULL, '36.888633728027344', '126.67777252197266', '충남 당진시 시곡동 산 245-1', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15392, 928, '도착지', 26, 187, 3331, NULL, '36.886436462402344', '126.62349700927734', '충남 당진시 채운동 산 33-1', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15393, 929, '도착지', 39, 282, 5300, NULL, '35.55320739746094', '129.29747009277344', '울산 중구 태화동 412-2', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15394, 930, '도착지', 18, 58, 816, NULL, '37.02687072753906', '127.0987319946289', '경기 평택시 칠괴동 582-1', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15395, 931, '도착지', 18, 72, 1197, NULL, '37.672637939453125', '126.7491455078125', '경기 고양시 일산서구 대화동 2269', '2016-09-02 22:37:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15396, 932, '도착지', 18, 105, 1695, 7236, '37.17294692993164', '127.08973693847656', '경기 화성시 동탄면 방교리 829-3', '2016-09-02 22:37:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15397, 933, '도착지', 26, 187, 3321, NULL, '36.88978958129883', '126.64539337158203', '충남 당진시 수청동 1002', '2016-09-02 22:37:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15398, 934, '도착지', 40, 5, 317, NULL, '37.484596252441406', '126.89030456542969', '서울 구로구 구로동 253', '2016-09-02 22:37:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15399, 935, '도착지', 20, 124, 1961, NULL, '37.46870040893555', '126.65412139892578', '인천 남구 도화동 206-1', '2016-09-02 22:37:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15400, 936, '도착지', 19, 120, 1912, NULL, '35.100643157958984', '129.03839111328125', '부산광역시 중구 중앙동6가 8', '2016-09-02 22:37:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15401, 937, '도착지', 18, NULL, NULL, NULL, '37.29793167114258', '127.62547302246094', '경기 여주시 하동 99-3', '2016-09-02 22:37:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15402, 938, '도착지', 22, 138, 2266, NULL, '35.838409423828125', '128.52976989746094', '대구 달서구 본리동 1215-14', '2016-09-02 22:37:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15403, 939, '도착지', 24, 158, 2838, 8208, '37.37206268310547', '127.90162658691406', '강원 원주시 지정면 신평리 977', '2016-09-02 22:37:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15404, 940, '도착지', 40, 35, 696, NULL, '37.556278228759766', '126.85579681396484', '서울 강서구 등촌동 655-46', '2016-09-02 22:37:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15405, 941, '도착지', 40, 1, 290, NULL, '37.505855560302734', '127.05216217041016', '서울 강남구 삼성동 142-43', '2016-09-02 22:37:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15406, 942, '도착지', 26, 194, 3447, NULL, '36.84146499633789', '127.18111419677734', '충남 천안시 동남구 안서동 379-7', '2016-09-02 22:37:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15407, 943, '도착지', 19, 114, 1814, NULL, '35.13774871826172', '128.97598266601563', '부산 사상구 학장동 769', '2016-09-02 22:37:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15408, 944, '도착지', 19, 114, 1814, NULL, '35.13810729980469', '128.97579956054688', '부산 사상구 학장동 750-4', '2016-09-02 22:37:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15409, 945, '도착지', 18, 81, 1309, NULL, '37.463077545166016', '127.17012786865234', '경기 성남시 중원구 은행동 655', '2016-09-02 22:37:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15410, 946, '도착지', 28, 234, 4287, NULL, '35.21446228027344', '128.64561462402344', '경남 창원시 성산구 신촌동 118-6', '2016-09-02 22:37:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15411, 947, '도착지', 21, 135, 2200, NULL, '36.35562515258789', '127.33723449707031', '대전 유성구 봉명동 469-46', '2016-09-02 22:37:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15412, 948, '도착지', 18, 62, 952, 5840, '37.66510009765625', '126.64370727539063', '경기 김포시 양촌읍 석모리 58-9', '2016-09-02 22:37:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15413, 949, '도착지', 18, 62, 952, 5840, '37.654579162597656', '126.6497802734375', '경기 김포시 양촌읍 석모리 865', '2016-09-02 22:37:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15414, 950, '도착지', 20, 125, 1969, NULL, '37.448387145996094', '126.7012939453125', '인천 남동구 구월동 1409', '2016-09-02 22:37:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15415, 951, '도착지', 19, 114, 1814, NULL, '35.137855529785156', '128.97607421875', '부산 사상구 학장동 769', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15416, 952, '도착지', 19, 121, 1923, NULL, '35.16636276245117', '129.16993713378906', '부산 해운대구 중동 1788', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15417, 953, '도착지', 18, 105, 1726, 7353, '37.159263610839844', '126.99271392822266', '경기 화성시 정남면 발산리 347-2', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15418, 954, '도착지', 18, 83, 1333, NULL, '37.300689697265625', '127.0347900390625', '경기 수원시 영통구 이의동 산 94-6', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15419, 955, '도착지', 23, 149, 2661, NULL, '35.15936279296875', '126.87935638427734', '광주 서구 화정동 23-5', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15420, 956, '도착지', 20, 131, 2057, NULL, '37.44989776611328', '126.4518051147461', '인천 중구 운서동 2851', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15421, 957, '도착지', 40, 1, 295, NULL, '37.497398376464844', '127.0294189453125', '서울 강남구 역삼동 825-39', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15422, 958, '도착지', 18, 102, 1641, NULL, '37.25859451293945', '127.45799255371094', '경기 이천시 장록동 산 1-1', '2016-09-02 22:37:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15423, 959, '도착지', 40, 7, 334, NULL, '37.491981506347656', '126.92354583740234', '서울 동작구 신대방동 395-65', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15424, 960, '도착지', 18, 83, 1333, NULL, '37.295719146728516', '127.0537338256836', '경기 수원시 영통구 이의동 산 13-79', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15425, 961, '도착지', 40, 14, 473, NULL, '37.51651382446289', '126.90640258789063', '서울 영등포구 영등포동4가 423-98', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15426, 962, '도착지', 21, 134, 2159, NULL, '36.34971237182617', '127.39490509033203', '대전 서구 둔산동 1513', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15427, 963, '도착지', 18, 99, 1588, 6979, '37.338218688964844', '127.26502227783203', '경기 용인시 처인구 모현면 왕산리 산 55-4', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15428, 964, '도착지', 18, 99, 1588, 6979, '37.33497619628906', '127.26399230957031', '경기 용인시 처인구 모현면 왕산리 175-2', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15429, 965, '도착지', 26, 194, 3447, NULL, '36.82848358154297', '127.17556762695313', '충남 천안시 동남구 안서동 산 131-1', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15430, 966, '도착지', 18, 51, 747, NULL, '37.48407745361328', '126.78280639648438', '경기 부천시 심곡본동 316-2', '2016-09-02 22:37:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15431, 967, '도착지', 40, 8, 342, NULL, '37.55813980102539', '126.9263687133789', '서울 마포구 동교동 173-10', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15432, 968, '도착지', 27, 221, 3993, 15074, '36.09408950805664', '129.41653442382813', '경북 포항시 북구 흥해읍 죽천리 산 13-17', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15433, 969, '도착지', 40, 17, 611, NULL, '37.56010818481445', '126.97843170166016', '서울 중구 남창동 31-5', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15434, 970, '도착지', 40, 9, 370, NULL, '37.52295684814453', '127.09690856933594', '서울 송파구 신천동 1-2', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15435, 971, '도착지', 28, 229, 4126, 15856, '35.31804275512695', '128.2607421875', '경남 의령군 의령읍 중동리 410-4', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15436, 972, '도착지', 18, 71, 1182, NULL, '37.6575813293457', '126.77471160888672', '경기 고양시 일산동구 마두동 1123', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15437, 973, '도착지', 18, 76, 1235, NULL, '37.37131118774414', '126.94263458251953', '경기 군포시 산본동 259-11', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15438, 974, '도착지', 25, 181, 3191, NULL, '36.6461067199707', '127.41963958740234', '충북 청주시 흥덕구 지동동 887', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15439, 975, '도착지', 40, 8, 347, NULL, '37.55216979980469', '126.92369079589844', '서울 마포구 서교동 406', '2016-09-02 22:37:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15440, 976, '도착지', 26, 185, 3287, 10731, '36.19232940673828', '127.448974609375', '충남 금산군 추부면 마전리 755', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15441, 977, '도착지', 40, 6, 324, NULL, '37.478878021240234', '126.87857818603516', '서울 금천구 가산동 426-5', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15442, 978, '도착지', 40, 34, 687, NULL, '37.60275650024414', '126.91480255126953', '서울 은평구 역촌동 66-41', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15443, 979, '도착지', 18, 62, 955, NULL, '37.64412307739258', '126.66895294189453', '경기 김포시 장기동 1791', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15444, 980, '도착지', 24, 158, 2823, NULL, '37.3448600769043', '127.93071746826172', '강원 원주시 단계동 877-1', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15445, 981, '도착지', 18, 76, 1228, NULL, '37.3708610534668', '126.94609832763672', '경기 군포시 금정동 689-33', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15446, 982, '도착지', 20, 124, 1965, NULL, '37.45865249633789', '126.68065643310547', '인천 남구 주안동 186-8', '2016-09-02 22:38:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15447, 983, '도착지', 27, 219, 3937, 14862, '35.9720573425293', '128.4238739013672', '경북 칠곡군 왜관읍 금산리 997-3', '2016-09-02 22:38:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15448, 984, '도착지', 27, 219, 3937, 14862, '35.97227096557617', '128.4239044189453', '경북 칠곡군 왜관읍 금산리 1024', '2016-09-02 22:38:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15449, 985, '도착지', 27, 219, 3937, 14862, '35.971744537353516', '128.4242401123047', '경북 칠곡군 왜관읍 금산리 997-3', '2016-09-02 22:38:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15450, 986, '도착지', 30, 67, 1136, NULL, '34.763187408447266', '127.66653442382813', '전남 여수시 학동 146', '2016-09-02 22:38:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15451, 987, '도착지', 21, 132, 2096, NULL, '36.347347259521484', '127.41485595703125', '대전 대덕구 오정동 490-4', '2016-09-02 22:38:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15452, 988, '도착지', 25, 173, 3012, 9536, '36.96699523925781', '127.50467681884766', '충북 음성군 대소면 소석리 335-1', '2016-09-02 22:38:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15453, 989, '도착지', 40, 10, 378, NULL, '37.49463653564453', '127.02755737304688', '서울 서초구 서초동 1327-33', '2016-09-02 22:38:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15454, 990, '도착지', 40, 10, 378, NULL, '37.49462127685547', '127.02769470214844', '서울 서초구 서초동 1327-33', '2016-09-02 22:38:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15455, 991, '도착지', 18, 79, 1279, NULL, '37.41243362426758', '127.12757873535156', '경기 성남시 분당구 야탑동 488-2', '2016-09-02 22:38:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15456, 992, '도착지', 39, 278, 5221, NULL, '35.54147720336914', '129.3263397216797', '울산 남구 달동 411-18', '2016-09-02 22:38:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15457, 993, '도착지', 39, 278, 5230, NULL, '35.54778289794922', '129.31393432617188', '울산 남구 신정동 326', '2016-09-02 22:38:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15458, 994, '도착지', 39, 278, 5221, NULL, '35.53575134277344', '129.31451416015625', '울산 남구 달동 882-4', '2016-09-02 22:38:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15459, 995, '도착지', 40, 8, 344, NULL, '37.55788803100586', '126.89801788330078', '서울 마포구 망원동 450-3', '2016-09-02 22:38:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15460, 996, '도착지', 25, 170, 2987, 9200, '36.45557403564453', '127.78614807128906', '충북 보은군 탄부면 상장리 산 8-3', '2016-09-02 22:38:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15461, 997, '도착지', 40, 1, 295, NULL, '37.49658966064453', '127.02849578857422', '서울 강남구 역삼동 858', '2016-09-02 22:38:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15462, 998, '도착지', 30, 270, 5126, 19795, '34.328311920166016', '126.71693420410156', '전남 완도군 완도읍 가용리 산 214-79', '2016-09-02 22:38:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15463, 999, '도착지', 19, 109, 1773, NULL, '35.13948440551758', '129.09754943847656', '부산 남구 대연동 314-79', '2016-09-02 22:38:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15464, 1000, '도착지', 26, 194, 3444, NULL, '36.77388000488281', '127.12895202636719', '충남 천안시 동남구 신방동 2077', '2016-09-02 22:38:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15465, 1001, '도착지', 26, 194, 3444, NULL, '36.77336883544922', '127.12942504882813', '충남 천안시 동남구 신방동 1443', '2016-09-02 22:38:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15466, 1002, '도착지', 40, 11, 394, NULL, '37.54002380371094', '127.05332946777344', '서울 성동구 성수동2가 333-133', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15467, 1003, '도착지', 68, NULL, NULL, NULL, '36.601234436035156', '127.2984619140625', '세종특별자치시 조치원읍 원리 14', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15468, 1004, '도착지', 68, NULL, NULL, NULL, '36.60079574584961', '127.30033111572266', '세종특별자치시 조치원읍 원리 101-2', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15469, 1005, '도착지', 29, 252, 4697, NULL, '35.84524154663086', '127.13230895996094', '전북 전주시 덕진구 금암동 663', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15470, 1006, '도착지', 29, 252, 4697, NULL, '35.848121643066406', '127.1310043334961', '전북 전주시 덕진구 금암동 663', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15471, 1007, '도착지', 29, 252, 4699, NULL, '35.84722137451172', '127.12894439697266', '전북 전주시 덕진구 덕진동1가 664-14', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15472, 1008, '도착지', 29, 252, 4697, NULL, '35.84585189819336', '127.12943267822266', '전북 전주시 덕진구 금암동 663', '2016-09-02 22:38:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15473, 1009, '도착지', 29, 252, 4697, NULL, '35.84565353393555', '127.12918853759766', '전북 전주시 덕진구 금암동 663', '2016-09-02 22:38:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15474, 1010, '도착지', 26, 194, 3454, NULL, '36.78775405883789', '127.14791107177734', '충남 천안시 동남구 청수동 270', '2016-09-02 22:38:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15475, 1011, '도착지', 24, 162, 2897, NULL, '37.86237335205078', '127.71886444091797', '강원 춘천시 온의동 산 30-8', '2016-09-02 22:38:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15476, 1012, '도착지', 29, 252, 4697, NULL, '35.84657669067383', '127.13043212890625', '전북 전주시 덕진구 금암동 663', '2016-09-02 22:38:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15477, 1013, '도착지', 19, 114, 1814, NULL, '35.13876724243164', '128.97669982910156', '부산 사상구 학장동 769', '2016-09-02 22:38:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15478, 1014, '도착지', 40, 5, 317, NULL, '37.50312805175781', '126.87977600097656', '서울 구로구 구로동 603-26', '2016-09-02 22:38:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15479, 1015, '도착지', 23, 149, 2655, NULL, '35.15564727783203', '126.86073303222656', '광주 서구 쌍촌동 1301-6', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15480, 1016, '도착지', 22, 141, 2343, NULL, '35.94628143310547', '128.58822631835938', '대구 북구 국우동 1037-24', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15481, 1017, '도착지', 18, 101, 1620, NULL, '37.73261260986328', '127.04083251953125', '경기 의정부시 의정부동 650', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15482, 1018, '도착지', 21, 136, 2244, NULL, '36.2913703918457', '127.37943267822266', '대전 중구 안영동 706', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15483, 1019, '도착지', 20, 124, 1960, NULL, '37.44083786010742', '126.70024871826172', '인천 남구 관교동 15', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15484, 1020, '도착지', 27, 60, 899, NULL, '36.12240219116211', '128.3519744873047', '경북 구미시 원평동 1073-1', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15485, 1021, '도착지', 40, 283, 5308, NULL, '37.546180725097656', '127.15691375732422', '서울 강동구 상일동 172', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15486, 1022, '도착지', 23, 149, 2655, NULL, '35.14767074584961', '126.85916900634766', '광주 서구 쌍촌동 554-11', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15487, 1023, '도착지', 39, 278, 5221, NULL, '35.5335578918457', '129.33998107910156', '울산 남구 달동 1306-7', '2016-09-02 22:38:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15488, 1024, '도착지', 29, 253, 4759, NULL, '35.8343620300293', '127.06187438964844', '전북 전주시 완산구 중동 798', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15489, 1025, '도착지', 26, 185, 3279, 10646, '36.10542401219635', '127.49071636034688', '충남 금산군 금산읍 상리 34-10', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15490, 1026, '도착지', 26, 185, 3279, 10646, '36.10542401219635', '127.49071636034688', '충남 금산군 금산읍 상리 34-10', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15491, 1027, '도착지', 26, 185, 3279, 10646, '36.10542401219635', '127.49071636034688', '충남 금산군 금산읍 상리 34-10', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15492, 1028, '도착지', 28, 230, 4147, NULL, '35.18947321388051', '128.081846752844', '경남 진주시 본성동 500-10', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15493, 1029, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15494, 1030, '도착지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15495, 1031, '도착지', 26, 195, 3459, NULL, '36.810627200167794', '127.11009510021411', '충남 천안시 서북구 불당동 702', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15496, 1032, '도착지', 40, 13, 441, NULL, '37.55072808062136', '126.86557213923145', '서울 양천구 목동 605-22', '2016-09-02 22:38:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15497, 1033, '도착지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15498, 1034, '도착지', 18, 87, 1405, NULL, '37.32156179408051', '126.76679320943153', '경기 안산시 단원구 성곡동 595', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15499, 1035, '도착지', 25, 181, 3176, NULL, '36.61992079460771', '127.38878985520893', '충북 청주시 흥덕구 수의동 196-1', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15500, 1036, '도착지', 26, 194, 3445, NULL, '36.819195045053895', '127.15524419274485', '충남 천안시 동남구 신부동 373-2', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15501, 1037, '도착지', 40, 283, 5305, NULL, '37.537826487415906', '127.14002129594782', '서울 강동구 길동 391-15', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15502, 1038, '도착지', 28, 232, 4211, NULL, '35.21960022938336', '128.5863581039664', '경남 창원시 마산합포구 산호동 10-3', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15503, 1039, '도착지', 19, 114, 1808, NULL, '35.16745529988861', '128.99819837820863', '부산 사상구 괘법동 산 1-25', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15504, 1040, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15505, 1041, '도착지', 40, 14, 468, NULL, '37.51989955490384', '126.9402004323434', '서울 영등포구 여의도동 60', '2016-09-02 22:38:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15506, 1042, '도착지', 40, 1, 293, NULL, '37.52115586945625', '127.02283697718428', '서울 강남구 신사동 667-13', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15507, 1043, '도착지', 40, 1, 289, NULL, '37.48180376394707', '127.04659518891748', '서울 강남구 도곡동 468', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15508, 1044, '도착지', 40, 34, 682, NULL, '37.60080676818251', '126.93582800821706', '서울 은평구 녹번동 55', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15509, 1045, '도착지', 27, 60, 874, NULL, '36.10981235282525', '128.36441624054933', '경북 구미시 광평동 65-1', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15510, 1046, '도착지', 27, 60, 874, NULL, '36.10981235282525', '128.36441624054933', '경북 구미시 광평동 65-1', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15511, 1047, '도착지', 27, 200, 3546, NULL, '35.84088354646664', '129.20735122065642', '경북 경주시 노서동 117-11', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15512, 1048, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15513, 1049, '도착지', 40, 14, 468, NULL, '37.51988516634061', '126.9402547412389', '서울 영등포구 여의도동 60', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15514, 1050, '도착지', 19, 115, 1819, NULL, '35.10618211866893', '128.96848716031184', '부산 사하구 당리동 314', '2016-09-02 22:38:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15515, 1051, '도착지', 26, 193, 3417, 11778, '36.59681554237683', '126.80787551866815', '충남 예산군 광시면 장전리 33', '2016-09-02 22:38:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15516, 1052, '도착지', 30, 263, 4977, NULL, '34.79906693801385', '126.43328084526534', '전남 목포시 상동 1129-7', '2016-09-02 22:38:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15517, 1053, '도착지', 30, 259, 4879, NULL, '34.94042525356365', '127.69593077281218', '전남 광양시 중동 1313', '2016-09-02 22:38:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15518, 1054, '도착지', 21, 133, 2132, NULL, '36.35032437538405', '127.4367522020222', '대전 동구 용전동 63-3', '2016-09-02 22:38:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15519, 1055, '도착지', 40, 1, 288, NULL, '37.49628570476532', '127.05290974941653', '서울 강남구 대치동 1011-28', '2016-09-02 22:38:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15520, 1056, '도착지', 18, 79, 1276, NULL, '37.38501542691264', '127.12343147963557', '경기 성남시 분당구 서현동 263', '2016-09-02 22:38:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15521, 1057, '도착지', 18, 61, 923, NULL, '37.69989941424457', '126.71266346461087', '경기 파주시 산남동 17-3', '2016-09-02 22:38:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15522, 1058, '도착지', 26, 194, 3447, NULL, '36.83940171489423', '127.18528099801087', '충남 천안시 동남구 안서동 115', '2016-09-02 22:38:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15523, 1059, '도착지', 40, 3, 306, NULL, '37.46129338617815', '126.95397365500165', '서울 관악구 신림동 산 56-1', '2016-09-02 22:38:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15524, 1060, '도착지', 40, 13, 442, NULL, '37.52831979007007', '126.83025174395713', '서울 양천구 신월동 149-20', '2016-09-02 22:38:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15525, 1061, '도착지', 40, 1, 290, NULL, '37.5103234156709', '127.04401601638406', '서울 강남구 삼성동 111-147', '2016-09-02 22:38:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15526, 1062, '도착지', 18, 72, 1197, NULL, '37.664544265295184', '126.74190059079334', '경기 고양시 일산서구 대화동 2700', '2016-09-02 22:38:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15527, 1063, '도착지', 18, 100, 1601, NULL, '37.38056800990759', '126.9728880430881', '경기 의왕시 내손동 743-1', '2016-09-02 22:38:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15528, 1064, '도착지', 25, 179, 3129, NULL, '36.61706950186585', '127.45310159570556', '충북 청주시 서원구 성화동 626', '2016-09-02 22:38:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15529, 1065, '도착지', 25, 172, 3006, 9432, '36.300641521772064', '127.57387231942285', '충북 옥천군 옥천읍 문정리 480-1', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15530, 1066, '도착지', 28, 230, 4131, NULL, '35.15386045430688', '128.09872313479798', '경남 진주시 가좌동 산 182-1', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15531, 1067, '도착지', 25, 179, 3129, NULL, '36.617449421909065', '127.4593146634078', '충북 청주시 서원구 성화동 615', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15532, 1068, '도착지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15533, 1069, '도착지', 31, 59, NULL, NULL, '33.50707895781836', '126.49276900424395', '제주특별자치도 제주시 용담2동 2002', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15534, 1070, '도착지', 30, 266, 5065, NULL, '34.96974563598633', '127.49128723144531', '전남 순천시 용당동 540-3', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15535, 1071, '도착지', 40, 17, 662, NULL, '37.56201934814453', '126.99453735351563', '서울 중구 충무로4가 133-23', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15536, 1072, '도착지', 40, 284, 5318, NULL, '37.58582305908203', '127.03474426269531', '서울 동대문구 제기동 134-22', '2016-09-02 22:38:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15537, 1073, '도착지', 18, 77, 1251, 6391, '37.71282613964229', '127.18727083066861', '경기 남양주시 진접읍 금곡리 1081', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15538, 1074, '도착지', 23, 147, 2570, NULL, '35.14659725503049', '126.91990349004317', '광주 동구 광산동 13', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15539, 1075, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15540, 1076, '도착지', 40, 8, 348, NULL, '37.56348718659315', '126.90342559879704', '서울 마포구 성산동 206-1', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15541, 1077, '도착지', 40, 1, 293, NULL, '37.52115586945625', '127.02283697718428', '서울 강남구 신사동 667-13', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15542, 1078, '도착지', 27, 221, 3993, 15073, '36.07185292812126', '129.3419754599214', '경북 포항시 북구 흥해읍 이인리 90-2', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15543, 1079, '도착지', 21, 135, 2210, NULL, '36.38159591166227', '127.35367089916423', '대전 유성구 신성동 7-13', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15544, 1080, '도착지', 27, 220, 3950, 14918, '35.99162167837649', '129.344159273833', '경북 포항시 남구 연일읍 괴정리 289-1', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15545, 1081, '도착지', 40, 17, 623, NULL, '37.555190606633865', '126.97061124330898', '서울 중구 봉래동2가 122-21', '2016-09-02 22:38:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15546, 1082, '도착지', 28, 56, 783, 5406, '35.30616760253906', '128.73387145996094', '경남 김해시 진영읍 여래리 656-4', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15547, 1083, '도착지', 28, 236, 4376, NULL, '35.14963150024414', '128.70689392089844', '경남 창원시 진해구 자은동 985', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15548, 1084, '도착지', 27, 221, 3982, NULL, '36.055366094078', '129.34872110213308', '경북 포항시 북구 우현동 395', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15549, 1085, '도착지', 18, 90, 1473, NULL, '37.40149417095967', '126.9766798551872', '경기 안양시 동안구 관양동 1563', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15550, 1086, '도착지', 40, 35, 703, NULL, '37.54165079257094', '126.84045502633539', '서울 강서구 화곡동 1089-54', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15551, 1087, '도착지', 31, 277, 5202, NULL, '33.24509220552422', '126.41148972857397', '제주특별자치도 서귀포시 색달동 2950-3', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15552, 1088, '도착지', 28, 235, 4305, NULL, '35.2575062903909', '128.6065530841537', '경남 창원시 의창구 동정동 708-76', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15553, 1089, '도착지', 25, 181, 3174, NULL, '36.65196610523134', '127.44318703136607', '충북 청주시 흥덕구 송정동 150', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15554, 1090, '도착지', 18, 86, 1391, NULL, '37.34345986797827', '126.75233434304627', '경기 시흥시 정왕동 1522', '2016-09-02 22:38:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15555, 1091, '도착지', 26, 195, 3465, NULL, '36.80540271535507', '127.1192765265339', '충남 천안시 서북구 쌍용동 1920', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15556, 1092, '도착지', 40, 9, 370, NULL, '37.51331286269902', '127.10022875908237', '서울 송파구 신천동 8', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15557, 1093, '도착지', 28, 232, 4230, NULL, '35.18036078300321', '128.55323473113248', '경남 창원시 마산합포구 월영동 500-2', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15558, 1094, '도착지', 25, 181, 3151, NULL, '36.62533844146412', '127.43170271771157', '충북 청주시 흥덕구 가경동 1449', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15559, 1095, '도착지', 25, 181, 3151, NULL, '36.62533844146412', '127.43170271771157', '충북 청주시 흥덕구 가경동 1449', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15560, 1096, '도착지', 18, 86, 1389, NULL, '37.37679157552156', '126.78808313830667', '경기 시흥시 장곡동 340', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15561, 1097, '도착지', 18, 102, 1633, 7092, '37.251955934757724', '127.48661480369933', '경기 이천시 부발읍 아미리 712-7', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15562, 1098, '도착지', 18, 75, 1226, NULL, '37.602682646193095', '127.14388437110841', '경기 구리시 인창동 677', '2016-09-02 22:38:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15563, 1099, '도착지', 18, 71, 1190, NULL, '37.661481723229855', '126.76831798625773', '경기 고양시 일산동구 장항동 1479', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15564, 1100, '도착지', 40, 12, 402, NULL, '37.603394782557096', '127.02505906491119', '서울 성북구 길음동 1276-2', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15565, 1101, '도착지', 40, 8, 342, NULL, '37.55687074488727', '126.92377856227273', '서울 마포구 동교동 192-5', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15566, 1102, '도착지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15567, 1103, '도착지', 19, 117, 1847, NULL, '35.167275099206925', '129.11513618407426', '부산 수영구 광안동 1091-1', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15568, 1104, '도착지', 27, 203, NULL, NULL, '36.13089745926301', '128.18397509191539', '경북 김천시 율곡동 6-682', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15569, 1105, '도착지', 18, 99, 1588, 6979, '37.337526673680706', '127.24977217962024', '경기 용인시 처인구 모현면 왕산리 799-31', '2016-09-02 22:38:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15570, 1106, '도착지', 29, 254, 4803, NULL, '35.57573462230365', '126.84298606815717', '전북 정읍시 연지동 343-1', '2016-09-02 22:38:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15571, 1107, '도착지', 21, 133, 2107, NULL, '36.2651224150308', '127.47390397997634', '대전 동구 구도동 산 12-8', '2016-09-02 22:38:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15572, 1108, '도착지', 27, 199, 3530, NULL, '35.831679472205515', '128.757050316665', '경북 경산시 조영동 321', '2016-09-02 22:38:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15573, 1109, '도착지', 18, 81, 1308, NULL, '37.4199249073357', '127.12651632305776', '경기 성남시 중원구 여수동 200', '2016-09-02 22:38:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15574, 1110, '도착지', 18, 92, 1500, NULL, '37.85643939534286', '127.09800073836588', '경기 양주시 회암동 194', '2016-09-02 22:38:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15575, 1111, '도착지', 40, 5, 319, NULL, '37.50962980825734', '126.8918814996178', '서울 구로구 신도림동 349-18', '2016-09-02 22:38:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15576, 1112, '도착지', 28, 225, 4044, 15379, '34.77764997213439', '127.85296199333787', '경남 남해군 남면 덕월리 산 9-10', '2016-09-02 22:38:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15577, 1113, '도착지', 40, 10, 378, NULL, '37.48456901455658', '127.01555340818108', '서울 서초구 서초동 1446-1', '2016-09-02 22:38:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15578, 1114, '도착지', 29, 253, 4775, NULL, '35.80947920344449', '127.09086073903381', '전북 전주시 완산구 효자동2가 1070', '2016-09-02 22:38:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15579, 1115, '도착지', 29, 243, 4537, NULL, '35.967466561952094', '126.7368404874667', '전북 군산시 조촌동 888', '2016-09-02 22:38:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15580, 1116, '도착지', 40, 8, 342, NULL, '37.55687074488727', '126.92377856227273', '서울 마포구 동교동 192-5', '2016-09-02 22:38:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15581, 1117, '도착지', 18, 51, 750, NULL, '37.485314358615625', '126.81205932067193', '경기 부천시 역곡동 382', '2016-09-02 22:38:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15582, 1118, '도착지', 26, 190, 3375, NULL, '36.7818502298669', '126.45855123509097', '충남 서산시 동문동 309-3', '2016-09-02 22:38:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15583, 1119, '도착지', 29, 253, 4775, NULL, '35.80947920344449', '127.09086073903381', '전북 전주시 완산구 효자동2가 1070', '2016-09-02 22:38:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15584, 1120, '도착지', 20, 122, 1924, 7464, '37.73991543900796', '126.49047246575974', '인천 강화군 강화읍 남산리 222', '2016-09-02 22:38:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15585, 1121, '도착지', 27, 221, 3972, NULL, '36.0550486685303', '129.3781508650515', '경북 포항시 북구 두호동 685-1', '2016-09-02 22:38:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15586, 1122, '도착지', 40, 1, 287, NULL, '37.5139640251863', '127.03091088854082', '서울 강남구 논현동 279-67', '2016-09-02 22:38:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15587, 1123, '도착지', 40, 1, 287, NULL, '37.5139640251863', '127.03091088854082', '서울 강남구 논현동 279-67', '2016-09-02 22:38:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15588, 1124, '도착지', 30, 263, 4977, NULL, '34.81274205617025', '126.41782064997933', '전남 목포시 상동 220', '2016-09-02 22:38:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15589, 1125, '도착지', 40, 5, 317, NULL, '37.49330994444172', '126.89493103605085', '서울 구로구 구로동 1204', '2016-09-02 22:38:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15590, 1126, '도착지', 18, 51, 755, NULL, '37.506227347517424', '126.81133736089015', '경기 부천시 작동 248-1', '2016-09-02 22:38:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15591, 1127, '도착지', 40, 3, 306, NULL, '37.487652264715216', '126.91350973549139', '서울 관악구 신림동 498', '2016-09-02 22:38:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15592, 1128, '도착지', 40, 13, 441, NULL, '37.52613331392425', '126.86462527483147', '서울 양천구 목동 926-3', '2016-09-02 22:38:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15593, 1129, '도착지', 40, 6, 326, NULL, '37.45474434524018', '126.90050497384404', '서울 금천구 시흥동 1000-48', '2016-09-02 22:38:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15594, 1130, '도착지', 18, 75, 1224, NULL, '37.60163025395872', '127.1439140523767', '경기 구리시 수택동 531-10', '2016-09-02 22:38:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15595, 1131, '도착지', 30, 266, 5053, NULL, '34.96955313020579', '127.48014537858106', '전남 순천시 석현동 313', '2016-09-02 22:38:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15596, 1132, '도착지', 18, 77, 1238, NULL, '37.62735320663453', '127.19976642785706', '경기 남양주시 금곡동 617', '2016-09-02 22:38:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15597, 1133, '도착지', 27, 60, 902, NULL, '36.09104919433594', '128.3594207763672', '경북 구미시 임은동 436-1', '2016-09-02 22:38:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15598, 1134, '도착지', 28, 230, 4151, NULL, '35.18022283419744', '128.10770633569453', '경남 진주시 상대동 284', '2016-09-02 22:38:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15599, 1135, '도착지', 18, 80, 1294, NULL, '37.434038289627686', '127.12997045779946', '경기 성남시 수정구 수진동 4808', '2016-09-02 22:38:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15600, 1136, '도착지', 40, 17, 632, NULL, '37.55450539949841', '127.01089166695671', '서울 중구 신당동 369-44', '2016-09-02 22:38:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15601, 1137, '도착지', 18, 79, 1273, NULL, '37.38786697387695', '127.11429595947266', '경기 성남시 분당구 백현동 546-6', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15602, 1138, '도착지', 40, 1, 289, NULL, '37.48457591094836', '127.03416413339725', '서울 강남구 도곡동 958-2', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15603, 1139, '도착지', 40, 1, 289, NULL, '37.48457591094836', '127.03416413339725', '서울 강남구 도곡동 958-2', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15604, 1140, '도착지', 40, 2, 300, NULL, '37.62321247729869', '127.02711374602072', '서울 강북구 미아동 317-1', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15605, 1141, '도착지', 27, 60, 890, NULL, '36.11957084874237', '128.3442463610701', '경북 구미시 송정동 50', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15606, 1142, '도착지', 18, 77, NULL, NULL, '37.70262684878739', '127.12484979898062', '경기 남양주시 별내면 광전리 122-6', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15607, 1143, '도착지', 40, 12, 440, NULL, '37.60505119509541', '127.03099384004011', '서울 성북구 하월곡동 230', '2016-09-02 22:38:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15608, 1144, '도착지', 18, 77, NULL, NULL, '37.70262684878739', '127.12484979898062', '경기 남양주시 별내면 광전리 122-6', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15609, 1145, '도착지', 40, 12, 440, NULL, '37.60505119509541', '127.03099384004011', '서울 성북구 하월곡동 230', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15610, 1146, '도착지', 20, 126, 1981, NULL, '37.48196182638611', '126.63353366362091', '인천 동구 송현동 66-21', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15611, 1147, '도착지', 18, 90, 1473, NULL, '37.40149417095967', '126.9766798551872', '경기 안양시 동안구 관양동 1563', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15612, 1148, '도착지', 18, 90, 1473, NULL, '37.40149417095967', '126.9766798551872', '경기 안양시 동안구 관양동 1563', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15613, 1149, '도착지', 18, 77, 1253, NULL, '37.64610816805995', '127.2420633545854', '경기 남양주시 평내동 599', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15614, 1150, '도착지', 40, 32, 675, NULL, '37.61746529854062', '127.07465673256156', '서울 노원구 공릉동 678-1', '2016-09-02 22:38:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15615, 1151, '도착지', 18, 104, 1673, NULL, '37.53296327781605', '127.20092184668422', '경기 하남시 덕풍동 524', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15616, 1152, '도착지', 40, 2, 300, NULL, '37.626086276872286', '127.01980594034514', '서울 강북구 미아동 797', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15617, 1153, '도착지', 24, 154, 2796, NULL, '38.20451748764293', '128.59024746887695', '강원 속초시 중앙동 471-4', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15618, 1154, '도착지', 18, 77, 1251, 6394, '37.756333901749485', '127.17679063008875', '경기 남양주시 진접읍 부평리 산 99-31', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15619, 1155, '도착지', 18, 75, 1222, NULL, '37.59435957776788', '127.12964638272388', '경기 구리시 교문동 390-1', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15620, 1156, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15621, 1157, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15622, 1158, '도착지', 24, 165, 2937, 8592, '37.77056383050761', '128.38763100137575', '강원 홍천군 내면 창촌리 1610-3', '2016-09-02 22:38:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15623, 1159, '도착지', 40, 9, 366, NULL, '37.52053406288515', '127.12081278327528', '서울 송파구 방이동 88-3', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15624, 1160, '도착지', 40, 9, 366, NULL, '37.52053406288515', '127.12081278327528', '서울 송파구 방이동 88-3', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15625, 1161, '도착지', 40, 8, 347, NULL, '37.551008875567355', '126.92106853325372', '서울 마포구 서교동 367-5', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15626, 1162, '도착지', 31, 59, NULL, NULL, '33.50707895781836', '126.49276900424395', '제주특별자치도 제주시 용담2동 2002', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15627, 1163, '도착지', 20, 128, 2002, NULL, '37.600467851919824', '126.66632302607111', '인천 서구 마전동 998-6', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15628, 1164, '도착지', 24, 154, 2794, NULL, '38.20806729509192', '128.52753317606695', '강원 속초시 장사동 24-9', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15629, 1165, '도착지', 18, 61, 936, 5769, '37.954295005089655', '126.91927812006023', '경기 파주시 적성면 마지리 62-18', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15630, 1166, '도착지', 24, 150, 2707, NULL, '37.75466904182594', '128.87981487642506', '강원 강릉시 홍제동 992-2', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15631, 1167, '도착지', 40, 5, 317, NULL, '37.50334245844327', '126.88230919182318', '서울 구로구 구로동 563-8', '2016-09-02 22:38:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15632, 1168, '도착지', 20, 127, 1990, NULL, '37.50768075424764', '126.73172419242755', '인천 부평구 삼산동 465-1', '2016-09-02 22:38:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15633, 1169, '도착지', 18, 77, 1249, NULL, '37.61047033918707', '127.17122138853124', '경기 남양주시 지금동 159-7', '2016-09-02 22:38:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15634, 1170, '도착지', 18, 72, 1197, NULL, '37.67615737707501', '126.74750097096687', '경기 고양시 일산서구 대화동 2502', '2016-09-02 22:38:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15635, 1171, '도착지', 19, 117, 1848, NULL, '35.142015067339194', '129.1078383228962', '부산 수영구 남천동 78', '2016-09-02 22:38:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15636, 1172, '도착지', 20, 127, 1987, NULL, '37.488477043182044', '126.74073008970379', '인천 부평구 부개동 468', '2016-09-02 22:38:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15637, 1173, '도착지', 40, 13, 443, NULL, '37.5175608045363', '126.86587598956869', '서울 양천구 신정동 321-5', '2016-09-02 22:38:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15638, 1174, '도착지', 40, 34, 681, NULL, '37.60980983870889', '126.90899680427647', '서울 은평구 구산동 182-45', '2016-09-02 22:38:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15639, 1175, '도착지', 22, 138, 2279, NULL, '35.81387971406731', '128.52307976997767', '대구 달서구 진천동 808-9', '2016-09-02 22:38:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15640, 1176, '도착지', 30, 266, 5072, NULL, '34.97325936202112', '127.51961550642945', '전남 순천시 조례동 766', '2016-09-02 22:38:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15641, 1177, '도착지', 22, 138, 2279, NULL, '35.81103510956587', '128.52851728652834', '대구 달서구 진천동 253-9', '2016-09-02 22:38:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15642, 1178, '도착지', 26, 194, 3447, NULL, '36.83848219682803', '127.18320702468809', '충남 천안시 동남구 안서동 393', '2016-09-02 22:38:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15643, 1179, '도착지', 40, 9, 372, NULL, '37.51162635872962', '127.08631432791267', '서울 송파구 잠실동 21', '2016-09-02 22:38:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15644, 1180, '도착지', 18, 99, 1590, NULL, '37.24102997923786', '127.17748233087254', '경기 용인시 처인구 삼가동 556', '2016-09-02 22:38:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15645, 1181, '도착지', 40, 6, 324, NULL, '37.46647993420019', '126.88926238402915', '서울 금천구 가산동 717', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15646, 1182, '도착지', 39, 281, 5276, 20723, '35.54404558274729', '129.10428232297485', '울산 울주군 삼남면 교동리 산 145', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15647, 1183, '도착지', 28, 230, 4151, NULL, '35.18022283419744', '128.10770633569453', '경남 진주시 상대동 284', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15648, 1184, '도착지', 28, 230, 4151, NULL, '35.18022283419744', '128.10770633569453', '경남 진주시 상대동 284', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15649, 1185, '도착지', 40, 9, 373, NULL, '37.470741868975324', '127.12672400973611', '서울 송파구 장지동 596-21', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15650, 1186, '도착지', 40, 1, 296, NULL, '37.47028926846895', '127.11831723594402', '서울 강남구 율현동 101-13', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15651, 1187, '도착지', 18, 61, 928, NULL, '37.7599269846849', '126.78037195964926', '경기 파주시 아동동 215-1', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15652, 1188, '도착지', 19, 121, 1920, NULL, '35.169171621214346', '129.1362561625503', '부산 해운대구 우동 1500', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15653, 1189, '도착지', 21, 134, 2159, NULL, '36.35210037231445', '127.40003967285156', '대전 서구 둔산동 1812', '2016-09-02 22:38:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15654, 1190, '도착지', 22, 138, 2279, NULL, '35.81103510956587', '128.52851728652834', '대구 달서구 진천동 253-9', '2016-09-02 22:38:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15655, 1191, '도착지', 22, 141, 2357, NULL, '35.90716464544278', '128.60705466490478', '대구 북구 산격동 1621', '2016-09-02 22:38:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15656, 1192, '도착지', 28, 235, 4323, NULL, '35.24224875471703', '128.6951799438806', '경남 창원시 의창구 용동 186', '2016-09-02 22:38:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15657, 1193, '도착지', 21, 134, 2159, NULL, '36.35289447442', '127.40076428314703', '대전 서구 둔산동 1812', '2016-09-02 22:38:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15658, 1194, '도착지', 18, 77, 1255, 6400, '37.684031872328205', '127.30580418903038', '경기 남양주시 화도읍 가곡리 279-21', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15659, 1195, '도착지', 19, 118, 1852, NULL, '35.19278254314604', '129.07359927548745', '부산 연제구 거제동 1500', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15660, 1196, '도착지', 18, 92, 1481, NULL, '37.80306442728654', '127.08226479711827', '경기 양주시 고읍동 441', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15661, 1197, '도착지', 24, 152, 2745, NULL, '37.52474150479658', '129.11429929300965', '강원 동해시 천곡동 806', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15662, 1198, '도착지', 18, 83, 1332, NULL, '37.27620166556182', '127.05304848445547', '경기 수원시 영통구 원천동 80', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15663, 1199, '도착지', 22, 143, 2402, NULL, '35.84678338427256', '128.6277635372978', '대구 수성구 황금동 626', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15664, 1200, '도착지', 19, 118, 1853, NULL, '35.17974453860173', '129.07507679139442', '부산 연제구 연산동 1000', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15665, 1201, '도착지', 18, 77, 1254, NULL, '37.65488800291432', '127.2486691697829', '경기 남양주시 호평동 669', '2016-09-02 22:38:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15666, 1202, '도착지', 19, 118, 1853, NULL, '35.17974453860173', '129.07507679139442', '부산 연제구 연산동 1000', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15667, 1203, '도착지', 19, 114, 1813, NULL, '35.15169306252401', '128.99791374226578', '부산 사상구 주례동 721-1', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15668, 1204, '도착지', 19, 114, 1813, NULL, '35.15169306252401', '128.99791374226578', '부산 사상구 주례동 721-1', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15669, 1205, '도착지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15670, 1206, '도착지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15671, 1207, '도착지', 23, 148, 2608, NULL, '35.18562977946419', '126.8635508627861', '광주 북구 동림동 44', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15672, 1208, '도착지', 20, 122, 1936, 7550, '37.592896085547196', '126.45758035585837', '인천 강화군 화도면 동막리 7-3', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15673, 1209, '도착지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:38:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15674, 1210, '도착지', 20, 124, 1965, NULL, '37.46591559112053', '126.68704720170881', '인천 남구 주안동 20-1', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15675, 1211, '도착지', 40, 284, 5316, NULL, '37.57235270309624', '127.07167756114302', '서울 동대문구 장안동 469-15', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15676, 1212, '도착지', 40, 35, 693, NULL, '37.5589508457596', '126.80287456918128', '서울 강서구 공항동 1373', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15677, 1213, '도착지', 40, 32, 675, NULL, '37.618459513198964', '127.07540530057803', '서울 노원구 공릉동 678-1', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15678, 1214, '도착지', 24, 164, 2928, 8492, '37.67314428094014', '128.70497002697866', '강원 평창군 대관령면 횡계리 366-1', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15679, 1215, '도착지', 28, 56, 773, NULL, '35.23530958961825', '128.8784957223768', '경남 김해시 서상동 312', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15680, 1216, '도착지', 28, 56, 773, NULL, '35.23530958961825', '128.8784957223768', '경남 김해시 서상동 312', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15681, 1217, '도착지', 40, 1, 292, NULL, '37.48756024879805', '127.10241053071529', '서울 강남구 수서동 719', '2016-09-02 22:38:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15682, 1218, '도착지', 19, 113, 1804, NULL, '35.20989700050215', '129.00711746900902', '부산 북구 덕천동 329', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15683, 1219, '도착지', 18, 87, 1410, NULL, '37.31938203906419', '126.81865572081814', '경기 안산시 단원구 초지동 666-1', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15684, 1220, '도착지', 40, 16, 547, NULL, '37.56914696867927', '126.97864706815112', '서울 종로구 서린동 125-3', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15685, 1221, '도착지', 18, 79, 1279, NULL, '37.413116078692354', '127.12720069662858', '경기 성남시 분당구 야탑동 341', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15686, 1222, '도착지', 18, 51, 744, NULL, '37.48280032710237', '126.79564427244556', '경기 부천시 소사본동 395', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15687, 1223, '도착지', 40, 16, NULL, NULL, '37.585828034386694', '126.99589693118722', '서울 종로구 명륜3가 53', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15688, 1224, '도착지', 19, 118, 1853, NULL, '35.1787720582919', '129.07587305654206', '부산 연제구 연산동 1422-2', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15689, 1225, '도착지', 40, 15, 501, NULL, '37.52033615112305', '126.97261810302734', '서울 용산구 이촌동 301-5', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15690, 1226, '도착지', 40, 5, 319, NULL, '37.506526947021484', '126.876220703125', '서울 구로구 신도림동 290', '2016-09-02 22:38:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15691, 1227, '도착지', 28, 231, 4192, 16139, '35.54106140136719', '128.5017852783203', '경남 창녕군 창녕읍 교상리 28-22', '2016-09-02 22:38:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15692, 1228, '도착지', 28, 222, 3995, NULL, '34.88053904543107', '128.62112946297455', '경남 거제시 고현동 717', '2016-09-02 22:38:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15693, 1229, '도착지', 40, 5, 317, NULL, '37.48526057525051', '126.90147308003853', '서울 구로구 구로동 810-3', '2016-09-02 22:38:42');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15694, 1230, '도착지', 40, 1, 295, NULL, '37.500674418599395', '127.03646946846997', '서울 강남구 역삼동 804', '2016-09-02 22:38:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15695, 1231, '도착지', 28, 230, 4151, NULL, '35.18022283419744', '128.10770633569453', '경남 진주시 상대동 284', '2016-09-02 22:38:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15696, 1232, '도착지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:38:43');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15697, 1233, '도착지', 40, 3, 306, NULL, '37.48426803614822', '126.92974537412343', '서울 관악구 신림동 1467-10', '2016-09-02 22:38:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15698, 1234, '도착지', 40, 17, 623, NULL, '37.555190606633865', '126.97061124330898', '서울 중구 봉래동2가 122-21', '2016-09-02 22:38:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15699, 1235, '도착지', 40, 284, 5316, NULL, '37.57009044228191', '127.06994576606365', '서울 동대문구 장안동 372-5', '2016-09-02 22:38:44');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15700, 1236, '도착지', 22, 141, 2360, NULL, '35.938729297849335', '128.552306032531', '대구 북구 읍내동 967-1', '2016-09-02 22:38:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15701, 1237, '도착지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:38:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15702, 1238, '도착지', 21, 134, 2159, NULL, '36.3518686679449', '127.3781748770077', '대전 서구 둔산동 1038', '2016-09-02 22:38:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15703, 1239, '도착지', 25, 178, 3097, NULL, '36.628929652275446', '127.49274024853521', '충북 청주시 상당구 서운동 90-1', '2016-09-02 22:38:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15704, 1240, '도착지', 18, 103, 1657, 7200, '37.92032280165607', '127.16874823606165', '경기 포천시 신북면 심곡리 748-1', '2016-09-02 22:38:45');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15705, 1241, '도착지', 40, 14, 473, NULL, '37.51745029731331', '126.90414555537026', '서울 영등포구 영등포동4가 442', '2016-09-02 22:38:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15706, 1242, '도착지', 20, 122, 1924, 7464, '37.73991543900796', '126.49047246575974', '인천 강화군 강화읍 남산리 222', '2016-09-02 22:38:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15707, 1243, '도착지', 40, 14, 473, NULL, '37.51745029731331', '126.90414555537026', '서울 영등포구 영등포동4가 442', '2016-09-02 22:38:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15708, 1244, '도착지', 30, 263, 4977, NULL, '34.81274205617025', '126.41782064997933', '전남 목포시 상동 220', '2016-09-02 22:38:46');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15709, 1245, '도착지', 26, 190, 3394, 11451, '36.691970839067125', '126.58332619028525', '충남 서산시 해미면 대곡리 303', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15710, 1246, '도착지', 28, 56, 775, NULL, '35.253041293193306', '128.88752686205913', '경남 김해시 어방동 산 2-80', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15711, 1247, '도착지', 28, 56, 775, NULL, '35.253041293193306', '128.88752686205913', '경남 김해시 어방동 산 2-80', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15712, 1248, '도착지', 27, 200, 3569, NULL, '35.842784433263354', '129.28645723437197', '경북 경주시 신평동 375', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15713, 1249, '도착지', 29, 253, 4773, NULL, '35.81482430876925', '127.15255709107237', '전북 전주시 완산구 풍남동3가 64-1', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15714, 1250, '도착지', 40, 17, 632, NULL, '37.55450539949841', '127.01089166695671', '서울 중구 신당동 369-44', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15715, 1251, '도착지', 21, 134, 2159, NULL, '36.3577766418457', '127.39534759521484', '대전 서구 둔산동 1515', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15716, 1252, '도착지', 40, 34, 684, NULL, '37.60917663574219', '126.93131256103516', '서울 은평구 불광동 285-28', '2016-09-02 22:38:47');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15717, 1253, '도착지', 30, 261, 4908, NULL, '35.05019198383142', '126.72109505001326', '전남 나주시 대호동 49-7', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15718, 1254, '도착지', 18, 99, 1590, NULL, '37.237709045410156', '127.17684173583984', '경기 용인시 처인구 삼가동 241-30', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15719, 1255, '도착지', 18, 51, 744, NULL, '37.48280032710237', '126.79564427244556', '경기 부천시 소사본동 395', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15720, 1256, '도착지', 18, 101, 1620, NULL, '37.73377990722656', '127.03443145751953', '경기 의정부시 의정부동 323', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15721, 1257, '도착지', 40, 4, 313, NULL, '37.54278990014184', '127.07628857139248', '서울 광진구 화양동 393-1', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15722, 1258, '도착지', 22, 141, 2340, NULL, '35.88132365285674', '128.58617573733838', '대구 북구 고성동3가 2', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15723, 1259, '도착지', 40, 284, 5316, NULL, '37.57235270309624', '127.07167756114302', '서울 동대문구 장안동 469-15', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15724, 1260, '도착지', 28, 237, 4396, 16273, '34.87572901490357', '128.41353078605295', '경남 통영시 광도면 죽림리 384-11', '2016-09-02 22:38:48');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15725, 1261, '도착지', 40, 5, 317, NULL, '37.484580140614135', '126.89808198370609', '서울 구로구 구로동 188-26', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15726, 1262, '도착지', 40, 5, 317, NULL, '37.484580140614135', '126.89808198370609', '서울 구로구 구로동 188-26', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15727, 1263, '도착지', 18, 85, 1352, NULL, '37.26568218296588', '127.00004960484385', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15728, 1264, '도착지', 18, 87, 1398, NULL, '37.3160120850251', '126.83849638923743', '경기 안산시 단원구 고잔동 167-378', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15729, 1265, '도착지', 18, 91, 1479, NULL, '37.384460419154614', '126.93559279166685', '경기 안양시 만안구 안양동 1163-1', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15730, 1266, '도착지', 40, 1, 289, NULL, '37.489546568827336', '127.0316606804403', '서울 강남구 도곡동 958-2', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15731, 1267, '도착지', 40, 1, 289, NULL, '37.4858858386157', '127.04032017012884', '서울 강남구 도곡동 907-41', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15732, 1268, '도착지', 39, 278, 5224, NULL, '35.54425862941922', '129.25956716126524', '울산 남구 무거동 730', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15733, 1269, '도착지', 25, 173, 3012, 9538, '36.98144749272959', '127.47069884751846', '충북 음성군 대소면 오류리 597-1', '2016-09-02 22:38:49');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15734, 1270, '도착지', 28, 235, 4315, NULL, '35.23798370361328', '128.6947479248047', '경남 창원시 의창구 사림동 1-2', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15735, 1271, '도착지', 39, 278, 5226, NULL, '35.53973947748005', '129.35278088964643', '울산 남구 삼산동 271-12', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15736, 1272, '도착지', 18, 51, 756, NULL, '37.503511779291365', '126.76603845092598', '경기 부천시 중동 1156', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15737, 1273, '도착지', 20, 127, 1988, NULL, '37.5070416849512', '126.72187321551391', '인천 부평구 부평동 879', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15738, 1274, '도착지', 40, 1, 295, NULL, '37.501998839984495', '127.03029525498411', '서울 강남구 역삼동 635', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15739, 1275, '도착지', 40, 1, 295, NULL, '37.501998839984495', '127.03029525498411', '서울 강남구 역삼동 635', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15740, 1276, '도착지', 40, 1, 295, NULL, '37.501998839984495', '127.03029525498411', '서울 강남구 역삼동 635', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15741, 1277, '도착지', 22, 141, 2340, NULL, '35.88132365285674', '128.58617573733838', '대구 북구 고성동3가 2', '2016-09-02 22:38:50');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15742, 1278, '도착지', 40, 283, 5306, NULL, '37.53053636803378', '127.14238804032844', '서울 강동구 둔촌동 77-7', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15743, 1279, '도착지', 40, 1, 287, NULL, '37.519592620543484', '127.03408959682889', '서울 강남구 논현동 70-6', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15744, 1280, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15745, 1281, '도착지', 40, 12, 438, NULL, '37.61104143164265', '126.99861825789493', '서울 성북구 정릉동 861-1', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15746, 1282, '도착지', 28, 235, 4322, NULL, '35.22684097290039', '128.68263244628906', '경남 창원시 의창구 신월동 501-42', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15747, 1283, '도착지', 29, 243, 4495, NULL, '35.9530427744445', '126.68988191421451', '전북 군산시 나운동 1234-31', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15748, 1284, '도착지', 18, 62, 946, 5820, '37.59185715400261', '126.79352573394344', '경기 김포시 고촌읍 전호리 248-1', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15749, 1285, '도착지', 18, 62, 946, 5820, '37.59185715400261', '126.79352573394344', '경기 김포시 고촌읍 전호리 248-1', '2016-09-02 22:38:51');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15750, 1286, '도착지', 18, 91, 1479, NULL, '37.40185680342681', '126.92264379414527', '경기 안양시 만안구 안양동 88-1', '2016-09-02 22:38:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15751, 1287, '도착지', 40, 4, 308, NULL, '37.534278567940355', '127.09441419289622', '서울 광진구 구의동 546-1', '2016-09-02 22:38:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15752, 1288, '도착지', 40, 4, 308, NULL, '37.534278567940355', '127.09441419289622', '서울 광진구 구의동 546-1', '2016-09-02 22:38:52');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15753, 1289, '도착지', 40, 4, 308, NULL, '37.534278567940355', '127.09441419289622', '서울 광진구 구의동 546-1', '2016-09-02 22:38:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15754, 1290, '도착지', 40, 14, 476, NULL, '37.52270938388496', '126.9051795669678', '서울 영등포구 영등포동7가 23-1', '2016-09-02 22:38:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15755, 1291, '도착지', 40, 3, 305, NULL, '37.48804529085015', '126.94362250394929', '서울 관악구 봉천동 1694', '2016-09-02 22:38:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15756, 1292, '도착지', 18, 79, 1276, NULL, '37.38501542691264', '127.12343147963557', '경기 성남시 분당구 서현동 263', '2016-09-02 22:38:53');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15757, 1293, '도착지', 20, 123, 1938, NULL, '37.54330795337714', '126.7277312168998', '인천 계양구 계산동 1014', '2016-09-02 22:38:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15758, 1294, '도착지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:38:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15759, 1295, '도착지', 18, 80, 1297, NULL, '37.44502338696028', '127.15677205217493', '경기 성남시 수정구 신흥동 6949', '2016-09-02 22:38:54');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15760, 1296, '도착지', 22, 144, 2419, NULL, '35.869461372633275', '128.59594332731166', '대구 중구 동성로2가 174', '2016-09-02 22:38:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15761, 1297, '도착지', 18, 87, 1398, NULL, '37.32384474804588', '126.83914755228126', '경기 안산시 단원구 고잔동 672', '2016-09-02 22:38:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15762, 1298, '도착지', 18, 77, 1252, 6399, '37.64846655934172', '127.14437604861273', '경기 남양주시 퇴계원면 퇴계원리 224-2', '2016-09-02 22:38:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15763, 1299, '도착지', 22, 138, 2267, NULL, '35.818926658974426', '128.5377635503462', '대구 달서구 상인동 204-4', '2016-09-02 22:38:55');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15764, 1300, '도착지', 30, 266, 5072, NULL, '34.97325936202112', '127.51961550642945', '전남 순천시 조례동 766', '2016-09-02 22:38:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15765, 1301, '도착지', 26, 189, 3365, 11283, '36.33002866251813', '126.79722135172123', '충남 부여군 은산면 나령리 59-5', '2016-09-02 22:38:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15766, 1302, '도착지', 40, 8, 341, NULL, '37.53955493112621', '126.94586483454732', '서울 마포구 도화동 293-1', '2016-09-02 22:38:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15767, 1303, '도착지', 40, 13, 441, NULL, '37.52957538439464', '126.87464274281626', '서울 양천구 목동 920-2', '2016-09-02 22:38:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15768, 1304, '도착지', 40, 13, 442, NULL, '37.520978080372146', '126.83769365011497', '서울 양천구 신월동 838', '2016-09-02 22:38:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15769, 1305, '도착지', 40, 8, 348, NULL, '37.56304079135412', '126.90403737296438', '서울 마포구 성산동 206-14', '2016-09-02 22:38:56');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15770, 1306, '도착지', 18, 98, 1578, NULL, '37.30109382635591', '127.07020569806816', '경기 용인시 수지구 상현동 385-2', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15771, 1307, '도착지', 26, 193, 3426, 11904, '36.67363070250424', '126.7879869397861', '충남 예산군 오가면 신장리 913-1', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15772, 1308, '도착지', 25, 181, 3161, NULL, '36.63251889269194', '127.43952461346507', '충북 청주시 흥덕구 복대동 48-2', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15773, 1309, '도착지', 40, 3, 306, NULL, '37.487652264715216', '126.91350973549139', '서울 관악구 신림동 498', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15774, 1310, '도착지', 29, 252, 4714, NULL, '35.84985312471829', '127.16180338401975', '전북 전주시 덕진구 우아동3가 235', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15775, 1311, '도착지', 20, 127, 1988, NULL, '37.48944904290551', '126.72433108861824', '인천 부평구 부평동 738-21', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15776, 1312, '도착지', 23, 145, 2535, NULL, '35.17952752985636', '126.79991305097671', '광주 광산구 하남동 662', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15777, 1313, '도착지', 18, 51, 748, NULL, '37.517783989071745', '126.76259136356065', '경기 부천시 약대동 192', '2016-09-02 22:38:57');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15778, 1314, '도착지', 28, 234, 4295, NULL, '35.22634856932314', '128.68220101498613', '경남 창원시 성산구 중앙동 501-44', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15779, 1315, '도착지', 29, 247, 4640, 17424, '35.7016361472384', '126.78817742225702', '전북 부안군 백산면 평교리 205', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15780, 1316, '도착지', 40, 32, 676, NULL, '37.64855603250328', '127.0631297667031', '서울 노원구 상계동 761-1', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15781, 1317, '도착지', 24, 165, 2944, 8669, '37.68897139031863', '127.87870476505354', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15782, 1318, '도착지', 24, 165, 2944, 8669, '37.68897139031863', '127.87870476505354', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15783, 1319, '도착지', 24, 165, 2944, 8669, '37.68897139031863', '127.87870476505354', '강원 홍천군 홍천읍 희망리 393', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15784, 1320, '도착지', 29, 247, 4643, 17446, '35.72702654456769', '126.73686877752536', '전북 부안군 부안읍 봉덕리 574-13', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15785, 1321, '도착지', 20, 125, 1971, NULL, '37.40094023476658', '126.73349208197902', '인천 남동구 논현동 731-7', '2016-09-02 22:38:58');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15786, 1322, '도착지', 18, 96, 1550, NULL, '37.144717163328686', '127.06663012264562', '경기 오산시 오산동 603-117', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15787, 1323, '도착지', 29, 253, 4776, NULL, '35.81786479148458', '127.10799090518942', '전북 전주시 완산구 효자동3가 1529-6', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15788, 1324, '도착지', 68, NULL, NULL, NULL, '36.601431718221704', '127.29649209390175', '세종특별자치시 조치원읍 원리 141-54', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15789, 1325, '도착지', 18, 82, 1312, NULL, '37.23939875916694', '126.97949777519275', '경기 수원시 권선구 고색동 994', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15790, 1326, '도착지', 18, 102, 1632, 7069, '37.33933559722216', '127.44599776663945', '경기 이천시 백사면 경사리 615-3', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15791, 1327, '도착지', 20, 127, 1988, NULL, '37.48944904290551', '126.72433108861824', '인천 부평구 부평동 738-21', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15792, 1328, '도착지', 18, 86, 1391, NULL, '37.34551197443122', '126.68745730761127', '경기 시흥시 정왕동 2003-16', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15793, 1329, '도착지', 40, 17, 668, NULL, '37.561396584016876', '126.99415073577897', '서울 중구 필동2가 13-9', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15794, 1330, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15795, 1331, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:38:59');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15796, 1332, '도착지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15797, 1333, '도착지', 40, 9, 370, NULL, '37.52071241244563', '127.10380874948677', '서울 송파구 신천동 15', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15798, 1334, '도착지', 40, 4, 307, NULL, '37.54529917156773', '127.10352146450712', '서울 광진구 광장동 550-11', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15799, 1335, '도착지', 22, 138, 2275, NULL, '35.853404250215966', '128.50881672600124', '대구 달서구 이곡동 1252-7', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15800, 1336, '도착지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15801, 1337, '도착지', 22, 140, 2322, NULL, '35.87932399317953', '128.62839377538833', '대구 동구 신암동 294', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15802, 1338, '도착지', 40, 12, 439, NULL, '37.602095614954045', '127.03223376789059', '서울 성북구 종암동 3-1260', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15803, 1339, '도착지', 40, 12, 439, NULL, '37.602095614954045', '127.03223376789059', '서울 성북구 종암동 3-1260', '2016-09-02 22:39:00');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15804, 1340, '도착지', 18, 61, 934, 5755, '37.796214638087356', '126.79258587550426', '경기 파주시 월롱면 위전리 415-1', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15805, 1341, '도착지', 18, 86, 1391, NULL, '37.335800985622285', '126.72610777030845', '경기 시흥시 정왕동 1367-1', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15806, 1342, '도착지', 18, 87, 1398, NULL, '37.31679730521738', '126.82303913031186', '경기 안산시 단원구 고잔동 453-53', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15807, 1343, '도착지', 19, 112, 1792, NULL, '35.14623366716292', '129.02084253109868', '부산 부산진구 개금동 633-165', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15808, 1344, '도착지', 29, 253, 4773, NULL, '35.81482430876925', '127.15255709107237', '전북 전주시 완산구 풍남동3가 64-1', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15809, 1345, '도착지', 28, 227, 4084, NULL, '34.940517273545005', '128.08598792709412', '경남 사천시 벌리동 254-1', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15810, 1346, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15811, 1347, '도착지', 24, 162, 2908, NULL, '37.864054077430815', '127.72381891212392', '강원 춘천시 퇴계동 633-2', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15812, 1348, '도착지', 40, 10, 380, NULL, '37.46810747846022', '127.03924802915745', '서울 서초구 양재동 232', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15813, 1349, '도착지', 40, 10, 378, NULL, '37.4870094866119', '127.01067381139782', '서울 서초구 서초동 1582-2', '2016-09-02 22:39:01');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15814, 1350, '도착지', 20, 129, 2016, NULL, '37.392845871982196', '126.63861605572936', '인천 연수구 송도동 24-5', '2016-09-02 22:39:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15815, 1351, '도착지', 40, 16, 547, NULL, '37.56914696867927', '126.97864706815112', '서울 종로구 서린동 125-3', '2016-09-02 22:39:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15816, 1352, '도착지', 27, 221, 3993, 15073, '36.07185292812126', '129.3419754599214', '경북 포항시 북구 흥해읍 이인리 90-2', '2016-09-02 22:39:02');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15817, 1353, '도착지', 40, 7, 333, NULL, '37.49656030219593', '126.95775617972956', '서울 동작구 상도동 511', '2016-09-02 22:39:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15818, 1354, '도착지', 29, 253, 4766, NULL, '35.81581166002562', '127.12128414017971', '전북 전주시 완산구 중화산동2가 626-17', '2016-09-02 22:39:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15819, 1355, '도착지', 40, 37, 728, NULL, '37.61100669513336', '127.09950802390377', '서울 중랑구 신내동 317', '2016-09-02 22:39:03');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15820, 1356, '도착지', 21, 133, 2131, NULL, '36.32811281367827', '127.46153533919224', '대전 동구 용운동 296-3', '2016-09-02 22:39:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15821, 1357, '도착지', 40, 7, 333, NULL, '37.49656030219593', '126.95775617972956', '서울 동작구 상도동 511', '2016-09-02 22:39:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15822, 1358, '도착지', 18, 51, 747, NULL, '37.48398888429165', '126.78308174352948', '경기 부천시 심곡본동 316-2', '2016-09-02 22:39:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15823, 1359, '도착지', 24, 154, 2795, NULL, '38.188846656071604', '128.60245242925495', '강원 속초시 조양동 1463-52', '2016-09-02 22:39:04');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15824, 1360, '도착지', 40, 6, 325, NULL, '37.470185992336795', '126.89851753405262', '서울 금천구 독산동 286-9', '2016-09-02 22:39:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15825, 1361, '도착지', 40, 6, 325, NULL, '37.470185992336795', '126.89851753405262', '서울 금천구 독산동 286-9', '2016-09-02 22:39:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15826, 1362, '도착지', 40, 8, 336, NULL, '37.544541689753366', '126.9514511776477', '서울 마포구 공덕동 237-9', '2016-09-02 22:39:05');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15827, 1363, '도착지', 28, 236, 4336, NULL, '35.14400721019664', '128.65828407869847', '경남 창원시 진해구 남빈동 1', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15828, 1364, '도착지', 18, 79, 1275, NULL, '37.40205604363057', '127.10821222694533', '경기 성남시 분당구 삼평동 681', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15829, 1365, '도착지', 23, 148, 2636, NULL, '35.1653524622591', '126.90926429787295', '광주 북구 중흥동 611-8', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15830, 1366, '도착지', 29, 63, 965, NULL, '35.93412601455984', '126.9633682319701', '전북 익산시 동산동 1054-4', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15831, 1367, '도착지', 40, 5, 317, NULL, '37.49543308637202', '126.88750531450943', '서울 구로구 구로동 435', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15832, 1368, '도착지', 29, 247, 4641, 17431, '35.648405608865104', '126.5864688282564', '전북 부안군 변산면 중계리 산 11-1', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15833, 1369, '도착지', 18, 70, 1151, NULL, '37.70336002472634', '126.90374790024094', '경기 고양시 덕양구 고양동 195-1', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15834, 1370, '도착지', 40, 14, 469, NULL, '37.51568369538624', '126.90787602747027', '서울 영등포구 영등포동 618-501', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15835, 1371, '도착지', 40, 38, 731, NULL, '37.667438366275526', '127.04432172130706', '서울 도봉구 방학동 728', '2016-09-02 22:39:06');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15836, 1372, '도착지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15837, 1373, '도착지', 40, 14, 477, NULL, '37.52690124511719', '126.90471649169922', '서울 영등포구 영등포동8가 35-1', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15838, 1374, '도착지', 18, 97, 1569, NULL, '37.27165039099916', '127.10565311106964', '경기 용인시 기흥구 신갈동 83', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15839, 1375, '도착지', 40, 14, 468, NULL, '37.52595901489258', '126.92610168457031', '서울 영등포구 여의도동 23-1', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15840, 1376, '도착지', 18, 64, 1017, NULL, '37.41947937011719', '127.26341247558594', '경기 광주시 송정동 52-1', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15841, 1377, '도착지', 20, 125, 1971, NULL, '37.4006589466073', '126.72245208012724', '인천 남동구 논현동 720', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15842, 1378, '도착지', 18, 90, 1473, NULL, '37.39423950914369', '126.9638080221341', '경기 안양시 동안구 관양동 1608-1', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15843, 1379, '도착지', 30, 262, 4947, 18907, '35.324607601755424', '126.88566553433476', '전남 담양군 수북면 대방리 산 121-2', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15844, 1380, '도착지', 40, 1, 295, NULL, '37.50733539597168', '127.03397092159534', '서울 강남구 역삼동 800', '2016-09-02 22:39:07');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15845, 1381, '도착지', 18, 87, 1406, NULL, '37.32240439489478', '126.75744888642531', '경기 안산시 단원구 신길동 1059', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15846, 1382, '도착지', 40, 4, 307, NULL, '37.54132567433566', '127.09726998197203', '서울 광진구 광장동 470-3', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15847, 1383, '도착지', 40, 4, 308, NULL, '37.54469680786133', '127.08319091796875', '서울 광진구 구의동 253-19', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15848, 1384, '도착지', 26, 188, 3343, NULL, '36.31023173007065', '126.51348159278403', '충남 보령시 신흑동 2267-3', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15849, 1385, '도착지', 20, 131, 2057, NULL, '37.44936435548172', '126.45054938392819', '인천 중구 운서동 2851', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15850, 1386, '도착지', 19, 106, 1746, NULL, '35.09381103515625', '128.84181213378906', '부산 강서구 송정동 1547-4', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15851, 1387, '도착지', 40, 4, 308, NULL, '37.534244537353516', '127.09465026855469', '서울 광진구 구의동 546-1', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15852, 1388, '도착지', 40, 9, 368, NULL, '37.50175094604492', '127.10914611816406', '서울 송파구 석촌동 295-8', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15853, 1389, '도착지', 19, 118, 1853, NULL, '35.17393493652344', '129.08856201171875', '부산 연제구 연산동 1938-26', '2016-09-02 22:39:08');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15854, 1390, '도착지', 20, 127, 1991, NULL, '37.470821380615234', '126.7029037475586', '인천 부평구 십정동 541', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15855, 1391, '도착지', 18, 85, 1352, NULL, '37.26578140258789', '127.00008392333984', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15856, 1392, '도착지', 40, 8, 342, NULL, '37.55735778808594', '126.92709350585938', '서울 마포구 동교동 190-1', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15857, 1393, '도착지', 18, 99, 1596, 7021, '37.13976812985371', '127.19676183630415', '경기 용인시 처인구 이동면 송전리 683-2', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15858, 1394, '도착지', 18, 99, 1594, 7009, '37.20055389404297', '127.32535552978516', '경기 용인시 처인구 원삼면 맹리 115-5', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15859, 1395, '도착지', 29, 249, 4673, 17715, '35.838223117378575', '127.05322118393346', '전북 완주군 이서면 갈산리 645', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15860, 1396, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15861, 1397, '도착지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:39:09');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15862, 1398, '도착지', 20, 129, 2016, NULL, '37.38520451270635', '126.64432113601606', '인천 연수구 송도동 8-14', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15863, 1399, '도착지', 18, 82, NULL, NULL, '37.268585205078125', '127.0666275024414', '경기도 수원시 원천동 277-2', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15864, 1400, '도착지', 18, 82, 1320, NULL, '37.25395202636719', '127.01118469238281', '경기 수원시 권선구 세류동 1033-6', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15865, 1401, '도착지', 18, 105, 1721, 7327, '37.08226499554334', '126.816198996609', '경기 화성시 우정읍 조암리 340-12', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15866, 1402, '도착지', 40, 4, 308, NULL, '37.53511803859746', '127.09474110186275', '서울 광진구 구의동 546-6', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15867, 1403, '도착지', 18, 87, 1405, NULL, '37.323281475733246', '126.76705416015956', '경기 안산시 단원구 성곡동 590', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15868, 1404, '도착지', 39, 278, 5226, NULL, '35.538631439208984', '129.33932495117188', '울산 남구 삼산동 1480-4', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15869, 1405, '도착지', 30, 67, 1097, NULL, '34.75346755981445', '127.7493667602539', '전남 여수시 덕충동 61-58', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15870, 1406, '도착지', 19, 106, 1748, NULL, '35.09778223321576', '128.86809754736453', '부산 강서구 신호동 185', '2016-09-02 22:39:10');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15871, 1407, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:39:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15872, 1408, '도착지', 18, 71, 1182, NULL, '37.659480619982965', '126.77340596087173', '경기 고양시 일산동구 마두동 1123', '2016-09-02 22:39:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15873, 1409, '도착지', 40, 3, 306, NULL, '37.4838981628418', '126.9026870727539', '서울 관악구 신림동 1643-6', '2016-09-02 22:39:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15874, 1410, '도착지', 20, 125, 1968, NULL, '37.40510646432806', '126.6961055970423', '인천 남동구 고잔동 636', '2016-09-02 22:39:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15875, 1411, '도착지', 19, 110, 1781, NULL, '35.11454123811815', '129.0393442633158', '부산 동구 초량동 1206-1', '2016-09-02 22:39:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15876, 1412, '도착지', 40, 14, 465, NULL, '37.53815685406801', '126.89333386706853', '서울 영등포구 양평동5가 66-1', '2016-09-02 22:39:11');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15877, 1413, '도착지', 18, 75, 1226, NULL, '37.60327074050881', '127.14335098418687', '경기 구리시 인창동 244-2', '2016-09-02 22:39:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15878, 1414, '도착지', 22, 144, 2433, NULL, '35.86810214429573', '128.60003011258596', '대구 중구 삼덕동2가 3-4', '2016-09-02 22:39:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15879, 1415, '도착지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:39:12');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15880, 1416, '도착지', 22, 141, 2358, NULL, '35.92089324197178', '128.5971446101181', '대구 북구 서변동 1791', '2016-09-02 22:39:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15881, 1417, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:39:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15882, 1418, '도착지', 18, 86, 1391, NULL, '37.34015752323391', '126.73363478920487', '경기 시흥시 정왕동 2121-1', '2016-09-02 22:39:13');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15883, 1419, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:39:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15884, 1420, '도착지', 18, 90, 1473, NULL, '37.399279424976655', '126.96872066447891', '경기 안양시 동안구 관양동 792-2', '2016-09-02 22:39:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15885, 1421, '도착지', 40, 13, 441, NULL, '37.55072808062136', '126.86557213923145', '서울 양천구 목동 605-22', '2016-09-02 22:39:14');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15886, 1422, '도착지', 27, 200, 3565, NULL, '35.844440582025584', '129.21793213335278', '경북 경주시 성동동 40', '2016-09-02 22:39:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15887, 1423, '도착지', 27, 200, 3577, NULL, '35.834370509908695', '129.22708810469297', '경북 경주시 인왕동 517', '2016-09-02 22:39:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15888, 1424, '도착지', 18, 51, 746, NULL, '37.489952712873624', '126.77874506227796', '경기 부천시 심곡동 424', '2016-09-02 22:39:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15889, 1425, '도착지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:39:15');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15890, 1426, '도착지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:39:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15891, 1427, '도착지', 25, 181, 3151, NULL, '36.62351738746277', '127.4309189402372', '충북 청주시 흥덕구 가경동 566', '2016-09-02 22:39:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15892, 1428, '도착지', 40, 10, 376, NULL, '37.50607506279143', '127.00698950489821', '서울 서초구 반포동 19-4', '2016-09-02 22:39:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15893, 1429, '도착지', 18, 101, 1620, NULL, '37.73859786987305', '127.04829406738281', '경기 의정부시 의정부동 145-3', '2016-09-02 22:39:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15894, 1430, '도착지', 40, 10, 376, NULL, '37.50607506279143', '127.00698950489821', '서울 서초구 반포동 19-4', '2016-09-02 22:39:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15895, 1431, '도착지', 40, 1, 299, NULL, '37.5233979641418', '127.05459861373723', '서울 강남구 청담동 68-22', '2016-09-02 22:39:16');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15896, 1432, '도착지', 39, 281, 5279, 20756, '35.3816446703662', '129.345063469635', '울산 울주군 서생면 화정리 307-2', '2016-09-02 22:39:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15897, 1433, '도착지', 39, 281, 5279, 20756, '35.3816446703662', '129.345063469635', '울산 울주군 서생면 화정리 307-2', '2016-09-02 22:39:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15898, 1434, '도착지', 18, 79, 1278, NULL, '37.378468767404556', '127.11428884629078', '경기 성남시 분당구 수내동 14', '2016-09-02 22:39:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15899, 1435, '도착지', 40, 10, 380, NULL, '37.46441211899264', '127.04274569163807', '서울 서초구 양재동 231', '2016-09-02 22:39:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15900, 1436, '도착지', 40, 5, 317, NULL, '37.482931346363216', '126.89607168694211', '서울 구로구 구로동 222-8', '2016-09-02 22:39:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15901, 1437, '도착지', 24, 153, 2757, NULL, '37.44411849975586', '129.16790771484375', '강원 삼척시 남양동 349-1', '2016-09-02 22:39:17');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15902, 1438, '도착지', 26, 198, 3499, 12390, '36.60131356853811', '126.6605732905562', '충남 홍성군 홍성읍 오관리 98', '2016-09-02 22:39:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15903, 1439, '도착지', 19, 107, 1758, NULL, '35.28384380936477', '129.09502424557996', '부산 금정구 노포동 133', '2016-09-02 22:39:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15904, 1440, '도착지', 19, 107, 1758, NULL, '35.28384380936477', '129.09502424557996', '부산 금정구 노포동 133', '2016-09-02 22:39:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15905, 1441, '도착지', 19, 107, 1758, NULL, '35.28384380936477', '129.09502424557996', '부산 금정구 노포동 133', '2016-09-02 22:39:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15906, 1442, '도착지', 19, 107, 1758, NULL, '35.28384380936477', '129.09502424557996', '부산 금정구 노포동 133', '2016-09-02 22:39:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15907, 1443, '도착지', 40, 16, 559, NULL, '37.576147809222206', '127.0021599452984', '서울 종로구 연건동 218-1', '2016-09-02 22:39:18');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15908, 1444, '도착지', 18, 101, 1619, NULL, '37.73990209651041', '127.0838648853637', '경기 의정부시 용현동 291-1', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15909, 1445, '도착지', 31, 59, 842, 5557, '33.41224066391835', '126.39292746214927', '제주특별자치도 제주시 애월읍 소길리 155-101', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15910, 1446, '도착지', 21, 134, 2159, NULL, '36.35226793694333', '127.37844418310412', '대전 서구 둔산동 1036', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15911, 1447, '도착지', 40, 10, 376, NULL, '37.50607506279143', '127.00698950489821', '서울 서초구 반포동 19-4', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15912, 1448, '도착지', 27, 219, 3937, 14869, '35.98255157470703', '128.39781188964844', '경북 칠곡군 왜관읍 왜관리 777-34', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15913, 1449, '도착지', 24, 154, 2795, NULL, '38.190135161483134', '128.60414251396503', '강원 속초시 조양동 1450-158', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15914, 1450, '도착지', 28, 234, 4295, NULL, '35.22634856932314', '128.68220101498613', '경남 창원시 성산구 중앙동 501-44', '2016-09-02 22:39:19');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15915, 1451, '도착지', 18, 61, 940, 5801, '37.788174254448144', '126.69895306284312', '경기 파주시 탄현면 법흥리 1652-239', '2016-09-02 22:39:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15916, 1452, '도착지', 18, 61, 929, NULL, '37.71114480623873', '126.74956429850049', '경기 파주시 야당동 1023', '2016-09-02 22:39:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15917, 1453, '도착지', 18, 99, 1597, 7028, '37.26721221736258', '127.21363872279483', '경기 용인시 처인구 포곡읍 둔전리 406-78', '2016-09-02 22:39:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15918, 1454, '도착지', 24, 154, 2795, NULL, '38.190135161483134', '128.60414251396503', '강원 속초시 조양동 1450-158', '2016-09-02 22:39:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15919, 1455, '도착지', 23, 148, 2615, NULL, '35.20036145890434', '126.90051073798318', '광주 북구 삼각동 793-1', '2016-09-02 22:39:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15920, 1456, '도착지', 23, 148, 2620, NULL, '35.21159092919886', '126.87561911605687', '광주 북구 양산동 209-7', '2016-09-02 22:39:20');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15921, 1457, '도착지', 20, 131, 2057, NULL, '37.459841', '126.440526', '인천 중구 운서동 2851-29', '2016-09-02 22:39:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15922, 1458, '도착지', 18, 93, 1509, 6674, '37.49268433970432', '127.49224761141845', '경기 양평군 양평읍 양근리 130-36', '2016-09-02 22:39:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15923, 1459, '도착지', 28, 56, NULL, NULL, '35.162219419446345', '128.8230664138395', '경남 김해시 장유동 산 62-7', '2016-09-02 22:39:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15924, 1460, '도착지', 40, 9, 370, NULL, '37.51331286269902', '127.10022875908237', '서울 송파구 신천동 8', '2016-09-02 22:39:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15925, 1461, '도착지', 23, 149, 2644, NULL, '35.16040851215174', '126.87931030468478', '광주 서구 광천동 49-1', '2016-09-02 22:39:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15926, 1462, '도착지', 23, 149, 2644, NULL, '35.16040851215174', '126.87931030468478', '광주 서구 광천동 49-1', '2016-09-02 22:39:21');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15927, 1463, '도착지', 18, 71, 1190, NULL, '37.661481723229855', '126.76831798625773', '경기 고양시 일산동구 장항동 1479', '2016-09-02 22:39:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15928, 1464, '도착지', 30, 263, 4977, NULL, '34.81274205617025', '126.41782064997933', '전남 목포시 상동 220', '2016-09-02 22:39:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15929, 1465, '도착지', 39, 278, 5226, NULL, '35.53712055755428', '129.34679559740036', '울산 남구 삼산동 1632-9', '2016-09-02 22:39:22');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15930, 1466, '도착지', 39, 278, 5226, NULL, '35.539390563964844', '129.349853515625', '울산 남구 삼산동 1640-14', '2016-09-02 22:39:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15931, 1467, '도착지', 39, 278, 5226, NULL, '35.54193115234375', '129.34738159179688', '울산 남구 삼산동 204-10', '2016-09-02 22:39:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15932, 1468, '도착지', 39, 278, 5226, NULL, '35.53712055755428', '129.34679559740036', '울산 남구 삼산동 1632-9', '2016-09-02 22:39:23');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15933, 1469, '도착지', 39, 278, 5226, NULL, '35.5404882323112', '129.33726731901112', '울산 남구 삼산동 1527-1', '2016-09-02 22:39:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15934, 1470, '도착지', 39, 278, 5226, NULL, '35.53712055755428', '129.34679559740036', '울산 남구 삼산동 1632-9', '2016-09-02 22:39:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15935, 1471, '도착지', 40, 12, 407, NULL, '37.592746552955326', '127.01665384165037', '서울 성북구 동선동4가 1-3', '2016-09-02 22:39:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15936, 1472, '도착지', 40, 12, 407, NULL, '37.592746552955326', '127.01665384165037', '서울 성북구 동선동4가 1-3', '2016-09-02 22:39:24');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15937, 1473, '도착지', 40, 12, 407, NULL, '37.592746552955326', '127.01665384165037', '서울 성북구 동선동4가 1-3', '2016-09-02 22:39:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15938, 1474, '도착지', 18, 74, 1219, NULL, '37.47619284245366', '126.8682110270142', '경기 광명시 철산동 526', '2016-09-02 22:39:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15939, 1475, '도착지', 18, 85, 1352, NULL, '37.26568218296588', '127.00004960484385', '경기 수원시 팔달구 매산로1가 18', '2016-09-02 22:39:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15940, 1476, '도착지', 18, 70, 1151, NULL, '37.70051193237305', '126.90180206298828', '경기 고양시 덕양구 고양동 244-4', '2016-09-02 22:39:25');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15941, 1477, '도착지', 40, 14, 473, NULL, '37.517107045076564', '126.90307818513716', '서울 영등포구 영등포동4가 442', '2016-09-02 22:39:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15942, 1478, '도착지', 18, 72, 1197, NULL, '37.66886108414803', '126.74657812775558', '경기 고양시 일산서구 대화동 2307', '2016-09-02 22:39:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15943, 1479, '도착지', 40, 10, 378, NULL, '37.49460983276367', '127.02755737304688', '서울 서초구 서초동 1327-33', '2016-09-02 22:39:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15944, 1480, '도착지', 26, 198, 3499, 12382, '36.60094584887662', '126.67609653718097', '충남 홍성군 홍성읍 고암리 1042', '2016-09-02 22:39:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15945, 1481, '도착지', 19, 121, 1920, NULL, '35.168948006660365', '129.13176399757842', '부산 해운대구 우동 1524', '2016-09-02 22:39:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15946, 1482, '도착지', 40, 4, 310, NULL, '37.54796267822114', '127.0746552568707', '서울 광진구 능동 463-1', '2016-09-02 22:39:26');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15947, 1483, '도착지', 40, 9, 373, NULL, '37.47863169330987', '127.12617656737004', '서울 송파구 장지동 201-5', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15948, 1484, '도착지', 40, 10, 376, NULL, '37.50607506279143', '127.00698950489821', '서울 서초구 반포동 19-4', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15949, 1485, '도착지', 19, 121, 1923, NULL, '35.158523217078375', '129.15985466848417', '부산 해운대구 중동 1015', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15950, 1486, '도착지', 30, 263, 5014, NULL, '34.79117899358166', '126.38664835784691', '전남 목포시 호남동 1-1', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15951, 1487, '도착지', 30, 263, 5014, NULL, '34.79117899358166', '126.38664835784691', '전남 목포시 호남동 1-1', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15952, 1488, '도착지', 22, 143, 2383, NULL, '35.84081171127522', '128.70512554266782', '대구 수성구 매호동 812-2', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15953, 1489, '도착지', 40, 32, 676, NULL, '37.67788146568163', '127.05535096878126', '서울 노원구 상계동 1132-9', '2016-09-02 22:39:27');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15954, 1490, '도착지', 20, 129, 2015, NULL, '37.42694348032102', '126.69892317975973', '인천 연수구 선학동 255-4', '2016-09-02 22:39:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15955, 1491, '도착지', 30, 263, 5014, NULL, '34.79117899358166', '126.38664835784691', '전남 목포시 호남동 1-1', '2016-09-02 22:39:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15956, 1492, '도착지', 30, 67, 1120, NULL, '34.75008025639963', '127.70562683988071', '전남 여수시 여서동 373', '2016-09-02 22:39:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15957, 1493, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:39:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15958, 1494, '도착지', 40, 1, 289, NULL, '37.486939466131744', '127.04671144838751', '서울 강남구 도곡동 179-2', '2016-09-02 22:39:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15959, 1495, '도착지', 40, 7, 327, NULL, '37.51405479610082', '126.9421098821243', '서울 동작구 노량진동 67-2', '2016-09-02 22:39:28');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15960, 1496, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15961, 1497, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15962, 1498, '도착지', 19, 108, 1768, 7416, '35.259964567533096', '129.2337495161953', '부산 기장군 일광면 삼성리 116-9', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15963, 1499, '도착지', 19, 108, 1768, 7416, '35.259964567533096', '129.2337495161953', '부산 기장군 일광면 삼성리 116-9', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15964, 1500, '도착지', 40, 16, 579, NULL, '37.571141513487014', '127.00957194696626', '서울 종로구 종로6가 69', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15965, 1501, '도착지', 18, 79, 1275, NULL, '37.399613580042285', '127.10699801370505', '경기 성남시 분당구 삼평동 669', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15966, 1502, '도착지', 40, 1, 295, NULL, '37.4967771303817', '127.02818524559389', '서울 강남구 역삼동 858', '2016-09-02 22:39:29');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15967, 1503, '도착지', 19, 114, 1808, NULL, '35.16232848529271', '128.98598420371115', '부산 사상구 괘법동 572-19', '2016-09-02 22:39:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15968, 1504, '도착지', 24, 153, 2757, NULL, '37.44028081268262', '129.16370013657826', '강원 삼척시 남양동 55-9', '2016-09-02 22:39:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15969, 1505, '도착지', 18, 99, 1597, 7028, '37.26721221736258', '127.21363872279483', '경기 용인시 처인구 포곡읍 둔전리 406-78', '2016-09-02 22:39:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15970, 1506, '도착지', 40, 13, 441, NULL, '37.529257311976', '126.87377893359967', '서울 양천구 목동 920', '2016-09-02 22:39:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15971, 1507, '도착지', 40, 15, 509, NULL, '37.53287693832306', '126.9657142837493', '서울 용산구 한강로2가 16-1', '2016-09-02 22:39:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15972, 1508, '도착지', 20, 127, 1988, NULL, '37.48944904290551', '126.72433108861824', '인천 부평구 부평동 738-21', '2016-09-02 22:39:30');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15973, 1509, '도착지', 24, 153, 2755, 7847, '37.28588746933111', '129.3141772428963', '강원 삼척시 근덕면 장호리', '2016-09-02 22:39:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15974, 1510, '도착지', 20, 127, 1988, NULL, '37.49420960444457', '126.72418241857008', '인천 부평구 부평동 211-148', '2016-09-02 22:39:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15975, 1511, '도착지', 19, 121, 1920, NULL, '35.17190933227539', '129.12742614746094', '부산 해운대구 우동 1467', '2016-09-02 22:39:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15976, 1512, '도착지', 40, 284, 5320, NULL, '37.594880167445645', '127.05304741793442', '서울 동대문구 회기동 1-5', '2016-09-02 22:39:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15977, 1513, '도착지', 40, 284, 5320, NULL, '37.594880167445645', '127.05304741793442', '서울 동대문구 회기동 1-5', '2016-09-02 22:39:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15978, 1514, '도착지', 40, 8, 342, NULL, '37.55687074488727', '126.92377856227273', '서울 마포구 동교동 192-5', '2016-09-02 22:39:31');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15979, 1515, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:39:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15980, 1516, '도착지', 28, 230, 4131, NULL, '35.15236274362956', '128.10523473124562', '경남 진주시 가좌동 996-12', '2016-09-02 22:39:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15981, 1517, '도착지', 39, 280, 5263, NULL, '35.582746995767096', '129.36114667524288', '울산 북구 연암동 1004-1', '2016-09-02 22:39:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15982, 1518, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:39:32');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15983, 1519, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:39:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15984, 1520, '도착지', 24, 150, 2663, NULL, '37.80340550831249', '128.91021024760482', '강원 강릉시 강문동 산 1', '2016-09-02 22:39:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15985, 1521, '도착지', 18, 88, 1416, NULL, '37.29545737470954', '126.83565762007755', '경기 안산시 상록구 사동 1271', '2016-09-02 22:39:33');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15986, 1522, '도착지', 68, NULL, NULL, NULL, '36.601431718221704', '127.29649209390175', '세종특별자치시 조치원읍 원리 141-54', '2016-09-02 22:39:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15987, 1523, '도착지', 21, 132, 2087, NULL, '36.36329081342943', '127.4512025018061', '대전 대덕구 비래동 331-1', '2016-09-02 22:39:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15988, 1524, '도착지', 19, 118, 1853, NULL, '35.17974453860173', '129.07507679139442', '부산 연제구 연산동 1000', '2016-09-02 22:39:34');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15989, 1525, '도착지', 19, 118, 1853, NULL, '35.17974453860173', '129.07507679139442', '부산 연제구 연산동 1000', '2016-09-02 22:39:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15990, 1526, '도착지', 22, 144, 2421, NULL, '35.871387353753676', '128.60181449109797', '대구 중구 동인동1가 2-1', '2016-09-02 22:39:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15991, 1527, '도착지', 28, 66, 1061, NULL, '35.33499205686948', '129.0372727888175', '경남 양산시 남부동 505', '2016-09-02 22:39:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15992, 1528, '도착지', 39, 278, 5226, NULL, '35.53656232936561', '129.33972852589622', '울산 남구 삼산동 1481-14', '2016-09-02 22:39:35');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15993, 1529, '도착지', 30, 270, 5126, 19796, '34.31857052786835', '126.74495481321776', '전남 완도군 완도읍 군내리 1230', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15994, 1530, '도착지', 40, 15, 482, NULL, '37.55467883886744', '126.97060691739387', '서울 용산구 동자동 43-205', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15995, 1531, '도착지', 18, 100, 1609, NULL, '37.402103424072266', '126.99180603027344', '경기 의왕시 포일동 679', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15996, 1532, '도착지', 24, 164, 2928, 8492, '37.72261638198734', '128.7448777222037', '강원 평창군 대관령면 횡계리 산 1-134', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15997, 1533, '도착지', 26, 194, 3432, NULL, '36.81053014586462', '127.14658855212463', '충남 천안시 동남구 대흥동 57-1', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15998, 1534, '도착지', 40, 284, 5320, NULL, '37.594880167445645', '127.05304741793442', '서울 동대문구 회기동 1-5', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(15999, 1535, '도착지', 25, 174, 3031, NULL, '37.17317400677721', '128.21056352067316', '충북 제천시 모산동 241', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16000, 1536, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16001, 1537, '도착지', 39, 281, 5276, 20726, '35.55154319080058', '129.13866004741357', '울산 울주군 삼남면 신화리 88', '2016-09-02 22:39:36');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16002, 1538, '도착지', 30, 67, 1136, NULL, '34.766030076098474', '127.66352968935291', '전남 여수시 학동 43-2', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16003, 1539, '도착지', 29, 253, 4774, NULL, '35.79928004501928', '127.11648865770108', '전북 전주시 완산구 효자동1가 670', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16004, 1540, '도착지', 40, 10, 378, NULL, '37.484453425987155', '127.03398317173767', '서울 서초구 서초동 1375', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16005, 1541, '도착지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16006, 1542, '도착지', 19, 109, 1773, NULL, '35.12950335312022', '129.09224670293352', '부산 남구 대연동 948-25', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16007, 1543, '도착지', 24, 150, 2700, 7741, '37.903934478759766', '128.81744384765625', '강원 강릉시 주문진읍 주문리 903-4', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16008, 1544, '도착지', 22, 138, 2261, NULL, '35.80723575316812', '128.52028009838477', '대구 달서구 대곡동 1018', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16009, 1545, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:39:37');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16010, 1546, '도착지', 40, 284, 5316, NULL, '37.578886359881736', '127.07225892466015', '서울 동대문구 장안동 469-1', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16011, 1547, '도착지', 20, 124, 1962, NULL, '37.43716049194336', '126.67955780029297', '인천 남구 문학동 155-36', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16012, 1548, '도착지', 19, 121, 1922, NULL, '35.16995583130151', '129.17702254504522', '부산 해운대구 좌동 1491', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16013, 1549, '도착지', 19, 121, 1922, NULL, '35.16995583130151', '129.17702254504522', '부산 해운대구 좌동 1491', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16014, 1550, '도착지', 19, 109, 1773, NULL, '35.12950335312022', '129.09224670293352', '부산 남구 대연동 948-25', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16015, 1551, '도착지', 18, 101, 1620, NULL, '37.738362492359904', '127.04595682676671', '경기 의정부시 의정부동 168-54', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16016, 1552, '도착지', 24, 154, 2795, NULL, '38.19046060266', '128.59877601917069', '강원 속초시 조양동 1419', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16017, 1553, '도착지', 19, 117, 1847, NULL, '35.15319327368366', '129.11897609358348', '부산 수영구 광안동 192-20', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16018, 1554, '도착지', 68, NULL, NULL, NULL, '36.485250207840316', '127.26021284866516', '세종특별자치시 나성동 700-1', '2016-09-02 22:39:38');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16019, 1555, '도착지', 39, 278, 5233, NULL, '35.52880096435547', '129.29296875', '울산 남구 옥동 산 242', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16020, 1556, '도착지', 24, 162, 2910, NULL, '37.87611389160156', '127.75414276123047', '강원 춘천시 후평동 824-1', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16021, 1557, '도착지', 24, 154, 2798, NULL, '38.191114275506735', '128.5957542028823', '강원 속초시 청호동 461-1', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16022, 1558, '도착지', 18, 96, 1538, NULL, '37.15916509768708', '127.06267998837252', '경기 오산시 궐동 147-1', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16023, 1559, '도착지', 23, 148, 2636, NULL, '35.1653524622591', '126.90926429787295', '광주 북구 중흥동 611-8', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16024, 1560, '도착지', 24, 164, 2932, 8518, '37.65747959071729', '128.3077449194493', '강원 평창군 봉평면 흥정리 93', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16025, 1561, '도착지', 40, 1, 286, NULL, '37.48337479766962', '127.06285936867324', '서울 강남구 개포동 157-1', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16026, 1562, '도착지', 40, 11, 396, NULL, '37.541566278367284', '127.01739378284644', '서울 성동구 옥수동 401-1', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16027, 1563, '도착지', 40, 1, 295, NULL, '37.498085435791786', '127.02800027507125', '서울 강남구 역삼동 804', '2016-09-02 22:39:39');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16028, 1564, '도착지', 19, 107, 1764, NULL, '35.231363366196504', '129.08635020346165', '부산 금정구 장전동 417-36', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16029, 1565, '도착지', 18, 77, 1255, 6408, '37.631807588666916', '127.31129980898434', '경기 남양주시 화도읍 차산리 4-8', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16030, 1566, '도착지', 19, 110, 1781, NULL, '35.11510826321335', '129.04142025662696', '부산 동구 초량동 1187-21', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16031, 1567, '도착지', 20, 127, 1988, NULL, '37.48944904290551', '126.72433108861824', '인천 부평구 부평동 738-21', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16032, 1568, '도착지', 18, 76, 1235, NULL, '37.35815634380001', '126.93318617488264', '경기 군포시 산본동 1231', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16033, 1569, '도착지', 18, 61, 922, 5745, '37.8657675098728', '126.87002049803718', '경기 파주시 법원읍 동문리 18-3', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16034, 1570, '도착지', 18, 105, 1704, NULL, '37.20724791302222', '127.04019398221921', '경기 화성시 병점동 809', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16035, 1571, '도착지', 40, 17, 628, NULL, '37.56425319190176', '126.98119290152435', '서울 중구 소공동 21-1', '2016-09-02 22:39:40');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16036, 1572, '도착지', 23, 148, 2636, NULL, '35.1653524622591', '126.90926429787295', '광주 북구 중흥동 611-8', '2016-09-02 22:39:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16037, 1573, '도착지', 21, 134, 2153, NULL, '36.30126190185547', '127.33451843261719', '대전 서구 관저동 1172', '2016-09-02 22:39:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16038, 1574, '도착지', 40, 35, 703, NULL, '37.53395570186129', '126.8539532746609', '서울 강서구 화곡동 456-18', '2016-09-02 22:39:41');
INSERT INTO `post_region` (`no`, `postID`, `regionName`, `lRegionNo`, `mRegionNo`, `sRegionNo`, `tRegionNo`, `latitude`, `longitude`, `address`, `createdDate`) VALUES
	(16039, 1575, '도착지', 20, 125, 1968, NULL, '37.40262143767307', '126.69539731740646', '인천 남동구 고잔동 639-1', '2016-09-02 22:39:41');
/*!40000 ALTER TABLE `post_region` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
