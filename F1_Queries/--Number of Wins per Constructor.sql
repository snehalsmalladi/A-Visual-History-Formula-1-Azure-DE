--Number of Wins per Constructor
SELECT c.[name]
,c.[nationality]
,SUM (s.[points]) as Total_Points
,SUM(s.[wins]) as Wins
FROM [Formula1_DB].[dbo].[Constructor_Standings] s
JOIN [Formula1_DB].[dbo].[Constructors] c  ON s.[constructorId] = c.[constructorId]
Group by c.[name], c.[nationality]
Order by Wins DESC;
