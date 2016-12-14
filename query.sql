CREATE TABLE `cafe_detail` (
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`iconImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainDesc` TEXT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



insert into cafe_image(imageName, url1, createdDate)
values('카페메인','http://nv2.tveta.naver.net/libs/1147/1147955/20161207160806-1P7780XT.jpg', NOW());

insert into cafe_members(cafeNo, userID, memberType, createdDate)
values(1, 'user638', '회원', NOW());


insert into cafe_members(cafeNo, userID, memberType, createdDate)
values(1, 'user801', '회원', NOW());