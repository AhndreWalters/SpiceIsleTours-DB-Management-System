USE SpiceIsleToursDB;

-- Insert Tours
INSERT INTO Tour (TourName, LengthHours, Fee) VALUES
('Spice Plantation Tour', 4.5, 75.00),
('Grand Anse Beach Experience', 3.0, 50.00),
('Waterfalls & Rainforest', 6.0, 100.00);

-- Insert Locations
INSERT INTO Location (LocationName, LocationType, Address, OfficialDescription) VALUES
('Dougaldston Spice Estate', 'Plantation', 'St. John, Grenada', 'Historic spice plantation'),
('Grand Anse Beach', 'Beach', 'Grand Anse, St. George', 'Famous 2-mile white sand beach'),
('Annandale Falls', 'Waterfall', 'St. George, Grenada', 'Beautiful 30-foot waterfall'),
('Fort Frederick', 'Historic Site', 'St. George, Grenada', '18th century fort with panoramic views'),
('Gouyave Nutmeg Station', 'Processing Plant', 'Gouyave, St. John', 'Working nutmeg processing facility'),
('Concord Falls', 'Waterfall', 'St. John, Grenada', 'Series of three stunning waterfalls');

-- Insert Guides
INSERT INTO Guide (FirstName, LastName, HomeAddress, DateOfHire) VALUES
('John', 'Baptiste', 'St. George, Grenada', '2022-01-15'),
('Maria', 'Francis', 'Grand Anse, Grenada', '2023-03-20'),
('David', 'St. Louis', 'Gouyave, Grenada', '2021-11-10');

-- Insert Certifications
INSERT INTO Certification (GuideID, LocationID, TestDate) VALUES
(1, 1, '2023-05-10'), (1, 2, '2023-05-15'), (1, 4, '2023-05-20'),
(2, 2, '2023-06-20'), (2, 3, '2023-06-25'), (2, 6, '2023-06-30'),
(3, 1, '2023-04-05'), (3, 5, '2023-04-10'), (3, 6, '2023-04-15');

-- Insert Tour Itineraries (3 LOCATIONS PER TOUR)
INSERT INTO TourItinerary (TourID, LocationID, VisitOrder) VALUES
-- Spice Plantation Tour: 3 locations
(1, 1, 1), (1, 5, 2), (1, 4, 3),
-- Grand Anse Beach Experience: 3 locations
(2, 2, 1), (2, 4, 2), (2, 3, 3),
-- Waterfalls & Rainforest: 3 locations
(3, 3, 1), (3, 6, 2), (3, 1, 3);

-- Insert Outings
INSERT INTO Outing (TourID, GuideID, ScheduledDateTime) VALUES
(1, 1, '2024-02-15 09:00:00'),
(2, 2, '2024-02-16 10:00:00'),
(3, 3, '2024-02-17 08:00:00');

-- Insert Clients
INSERT INTO Client (FirstName, LastName, Telephone, Email) VALUES
('Sarah', 'Johnson', '473-555-0101', 'sarah@email.com'),
('Mike', 'Smith', '473-555-0102', 'mike@email.com'),
('Lisa', 'Brown', '473-555-0103', 'lisa@email.com');

-- Insert Bookings
INSERT INTO Booking (ClientID, OutingID, Rating, ReviewText) VALUES
(1, 1, 5, 'Amazing tour! John was very knowledgeable about spices.'),
(2, 1, 4, 'Great experience, learned a lot about nutmeg.'),
(1, 2, 5, 'Beautiful beach and excellent guide!'),
(3, 3, 4, 'The waterfalls were breathtaking.'),
(3, 1, 5, 'Fantastic spice tour! Would recommend to anyone.');