
// Example Controller for Flights

public class FlightsController : Controller
{
    private readonly AirportDbContext _context;

    public FlightsController(AirportDbContext context)
    {
        _context = context;
    }

    // GET: Flights
    public async Task<IActionResult> Index()
    {
        return View(await _context.Flights.ToListAsync());
    }

    // GET: Flights/Details/5
    public async Task<IActionResult> Details(int? id)
    {
        if (id == null) return NotFound();
        var flight = await _context.Flights.FirstOrDefaultAsync(m => m.FlightID == id);
        if (flight == null) return NotFound();
        return View(flight);
    }
}
