CREATE TABLE `user_friends` (
	`userNo` INT(11) NOT NULL,
	`friendNo` INT(11) NOT NULL,
	`createdDate` DATETIME NOT NULL,
	PRIMARY KEY (`userNo`, `friendNo`)
)
ENGINE=InnoDB
;
