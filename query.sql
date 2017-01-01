
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
