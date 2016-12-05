CREATE TABLE `cafe_board_master` (
	`boardNo` INT(11) NOT NULL AUTO_INCREMENT,
	`boardName` VARCHAR(50) NOT NULL,
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	`deletedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`boardNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `cafe_board_post_detail` (
	`postNo` BIGINT(20) NULL DEFAULT NULL,
	`content` TEXT NULL,
	UNIQUE INDEX `postNo` (`postNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_board_post_master` (
	`postNo` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(100) NOT NULL,
	`boardNo` INT(11) NOT NULL,
	`userID` VARCHAR(30) NOT NULL,
	`readCount` INT(11) NULL DEFAULT NULL,
	`replyCount` INT(11) NULL DEFAULT NULL,
	`noticeYN` CHAR(1) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	`deletedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`postNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_board_post_reply` (
	`replyNo` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`postNo` BIGINT(20) NOT NULL,
	`userID` VARCHAR(30) NOT NULL,
	`content` TEXT NOT NULL,
	`createdDate` DATETIME NOT NULL,
	`deletedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`replyNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_image` (
	`imageNo` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`imageName` VARCHAR(50) NULL DEFAULT NULL,
	`url1` VARCHAR(100) NULL DEFAULT NULL,
	`url2` VARCHAR(200) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`imageNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_master` (
	`cafeNo` INT(11) NOT NULL AUTO_INCREMENT,
	`cafeName` VARCHAR(100) NOT NULL,
	`owner` VARCHAR(30) NOT NULL,
	`createdDate` DATETIME NOT NULL,
	PRIMARY KEY (`cafeNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_members` (
	`no` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`cafeNo` INT(11) NOT NULL,
	`userID` VARCHAR(30) NOT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	`deledtedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`no`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_public_meeting` (
	`meetingNo` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`cafeNo` INT(11) NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`meetingDate` DATETIME NOT NULL,
	`createdDate` DATETIME NOT NULL,
	PRIMARY KEY (`meetingNo`),
	INDEX `cafeNo` (`cafeNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
