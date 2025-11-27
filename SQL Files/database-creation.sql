-- Create Database for Spice Isle Tours
CREATE DATABASE IF NOT EXISTS SpiceIsleToursDB;
USE SpiceIsleToursDB;

-- Tour Table
CREATE TABLE Tour (
    TourID INT PRIMARY KEY AUTO_INCREMENT,
    TourName VARCHAR(100) NOT NULL,
    LengthHours DECIMAL(3,1) NOT NULL,
    Fee DECIMAL(10,2) NOT NULL
);

-- Location Table
CREATE TABLE Location (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100) NOT NULL,
    LocationType VARCHAR(50) DEFAULT NULL,
    Address TEXT DEFAULT NULL,
    OfficialDescription TEXT DEFAULT NULL
);

-- Guide Table
CREATE TABLE Guide (
    GuideID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    HomeAddress TEXT NOT NULL,
    DateOfHire DATE NOT NULL
);

-- Certification Table
CREATE TABLE Certification (
    GuideID INT NOT NULL,
    LocationID INT NOT NULL,
    TestDate DATE NOT NULL,
    PRIMARY KEY (GuideID, LocationID),
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- TourItinerary Table
CREATE TABLE TourItinerary (
    TourID INT NOT NULL,
    LocationID INT NOT NULL,
    VisitOrder INT NOT NULL,
    PRIMARY KEY (TourID, LocationID),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Outing Table
CREATE TABLE Outing (
    OutingID INT PRIMARY KEY AUTO_INCREMENT,
    TourID INT NOT NULL,
    GuideID INT NOT NULL,
    ScheduledDateTime DATETIME NOT NULL,
    FOREIGN KEY (TourID) REFERENCES Tour(TourID),
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID)
);

-- Client Table
CREATE TABLE Client (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Telephone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Booking Table
CREATE TABLE Booking (
    ClientID INT NOT NULL,
    OutingID INT NOT NULL,
    Rating INT DEFAULT NULL,
    ReviewText TEXT DEFAULT NULL,
    PRIMARY KEY (ClientID, OutingID),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (OutingID) REFERENCES Outing(OutingID)
);