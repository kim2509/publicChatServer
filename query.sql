CREATE TABLE `cafe_members` (
	`no` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`cafeNo` INT(11) NOT NULL,
	`userID` VARCHAR(30) NOT NULL,
	`memberType` VARCHAR(10) NULL DEFAULT NULL,
	`createdDate` DATETIME NULL DEFAULT NULL,
	`deledtedDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`no`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `cafe_detail` (
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`mainImageNo` BIGINT(20) NULL DEFAULT NULL
)
ENGINE=InnoDB
;

select * from cafe_master

insert into cafe_master(cafeName, owner, createdDate)
values('중고나라', 'user27', NOW() );

select * from cafe_members

insert into cafe_members( cafeNo, userID, memberType, createdDate )
values(1, 'user27', '카페주인', NOW());

select * from cafe_image

insert into cafe_image(imageName, url1, url2, createdDate)
values('카페메인', 'http://static.naver.net', '/m/cafe/mobile/img_thumb_20150618.png', NOW() );

select * from cafe_detail

insert into cafe_detail values(1, 1)