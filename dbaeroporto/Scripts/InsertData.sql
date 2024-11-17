
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
