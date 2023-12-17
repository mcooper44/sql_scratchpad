-- Eve Universe Static Data Export queries

-- Blueprint Activity ID, Time and Name example
-- returns...
-- 17687, 1, 1200, Multifrequency XL Blueprint
-- "17687"	"1"	"1200"	"Multifrequency XL Blueprint"
-- "17687"	"3"	"420"	"Multifrequency XL Blueprint"
-- "17687"	"4"	"420"	"Multifrequency XL Blueprint"
-- "17687"	"5"	"960"	"Multifrequency XL Blueprint"
-- "17687"	"8"	"72000"	"Multifrequency XL Blueprint"

select 
    IA.typeID, IA.activityID, IA.Time, IT.typeName 
from 
    industryActivity IA
join 
    invTypes IT on IT.typeID = IA.typeID
where 
    IA.typeID = 17687
order by 
    IA.typeID, IA.activityID

-- contents of ramActivities table
-- "activityID"	"activityName"	"iconNo"	"description"	"published"
-- "0"	"None"		"No activity"	"1"
-- "1"	"Manufacturing"	"18_02"	"Manufacturing"	"1"
-- "2"	"Researching Technology"	"33_02"	"Technological research"	"0"
-- "3"	"Researching Time Efficiency"	"33_02"	"Researching time efficiency"	"1"
-- "4"	"Researching Material Efficiency"	"33_02"	"Researching material efficiency"	"1"
-- "5"	"Copying"	"33_02"	"Copying"	"1"
-- "6"	"Duplicating"		"The process of creating an item, by studying an already existing item."	"0"
-- "7"	"Reverse Engineering"	"33_02"	"The process of creating a blueprint from an item."	"1"
-- "8"	"Invention"	"33_02"	"The process of creating a more advanced item based on an existing item"	"1"
-- "11"	"Reactions"	"18_02"	"The process of combining raw and intermediate materials to create advanced components"	"1"

select * from ramActivities


-- return blueprint name, activity and activity time
-- returns...
-- typeID, typeName, activityID, activityName, time
-- "681", "Clone Grade Beta Blueprint", "1", "Manufacturing", "600"

select
	IA.typeID, IT.typeName, IA.activityID, RA.activityName, IA.time
from
	industryActivity IA
join
	ramActivities RA on RA.activityID = IA.activityID
join
	invTypes IT on IT.typeID = IA.typeID
order by
	IA.typeID, IA.activityID

-- activity ID, materialTypeID, typeName, quantity
-- returns...
-- "activityID", "materialTypeID", "typeName", "quantity"
-- "1", "34", "Tritanium", "24000"
-- "1", "35", "Pyerite", "4500"
-- ...

select
	IM.activityID, IM.materialTypeID, IT.typeName, IM.quantity
from
	industryActivityMaterials IM
join
	invTypes IT on IT.typeID = IM.materialTypeID
where
	IM.typeID = 683 and IM.activityID = 1-- bantam BPO
limit 30
