
USE SpiceIsleToursDB;

SELECT 'TOUR PERFORMANCE REPORT' as Report;
SELECT t.TourName as 'Tour Name',
       COUNT(DISTINCT o.OutingID) as 'Number of Outings',
       COUNT(DISTINCT b.ClientID) as 'Total Clients Served',
       ROUND(AVG(b.Rating), 1) as 'Average Rating',
       CONCAT('$', FORMAT(SUM(t.Fee), 2)) as 'Total Revenue'
FROM Tour t
LEFT JOIN Outing o ON t.TourID = o.TourID
LEFT JOIN Booking b ON o.OutingID = b.OutingID
GROUP BY t.TourID, t.TourName;

SELECT 'GUIDE PERFORMANCE REPORT' as Report;
SELECT CONCAT(g.FirstName, ' ', g.LastName) as 'Guide Name',
       COUNT(DISTINCT o.OutingID) as 'Outings Led',
       ROUND(AVG(b.Rating), 1) as 'Average Rating',
       COUNT(DISTINCT c.LocationID) as 'Locations Certified',
       g.DateOfHire as 'Hire Date'
FROM Guide g
LEFT JOIN Outing o ON g.GuideID = o.GuideID
LEFT JOIN Booking b ON o.OutingID = b.OutingID
LEFT JOIN Certification c ON g.GuideID = c.GuideID
GROUP BY g.GuideID, g.FirstName, g.LastName, g.DateOfHire;

SELECT 'CLIENT ACTIVITY REPORT' as Report;
SELECT CONCAT(c.FirstName, ' ', c.LastName) as 'Client Name',
       c.Telephone as 'Phone',
       c.Email as 'Email',
       COUNT(b.OutingID) as 'Tours Booked',
       ROUND(AVG(b.Rating), 1) as 'Average Rating Given'
FROM Client c
LEFT JOIN Booking b ON c.ClientID = b.ClientID
GROUP BY c.ClientID, c.FirstName, c.LastName, c.Telephone, c.Email
HAVING COUNT(b.OutingID) > 0;

SELECT 'LOCATION POPULARITY REPORT' as Report;
SELECT l.LocationName as 'Location Name',
       l.LocationType as 'Type',
       COUNT(DISTINCT ti.TourID) as 'Tours Featuring Location',
       COUNT(DISTINCT c.GuideID) as 'Guides Certified'
FROM Location l
LEFT JOIN TourItinerary ti ON l.LocationID = ti.LocationID
LEFT JOIN Certification c ON l.LocationID = c.LocationID
GROUP BY l.LocationID, l.LocationName, l.LocationType
ORDER BY COUNT(DISTINCT ti.TourID) DESC;