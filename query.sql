CREATE TABLE `cafe_public_meeting_members` (
	`meetingNo` BIGINT(20) NULL DEFAULT NULL,
	`userID` VARCHAR(30) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	INDEX `meetingNo` (`meetingNo`),
	INDEX `createdDate` (`createdDate`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
