CREATE TABLE `cafe_detail` (
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`iconImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainDesc` TEXT NULL,
	`locationNo` BIGINT(20) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
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



	insert into cafe_location(latitude, longitude, regionNo, address, createdDate)
values(37.498861, 127.036732, 295, '서울시 강남구 역삼1동 738-5', NOW());


insert into cafe_public_meeting( cafeNo, title, meetingDate, locationNo, maxNo, createdDate )
values(1, '영화나 한편 볼까요?', '2017-01-10 19:30', 2, 10, NOW());


insert into cafe_public_meeting_members(meetingNo, userID, createdDate )
values(2, 'user27', NOW());


insert into cafe_public_meeting_members(meetingNo, userID, createdDate )
values(2, 'user638', NOW());


insert into cafe_public_meeting_members(meetingNo, userID, createdDate )
values(2, 'user801', NOW());



insert into cafe_location(latitude, longitude, regionNo, address, createdDate)
values ('37.513821', '127.108814', 366, '서울시 송파구 방이2동 63-15', NOW() );


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개', '2017-01-20 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개2', '2017-01-21 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개3', '2017-01-22 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개4', '2017-01-23 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개5', '2017-01-24 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개6', '2017-01-25 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개7', '2017-01-26 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개8', '2017-01-27 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개9', '2017-01-28 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개10', '2017-01-29 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개11', '2017-01-30 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개12', '2017-01-31 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개13', '2017-01-13 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개14', '2017-01-14 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개15', '2017-01-15 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개16', '2017-01-16 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개17', '2017-01-17 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개18', '2017-01-18 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개19', '2017-01-19 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개20', '2017-01-20 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개21', '2017-01-21 19:30', 3, 10, NOW());


insert into cafe_public_meeting(cafeNo, title, meetingDate, locationNo, maxNo, createdDate)
values(1, '맛나는 삼겹살번개22', '2017-01-22 19:30', 3, 10, NOW());