using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZomatoApp.DBContext;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitiesController : ControllerBase
    {
        private readonly ICity city;

        public CitiesController(ICity _city)
        {
            city = _city;
        }

        // GET: api/Cities
        [HttpGet]
        public IEnumerable<City> GetCities()
        {
            //var city = await _context.Cities.ToListAsync();
            return city.GetAll();
        }

        // GET: api/Cities/id
        [HttpGet("{id}")]
        public async Task<ActionResult<City>> GetCity(int id)
        {
            var city1 = city.GetById(id);

            if (city1 == null)
            {
                return NotFound();
            }

            return city1;
        }

        // PUT: api/Cities/id
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCity(int id, City city1)
        {
            if (id != city1.CityId)
            {
                return BadRequest();
            }


            try
            {
                city.Update(city1);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return NoContent();
        }

        // POST: api/Cities
        [HttpPost]
        public async Task<ActionResult<City>> PostCity(City city1)
        {
            city.Create(city1);

            return CreatedAtAction("GetCity", new { id = city1.CityId }, city1);
        }

        // DELETE: api/Cities/id
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCity(int id)
        {
            var city1 = city.GetById(id);
            if (city1 == null)
            {
                return NotFound();
            }

            city.Delete(city1);
            
            return NoContent();
        }

      
    }
}
