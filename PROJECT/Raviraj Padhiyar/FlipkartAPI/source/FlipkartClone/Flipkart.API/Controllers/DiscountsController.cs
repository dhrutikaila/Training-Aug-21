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
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Authorization;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountsController : ControllerBase
    {
        private readonly IDiscountService _context;
        private readonly IMapper _mapper;

        public DiscountsController(IDiscountService context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Discounts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Discount>>> GetDiscounts()
        {
            var discounts = await _context.GetAllAsync();

            return Ok(discounts);
        }

        // GET: api/Discounts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Discount>> GetDiscount(int id)
        {
            var discount = await _context.GetByIdAsync(id);

            if (discount == null)
            {
                return NotFound();
            }

            return Ok(discount);
        }

        // PUT: api/Discounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDiscount(int id, [FromBody] Discount discount)
        {
            if (id != discount.DiscountId)
            {
                return BadRequest();
            }

            _context.Update(discount);

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

        // POST: api/Discounts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<ActionResult<Discount>> PostDiscount(Discount discount)
        {
            _context.Create(discount);
            await _context.SaveAsync();

            return CreatedAtAction("GetDiscount", new { id = discount.DiscountId }, discount);
        }

        // DELETE: api/Discounts/5
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDiscount(int id)
        {
            var discount = await _context.GetByIdAsync(id);
            if (discount == null)
            {
                return NotFound();
            }

            discount.IsActive = false;
            _context.Delete(discount);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
