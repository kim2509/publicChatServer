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