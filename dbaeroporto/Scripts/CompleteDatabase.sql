
CREATE DATABASE CompleteAirportDB;
USE CompleteAirportDB;

-- Table for Flights
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY IDENTITY(1,1),
    FlightNumber VARCHAR(10) NOT NULL UNIQUE,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    Origin VARCHAR(100) NOT NULL,
    Destination VARCHAR(100) NOT NULL,
    Airline VARCHAR(100) NOT NULL
);

-- Table for Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) CHECK (LEN(Phone) >= 10)
);

-- Table for Tickets with foreign key relationships
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY IDENTITY(1,1),
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    SeatNumber VARCHAR(5) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID) ON DELETE CASCADE,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID) ON DELETE CASCADE
);

-- Table for Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL
);

-- Table for Aircrafts
CREATE TABLE Aircrafts (
    AircraftID INT PRIMARY KEY IDENTITY(1,1),
    Model VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL
);

-- Insert Sample Data
INSERT INTO Flights (FlightNumber, DepartureTime, ArrivalTime, Origin, Destination, Airline)
VALUES
('AA123', '2024-12-01 08:00', '2024-12-01 12:00', 'New York', 'Los Angeles', 'American Airlines'),
('DL456', '2024-12-01 09:00', '2024-12-01 13:30', 'Atlanta', 'Seattle', 'Delta Airlines');

INSERT INTO Passengers (FirstName, LastName, Email, Phone)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321');

INSERT INTO Tickets (PassengerID, FlightID, SeatNumber, Price)
VALUES
(1, 1, '12A', 250.00),
(2, 2, '18C', 300.00);

INSERT INTO Employees (FirstName, LastName, JobTitle, HireDate)
VALUES
('Michael', 'Brown', 'Pilot', '2018-03-15'),
('Sarah', 'Connor', 'Flight Attendant', '2020-06-20');

INSERT INTO Aircrafts (Model, Capacity)
VALUES
('Boeing 747', 400),
('Airbus A320', 180);

-- Views
CREATE VIEW AvailableFlights AS
SELECT FlightID, FlightNumber, Origin, Destination, DepartureTime, ArrivalTime, Airline
FROM Flights;

-- Triggers
CREATE TRIGGER TicketUpdateLog
ON Tickets
AFTER UPDATE
AS
BEGIN
    PRINT 'A ticket has been updated.'
END;

-- Stored Procedures
CREATE PROCEDURE ReserveTicket
    @PassengerID INT,
    @FlightID INT,
    @SeatNumber VARCHAR(5),
    @Price DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Tickets (PassengerID, FlightID, SeatNumber, Price)
    VALUES (@PassengerID, @FlightID, @SeatNumber, @Price);
END;
