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
using Microsoft.AspNetCore.Authorization;
using Flipkart.API.Authentication;

namespace Flipkart.API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class AddressesController : ControllerBase
    {
        private readonly IAddressService _context;
        private readonly IMapper _mapper;

        public AddressesController(IAddressService context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Addresses
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AddressDto>>> GetAddresses()
        {
            var addresses = await _context.GetAllAsync();

            return Ok(_mapper.Map<IEnumerable<AddressDto>>(addresses));
        }

        // GET: api/Addresses/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AddressDto>> GetAddress(int id)
        {
            var address = await _context.GetByIdAsync(id);

            if (address == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<AddressDto>(address));
        }

        // PUT: api/Addresses/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAddress(int id,[FromBody] AddressDto address)
        {
            if (id != address.AddressId)
            {
                return BadRequest();
            }

            var addressEntity = _mapper.Map<Address>(address);
            _context.Update(addressEntity);
            
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

        // POST: api/Addresses
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AddressDto>> PostAddress([FromBody] AddressDto address)
        {
            var addressEntity = _mapper.Map<Address>(address);

            _context.Create(addressEntity);
            await _context.SaveAsync();

            var addressToReturn = _mapper.Map<AddressDto>(addressEntity);

            return CreatedAtAction("GetAddress", new { id = addressToReturn.AddressId }, addressToReturn);
        }

        // DELETE: api/Addresses/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAddress(int id)
        {
            var address = await _context.GetByIdAsync(id);
            if (address == null)
            {
                return NotFound();
            }

            address.IsActive = false;
            _context.Delete(address);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
