CREATE TABLE `push_job` (
	`pushID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`param` VARCHAR(50) NOT NULL,
	`pushType` VARCHAR(50) NOT NULL,
	`finishYN` VARCHAR(1) NOT NULL,
	`createdDate` DATETIME NOT NULL,
	`finishedDate` DATETIME NOT NULL,
	PRIMARY KEY (`pushID`),
	INDEX `createdDate` (`createdDate`),
	INDEX `finishYN` (`finishYN`)
)
ENGINE=InnoDB
;
