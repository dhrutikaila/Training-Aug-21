using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;
using AutoMapper;
using Flipkart.API.DTOs;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitiesController : ControllerBase
    {
        private readonly ICityService _context;
        private readonly IMapper _mapper;

        public CitiesController(ICityService context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Cities
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CityDto>>> GetCities()
        {
            var cities = await _context.GetAllAsync();
            
            return Ok(_mapper.Map<IEnumerable<CityDto>>(cities));
        }

        // GET: api/Cities/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CityDto>> GetCity(int id)
        {
            var city = await _context.GetByIdAsync(id);

            if (city == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<CityDto>(city));
        }

        // PUT: api/Cities/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCity(int id,[FromBody] CityDto city)
        {
            if (id != city.CityId)
            {
                return BadRequest();
            }

            var cityEntity = _mapper.Map<City>(city);

            _context.Update(cityEntity);

            try
            {
                await _context.SaveAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!_context.Exists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Cities
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<City>> PostCity([FromBody] CityDto city)
        {
            var cityEntity = _mapper.Map<Models.City>(city);


            _context.Create(cityEntity);
            await _context.SaveAsync();

            var cityToReturn = _mapper.Map<CityDto>(city);

            return CreatedAtAction("GetCity", new { id = cityToReturn.CityId }, cityToReturn);
        }

        // DELETE: api/Cities/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCity(int id)
        {
            var city = await _context.GetByIdAsync(id);
            if (city == null)
            {
                return NotFound();
            }
            city.IsActive = false;
            _context.Delete(city);
            await _context.SaveAsync();
            
            return NoContent();
        }
    }
}
