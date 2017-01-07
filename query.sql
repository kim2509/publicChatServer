
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