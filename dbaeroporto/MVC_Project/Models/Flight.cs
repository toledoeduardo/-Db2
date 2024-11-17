
// Auto-generated models using Scaffold-DbContext
// Example of the Flight model generated:

public class Flight
{
    public int FlightID { get; set; }
    public string FlightNumber { get; set; }
    public DateTime DepartureTime { get; set; }
    public DateTime ArrivalTime { get; set; }
    public string Origin { get; set; }
    public string Destination { get; set; }
    public string Airline { get; set; }

    public ICollection<Ticket> Tickets { get; set; }
}
