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

-- 테이블 nearhere.region 구조 내보내기
CREATE TABLE IF NOT EXISTS `region` (
  `regionNo` int(11) NOT NULL AUTO_INCREMENT,
  `regionName` varchar(20) NOT NULL DEFAULT '0',
  `shortRegionName` varchar(20) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `parentNo` int(11) DEFAULT NULL,
  `isHotSpot` varchar(1) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`regionNo`),
  KEY `shortRegionName` (`shortRegionName`),
  KEY `regionName` (`regionName`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- 테이블 데이터 nearhere.region:~251 rows (대략적) 내보내기
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(1, '강남구', '강남구', 10, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(2, '강북구', '강북구', 20, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(3, '관악구', '관악구', 30, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(4, '광진구', '광진구', 40, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(5, '구로구', '구로구', 50, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(6, '금천구', '금천구', 60, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(7, '동작구', '동작구', 70, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(8, '마포구', '마포구', 80, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(9, '송파구', '송파구', 90, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(10, '서초구', '서초구', 100, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(11, '성동구', '성동구', 110, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(12, '성북구', '성북구', 120, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(13, '양천구', '양천구', 130, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(14, '영등포구', '영등포구', 140, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(15, '용산구', '용산구', 150, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(16, '종로구', '종로구', 160, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(17, '중구', '중구', 170, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(18, '경기도', '경기', 180, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(19, '부산광역시', '부산', 190, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(20, '인천광역시', '인천', 200, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(21, '대전광역시', '대전', 210, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(22, '대구광역시', '대구', 220, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(23, '광주광역시', '광주', 230, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(24, '강원도', '강원', 240, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(25, '충청북도', '충북', 250, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(26, '충청남도', '충남', 260, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(27, '경상북도', '경북', 270, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(28, '경상남도', '경남', 280, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(29, '전라북도', '전북', 290, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(30, '전라남도', '전남', 300, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(31, '제주도', '제주', 310, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(32, '노원구', '노원구', 65, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(34, '은평구', '은평구', 155, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(35, '강서구', '강서구', 25, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(36, '서대문구', '서대문구', 95, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(37, '중랑구', '중랑구', 175, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(38, '도봉구', '도봉구', 68, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(39, '울산광역시', '울산', 215, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(40, '서울', '서울', 1, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(41, '인천공항', '', 1000, NULL, 'Y', '37.459841', '126.440526');
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(42, '을왕리 해수욕장', NULL, 1100, NULL, 'Y', '37.447662', '126.372682');
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(43, '에버랜드', NULL, 1200, NULL, 'Y', '37.293498', '127.202400');
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(44, '한국민속촌', NULL, 1300, NULL, 'Y', '37.259864', '127.120806');
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(45, '김포공항', NULL, 1050, NULL, 'Y', '37.558483', '126.793985');
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(46, '남이섬', '', 1400, NULL, 'Y', '37.804218', '127.525328');
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(47, '창원시', '창원', 500, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(48, '고양시', '고양', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(49, '성남시', '성남', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(50, '용인시', '용인', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(51, '부천시', '부천', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(52, '청주시', '청주', 500, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(53, '안산시', '안산', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(54, '전주시', '전주', 500, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(55, '안양시', '안양', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(56, '김해시', '김해', 500, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(57, '포항시', '포항', 500, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(58, '평택시', '평택', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(59, '제주시', '제주', 500, 31, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(60, '구미시', '구미', 500, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(61, '파주시', '파주', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(62, '김포시', '김포', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(63, '익산시', '익산', 500, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(64, '광주시', '광주', 500, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(65, '아산시', '아산', 500, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(66, '양산시', '양산', 500, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(67, '여수시', '여수', 500, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(68, '강동구', '강동구', 0, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(69, '동대문구', '동대문구', 0, 40, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(70, '가평군', '가평', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(71, '과천시', '과천', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(72, '광명시', '광명', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(73, '구리시', '구리', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(74, '군포시', '군포', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(75, '남양주시', '남양주', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(76, '동두천시', '동두천', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(77, '수원시', '수원', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(78, '시흥시', '시흥', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(79, '안성시', '안성', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(80, '양주시', '양주', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(81, '양평군', '양평', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(82, '여주군', '여주', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(83, '연천군', '연천', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(84, '오산시', '오산', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(85, '의왕시', '의왕', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(86, '의정부시', '의정부', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(87, '이천시', '이천', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(88, '포천시', '포천', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(89, '하남시', '하남', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(90, '화성시', '화성', 0, 18, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(91, '강릉시', '강릉', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(92, '고성군', '고성', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(93, '동해시', '동해', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(94, '삼척시', '삼척', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(95, '속초시', '속초', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(96, '양구군', '양구', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(97, '양양군', '양양', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(98, '영울군', '영울', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(99, '워주시', '워주', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(100, '인제군', '인제', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(101, '정선군', '정선', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(102, '철원군', '철원', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(103, '춘천시', '춘천', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(104, '태백시', '태백', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(105, '평창군', '평창', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(106, '홍천군', '홍천', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(107, '화천군', '화천', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(108, '횡성군', '횡성', 0, 24, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(109, '거제시', '거제', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(110, '거창군', '거창', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(111, '고성군', '고성', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(112, '남해군', '남해', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(113, '밀양시', '밀양', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(114, '사천시', '사천', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(115, '산청군', '산청', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(116, '의령군', '의령', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(117, '진주시', '진주', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(118, '창녕군', '창녕', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(119, '통영시', '통영', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(120, '하동군', '하동', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(121, '함안군', '함안', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(122, '함양군', '함양', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(123, '합천군', '합천', 0, 28, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(124, '경산시', '경산', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(125, '경주시', '경주', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(126, '고령군', '고령', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(127, '군위군', '군위', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(128, '김천시', '김천', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(129, '문경시', '문경', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(130, '봉화군', '봉화', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(131, '상주시', '상주', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(132, '성주군', '성주', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(133, '안동시', '안동', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(134, '영덕군', '영덕', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(135, '영양군', '영양', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(136, '영주시', '영주', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(137, '영천시', '영천', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(138, '예천군', '예천', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(139, '울진군', '울진', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(140, '의성군', '의성', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(141, '청도군', '청도', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(142, '청송군', '청송', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(143, '칠곡군', '칠곡', 0, 27, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(144, '광산구', '광산구', 0, 23, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(145, '동구', '동구', 0, 23, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(146, '서구', '서구', 0, 23, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(147, '남구', '남구', 0, 23, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(148, '북구', '북구', 0, 23, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(149, '남구', '남구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(150, '달성구', '달성구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(151, '달성군', '달성군', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(152, '동구', '동구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(153, '북구', '북구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(154, '서구', '서구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(155, '수성구', '수성구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(156, '중구', '중구', 0, 22, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(157, '대덕구', '대덕구', 0, 21, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(158, '동구', '동구', 0, 21, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(159, '서구', '서구', 0, 21, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(160, '중구', '중구', 0, 21, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(161, '유성구', '유성구', 0, 21, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(162, '강서구', '강서구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(163, '금정구', '금정구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(164, '기장군', '기장군', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(165, '남구', '남구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(166, '동구', '동구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(167, '동래구', '동래구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(168, '부산진구', '부산진구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(169, '북구', '북구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(170, '사상구', '사상구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(171, '사하구', '사하구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(172, '서구', '서구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(173, '수영구', '수영구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(174, '연제구', '연제구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(175, '영도구', '영도구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(176, '중구', '중구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(177, '해운대구', '해운대구', 0, 19, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(178, '세종시', '세종시', 215, NULL, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(179, '남구', '남구', 0, 39, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(180, '동구', '동구', 0, 39, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(181, '북구', '북구', 0, 39, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(182, '울주군', '울주군', 0, 39, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(183, '중구', '중구', 0, 39, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(184, '강화군', '강화군', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(185, '계양구', '계양구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(186, '남구', '남구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(187, '남동구', '남동구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(188, '동구', '동구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(189, '부평구', '부평구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(190, '서구', '서구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(191, '연수구', '연수구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(192, '옹진군', '옹진군', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(193, '중구', '중구', 0, 20, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(194, '강진군', '강진', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(195, '고흥군', '고흥', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(196, '곡성군', '곡성', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(197, '광양시', '광양', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(198, '구례군', '구례', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(199, '나주시', '나주', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(200, '담양군', '담양', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(201, '목포시', '목포', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(202, '무안군', '무안', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(203, '보성군', '보성', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(204, '순천시', '순천', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(205, '신안군', '신안', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(206, '영광군', '영광', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(207, '영암군', '영암', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(208, '완도군', '완도', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(209, '장성군', '장성', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(210, '장흥군', '장흥', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(211, '진도군', '진도', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(212, '함평군', '함평', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(213, '해남군', '해남', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(214, '화순군', '화순', 0, 30, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(215, '고창군', '고창', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(216, '군산시', '군산', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(217, '김제시', '김제', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(218, '남원시', '남원', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(219, '무주군', '무주', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(220, '부안군', '부안', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(221, '순창군', '순창', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(222, '완주군', '완주', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(223, '임실군', '임실', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(224, '장수군', '장수', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(225, '정읍시', '정읍', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(226, '진안군', '진안', 0, 29, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(227, '서귀포시', '서귀포', 0, 31, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(228, '계룡시', '계룡', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(229, '공주시', '공주', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(230, '금산군', '금산', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(231, '논산시', '논산', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(232, '당진시', '당진', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(233, '보령시', '보령', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(234, '부여군', '부여', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(235, '서산시', '서산', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(236, '서천군', '서천', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(237, '예산군', '예산', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(238, '천안시', '천안', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(239, '청양군', '청양', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(240, '태안군', '태안', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(241, '홍성군', '홍성', 0, 26, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(242, '괴산군', '괴산', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(243, '단양군', '단양', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(244, '보은군', '보은', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(245, '영동군', '영동', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(246, '옥천군', '옥천', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(247, '음성군', '음성', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(248, '제천시', '제천', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(249, '증평군', '증평', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(250, '진천군', '진천', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(251, '청원군', '청원', 0, 25, NULL, NULL, NULL);
INSERT INTO `region` (`regionNo`, `regionName`, `shortRegionName`, `priority`, `parentNo`, `isHotSpot`, `latitude`, `longitude`) VALUES
	(252, '충주시', '충주', 0, 25, NULL, NULL, NULL);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
