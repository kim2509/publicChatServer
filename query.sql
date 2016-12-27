CREATE TABLE `cafe_public_meeting` (
	`meetingNo` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`cafeNo` INT(11) NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`meetingDate` DATETIME NOT NULL,
	`locationNo` BIGINT(20) NULL DEFAULT NULL,
	`maxNo` INT(11) NULL DEFAULT NULL,
	`curNo` INT(11) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`meetingNo`),
	INDEX `cafeNo` (`cafeNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;



insert into cafe_public_meeting_members
values(1, 'user27', NOW() );

insert into cafe_public_meeting_members
values(1, 'user638', NOW() );


insert into cafe_public_meeting_members
values(1, 'user801', NOW() );
