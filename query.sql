CREATE TABLE `history` (
	`historyNo` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NULL DEFAULT NULL,
	`param1` VARCHAR(30) NULL DEFAULT NULL,
	`param2` VARCHAR(30) NULL DEFAULT NULL,
	`param3` VARCHAR(30) NULL DEFAULT NULL,
	`param4` VARCHAR(30) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`historyNo`),
	INDEX `createdDate` (`createdDate`),
	INDEX `Name` (`Name`),
	INDEX `Name_param1` (`Name`, `param1`)
)
ENGINE=InnoDB
;
