
-- Views
CREATE VIEW AvailableFlights AS
SELECT FlightID, FlightNumber, Origin, Destination, DepartureTime, ArrivalTime, Airline
FROM Flights;
