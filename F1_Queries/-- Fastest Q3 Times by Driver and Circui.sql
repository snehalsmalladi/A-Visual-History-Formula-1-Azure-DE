-- Fastest Q3 Times by Driver and Circuits
SELECT d.[driverId], 
d.[number], 
d.[surname], 
MIN(q.[q3]) as fastest_quali_3,
r.[name] as Race_Name
FROM Drivers d 
JOIN Quali q ON d.driverId = q.driverId
JOIN Races r ON r.raceId = q.raceId
WHERE q.q3 IS NOT NULL 
GROUP BY d.driverId, d.number, d.surname, r.name
ORDER BY fastest_quali_3;