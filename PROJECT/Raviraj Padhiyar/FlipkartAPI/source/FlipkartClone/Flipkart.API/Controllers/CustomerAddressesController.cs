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
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Authorization;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerAddressesController : ControllerBase
    {
        private readonly ICustomerAddressService _context;
        private readonly IMapper _mapper;

        public CustomerAddressesController(ICustomerAddressService context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/CustomerAddresses
        [Authorize(Roles = UserRoles.Admin)]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomerAddressDto>>> GetCustomerAddresses()
        {
            var customerAddresses = await _context.GetAllAsync();

            return Ok(_mapper.Map<IEnumerable<CustomerAddressDto>>(customerAddresses));
        }

        // GET: api/CustomerAddresses/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CustomerAddressDto>> GetCustomerAddress(int id)
        {
            var customerAddress = await _context.GetByIdAsync(id);

            if (customerAddress == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<CustomerAddressDto>(customerAddress));
        }

        // PUT: api/CustomerAddresses/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCustomerAddress(int id,[FromBody] CustomerAddress customerAddress)
        {
            if (id != customerAddress.CustomerAddressId)
            {
                return BadRequest();
            }

            _context.Update(customerAddress);

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

        // POST: api/CustomerAddresses
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CustomerAddress>> PostCustomerAddress(CustomerAddress customerAddress)
        {
            _context.Create(customerAddress);
            await _context.SaveAsync();

            var customerAddressToReturn = _mapper.Map<CustomerAddress>(customerAddress);

            return CreatedAtAction("GetCustomerAddress", new { id = customerAddressToReturn.CustomerAddressId }, customerAddressToReturn);
        }

        // DELETE: api/CustomerAddresses/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCustomerAddress(int id)
        {
            var customerAddress = await _context.GetByIdAsync(id);
            if (customerAddress == null)
            {
                return NotFound();
            }

            customerAddress.IsActive = false;
            _context.Delete(customerAddress);
            await _context.SaveAsync();
            
            return NoContent();
        }
    }
}
