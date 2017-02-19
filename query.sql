CREATE TABLE `cafe_master` (
	`cafeNo` INT(11) NOT NULL AUTO_INCREMENT,
	`cafeID` VARCHAR(50) NOT NULL,
	`cafeName` VARCHAR(100) NULL DEFAULT NULL,
	`owner` VARCHAR(30) NULL DEFAULT NULL,
	`publishYN` VARCHAR(1) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`cafeNo`),
	UNIQUE INDEX `cafeID` (`cafeID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=15
;


CREATE TABLE `cafe_detail` (
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`iconImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainDesc` TEXT NULL,
	`locationNo` BIGINT(20) NULL DEFAULT NULL,
	`contactEmail` VARCHAR(256) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `cafe_board_master` (
	`boardNo` INT(11) NOT NULL AUTO_INCREMENT,
	`boardName` VARCHAR(50) NOT NULL,
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`boardType` INT(11) NULL DEFAULT NULL,
	`writePermission` INT(11) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	`deletedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`boardNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=9
;


CREATE TABLE `cafe_board_post_detail` (
	`postNo` BIGINT(20) NULL DEFAULT NULL,
	`type` INT(11) NULL DEFAULT NULL,
	`content` TEXT NULL,
	`imageNo` BIGINT(20) NULL DEFAULT NULL,
	`locationNo` BIGINT(20) NULL DEFAULT NULL,
	`seq` INT(11) NULL DEFAULT NULL,
	INDEX `postNo` (`postNo`),
	INDEX `type` (`type`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE VIEW region_view as
select r1.regionNo, r1.regionName, r1.level,
	case when r1.level = 1 then r1.regionNo 
		when r1.level = 2 then r2.regionNo 
		when r1.level = 3 then r3.regionNo 
		when r1.level = 4 then r4.regionNo 
	end as lRegionNo
	, 	case when r1.level = 1 then r1.regionName 
		when r1.level = 2 then r2.regionName 
		when r1.level = 3 then r3.regionName 
		when r1.level = 4 then r4.regionName 
	end as lRegionName
	,case when r1.level = 2 then r1.regionNo 
		when r1.level = 3 then r2.regionNo 
		when r1.level = 4 then r3.regionNo 
	end as mRegionNo
	,case when r1.level = 2 then r1.regionName 
		when r1.level = 3 then r2.regionName 
		when r1.level = 4 then r3.regionName 
	end as mRegionName
	,case when r1.level = 3 then r1.regionNo 
		when r1.level = 4 then r2.regionNo 
	end as sRegionNo
	,case when r1.level = 3 then r1.regionName 
		when r1.level = 4 then r2.regionName 
	end as sRegionName
	,case when r1.level = 4 then r1.regionNo end as tRegionNo
	,case when r1.level = 4 then r1.regionName end as tRegionName
from region r1
	left outer join region r2 on r2.regionNo=r1.parentNo
	left outer join region r3 on r3.regionNo=r2.parentNo	
	left outer join region r4 on r4.regionNo=r3.parentNo



insert into cafe_board_post_detail(postNo, type, locationNo, seq)
values(1, 3, 1, 4)