-- for the Eve Universe Database via the static data export
-- Region, System, Gates to System, in Region (with true sec ratings)

SELECT
    r1.regionName Region,
    ss1.solarSystemName System,
    ss1.security Security,
    ss2.solarSystemName Gate_To,
    r2.regionName In_Region,
    ss2.security With_Security
FROM
 	mapSolarSystemJumps j
JOIN
	mapRegions r1 ON r1.regionID = j.fromRegionID
JOIN
	mapSolarSystems ss1 on ss1.solarSystemID = j.fromSolarSystemID
JOIN
 	mapSolarSystems ss2 on ss2.solarSystemID = j.toSolarSystemID
JOIN
	mapRegions r2 on r2.regionID = j.toRegionID
WHERE
	system = 'Siseide'

-- system, security, number of gates, # gates to HS, # gates to LS, # null

SELECT
    r1.regionName Region,
    ss1.solarSystemName System,
    ss1.security Security,
    COUNT(ss2.solarSystemName) Star_Gates,
    COUNT(CASE WHEN ss2.security >= 0.5 THEN 1 END) High_Sec_Gates,
    COUNT(CASE WHEN ss2.security < 0.5 THEN 1 END) Low_Sec_Gates,
    COUNT(CASE WHEN ss2.security <= 0.0 THEN 1 END) Null_Gates
FROM
 	mapSolarSystemJumps j
JOIN mapRegions r1 ON r1.regionID = j.fromRegionID
JOIN mapSolarSystems ss1 on ss1.solarSystemID = j.fromSolarSystemID
JOIN mapSolarSystems ss2 on ss2.solarSystemID = j.toSolarSystemID
-- WHERE System = 'Huola'
GROUP BY System
-- HAVING Star_Gates > 5
ORDER BY Star_Gates DESC

