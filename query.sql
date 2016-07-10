CREATE TABLE `push_job` (
	`pushID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`param` VARCHAR(50) NOT NULL,
	`pushType` VARCHAR(50) NOT NULL,
	`finishYN` VARCHAR(1) NULL DEFAULT NULL,
	`createdDate` DATETIME NOT NULL,
	`finishedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`pushID`),
	INDEX `createdDate` (`createdDate`),
	INDEX `finishYN` (`finishYN`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;


CREATE TABLE `news` (
	`regionNo` INT(11) NULL DEFAULT NULL,
	`title` VARCHAR(300) NULL DEFAULT NULL,
	`link` VARCHAR(300) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL
)
ENGINE=InnoDB
;


CREATE TABLE `user_favorite_region` (
	`userID` VARCHAR(20) NOT NULL,
	`regionNo` INT(11) NOT NULL,
	`createdDate` DATETIME NOT NULL,
	PRIMARY KEY (`userID`, `regionNo`),
	INDEX `createdDate` (`createdDate`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
