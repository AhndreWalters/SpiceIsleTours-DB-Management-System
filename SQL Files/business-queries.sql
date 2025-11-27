
USE SpiceIsleToursDB;

SELECT 'TOUR PERFORMANCE REPORT' as Report;
SELECT t.TourName, 
       COUNT(DISTINCT b.ClientID) as TotalBookings,
       ROUND(AVG(b.Rating), 1) as AverageRating,
       CONCAT('$', SUM(t.Fee)) as TotalRevenue
FROM Tour t
JOIN Outing o ON t.TourID = o.TourID
JOIN Booking b ON o.OutingID = b.OutingID
GROUP BY t.TourID, t.TourName;

SELECT 'GUIDE PERFORMANCE REPORT' as Report;
SELECT g.FirstName, g.LastName,
       COUNT(DISTINCT o.OutingID) as OutingsLed,
       ROUND(AVG(b.Rating), 1) as AverageRating,
       COUNT(DISTINCT c.LocationID) as LocationsCertified
FROM Guide g
LEFT JOIN Outing o ON g.GuideID = o.GuideID
LEFT JOIN Booking b ON o.OutingID = b.OutingID
LEFT JOIN Certification c ON g.GuideID = c.GuideID
GROUP BY g.GuideID, g.FirstName, g.LastName;

SELECT 'TOUR ITINERARIES' as Report;
SELECT t.TourName, l.LocationName, ti.VisitOrder
FROM Tour t
JOIN TourItinerary ti ON t.TourID = ti.TourID
JOIN Location l ON ti.LocationID = l.LocationID
ORDER BY t.TourName, ti.VisitOrder;

SELECT 'UPCOMING OUTINGS SCHEDULE' as Report;
INSERT IGNORE INTO Outing (TourID, GuideID, ScheduledDateTime) VALUES
(1, 1, '2024-12-20 09:00:00'),
(2, 2, '2024-12-21 10:00:00'),
(3, 3, '2024-12-22 08:00:00');

SELECT o.ScheduledDateTime as Date, 
       t.TourName as Tour,
       CONCAT(g.FirstName, ' ', g.LastName) as Guide
FROM Outing o
JOIN Tour t ON o.TourID = t.TourID
JOIN Guide g ON o.GuideID = g.GuideID
WHERE o.ScheduledDateTime > NOW()
ORDER BY o.ScheduledDateTime;

SELECT 'CLIENT REVIEWS AND RATINGS' as Report;
SELECT c.FirstName, c.LastName, 
       t.TourName as Tour,
       b.Rating as Stars,
       b.ReviewText as Review
FROM Client c
JOIN Booking b ON c.ClientID = b.ClientID
JOIN Outing o ON b.OutingID = o.OutingID
JOIN Tour t ON o.TourID = t.TourID
ORDER BY b.Rating DESC;

SELECT 'GUIDE CERTIFICATIONS' as Report;
SELECT CONCAT(g.FirstName, ' ', g.LastName) as Guide,
       l.LocationName as Location,
       c.TestDate as CertifiedDate
FROM Guide g
JOIN Certification c ON g.GuideID = c.GuideID
JOIN Location l ON c.LocationID = l.LocationID
ORDER BY g.LastName, l.LocationName;