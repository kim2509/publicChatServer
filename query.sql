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
