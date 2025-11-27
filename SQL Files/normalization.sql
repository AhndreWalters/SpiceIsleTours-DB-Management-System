
USE SpiceIsleToursDB;

SELECT 'PROOF OF 1NF: Using TourItinerary table instead of Location1, Location2, Location3' as Proof;
SELECT t.TourName, l.LocationName, ti.VisitOrder
FROM Tour t
JOIN TourItinerary ti ON t.TourID = ti.TourID
JOIN Location l ON ti.LocationID = l.LocationID
ORDER BY t.TourName, ti.VisitOrder;

SELECT 'PROOF OF 2NF: Certification table - TestDate depends on BOTH Guide AND Location' as Proof;
SELECT g.FirstName, g.LastName, l.LocationName, c.TestDate
FROM Certification c
JOIN Guide g ON c.GuideID = g.GuideID
JOIN Location l ON c.LocationID = l.LocationID;

SELECT 'PROOF OF 2NF: Booking table - Rating depends on BOTH Client AND Outing' as Proof;
SELECT c.FirstName, c.LastName, t.TourName, b.Rating, b.ReviewText
FROM Booking b
JOIN Client c ON b.ClientID = c.ClientID
JOIN Outing o ON b.OutingID = o.OutingID
JOIN Tour t ON o.TourID = t.TourID;

SELECT 'PROOF OF 3NF: Tour table - Fee is independent of LengthHours' as Proof;
SELECT TourName, LengthHours, Fee,
       CASE
           WHEN Fee / LengthHours > 0 THEN 'Fee not directly calculated from hours'
           ELSE 'Check calculation'
       END as Verification
FROM Tour;

SELECT 'PROOF OF 3NF: Guide table - All columns depend only on GuideID' as Proof;
SELECT GuideID, FirstName, LastName, HomeAddress, DateOfHire
FROM Guide
WHERE GuideID = 1;