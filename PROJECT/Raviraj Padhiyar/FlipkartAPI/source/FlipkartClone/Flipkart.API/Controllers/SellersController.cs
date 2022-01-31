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
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Authorization;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SellersController : ControllerBase
    {
        private readonly ISellerService _context;

        public SellersController(ISellerService context)
        {
            _context = context;
        }

        // GET: api/Sellers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Seller>>> GetSellers()
        {
            var sellers =  await _context.GetAllAsync();

            return Ok(sellers);
        }

        // GET: api/Sellers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Seller>> GetSeller(int id)
        {
            var seller = await _context.GetByIdAsync(id);

            if (seller == null)
            {
                return NotFound();
            }

            return Ok(seller);
        }

        // PUT: api/Sellers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSeller(int id,[FromBody] Seller seller)
        {
            if (id != seller.SellerId)
            {
                return BadRequest();
            }

            _context.Update(seller);

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

        // POST: api/Sellers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<ActionResult<Seller>> PostSeller([FromBody] Seller seller)
        {
            _context.Create(seller);
            await _context.SaveAsync();

            return CreatedAtAction("GetSeller", new { id = seller.SellerId }, seller);
        }

        // DELETE: api/Sellers/5
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSeller(int id)
        {
            var seller = await _context.GetByIdAsync(id);
            if (seller == null)
            {
                return NotFound();
            }

            seller.IsActive = false;
            _context.Delete(seller);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
