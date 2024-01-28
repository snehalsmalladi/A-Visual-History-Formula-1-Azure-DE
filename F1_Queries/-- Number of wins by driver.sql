-- Number of wins by driver
SELECT d.[number]
,d.[surname]
,d.[nationality]
,SUM(s.[points]) as Points
,AVG(s.[position]) as Avg_Position
,SUM(s.[wins]) as Wins
FROM [Formula1_DB].[dbo].[Driver_Standings] s 
JOIN [Formula1_DB].[dbo].[Drivers] d ON d.driverId = s.driverId
Group by d.[surname], d.[nationality], d.[number]
Order by Wins DESC;