-- Fastest lap times by Driver All Time
WITH RankedResults AS (
SELECT  d.[name] as Circuit_Name
    ,b.[forename]
    ,b.[surname]
    ,b.[number]
    ,b.[nationality]
    ,a.[fastestLapTime]
    ,a.[fastestLapSpeed]
    ,c.[year] as calender_year
    ,c.[date]
    ,ROW_NUMBER() OVER (PARTITION BY d.[name] ORDER BY a.[fastestLapTime]) AS rank_within_circuit
FROM [Formula1_DB].[dbo].[Results] a 
JOIN [Formula1_DB].[dbo].[Drivers] b ON a.driverId = b.driverId
JOIN [Formula1_DB].[dbo].[Races] c ON a.raceId = c.raceId
JOIN [Formula1_DB].[dbo].[Circuits] d ON c.circuitId = d.circuitId
Where a.[fastestLapTime] <> '\N'
 AND  a.[number] IS NOT NULL
)
SELECT * FROM RankedResults WHERE rank_within_circuit = 1
Order by calender_year DESC;