CREATE TABLE `cafe_location` (
	`No` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`type` INT(11) NULL DEFAULT NULL,
	`latitude` VARCHAR(30) NULL DEFAULT NULL,
	`longitude` VARCHAR(30) NULL DEFAULT NULL,
	`regionNo` INT(11) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`No`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_public_meeting` (
	`meetingNo` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`cafeNo` INT(11) NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`meetingDate` DATETIME NOT NULL,
	`locationNo` BIGINT(20) NOT NULL,
	`createdDate` DATETIME NOT NULL,
	PRIMARY KEY (`meetingNo`),
	INDEX `cafeNo` (`cafeNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


INSERT INTO `cafe_location` (`No`, `type`, `latitude`, `longitude`, `regionNo`, `createdDate`) VALUES
	(1, 1, '37.499741', '127.035792', 295, '2016-12-07 20:05:08');


INSERT INTO `cafe_public_meeting` (`meetingNo`, `cafeNo`, `title`, `meetingDate`, `locationNo`, `createdDate`) VALUES
	(1, 1, '불금에 삼겹살에 소주 한잔', '2016-12-08 18:00:00', 1, '2016-12-07 20:02:28');