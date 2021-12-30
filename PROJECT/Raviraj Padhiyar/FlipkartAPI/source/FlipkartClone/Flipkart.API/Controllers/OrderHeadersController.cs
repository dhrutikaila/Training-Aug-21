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

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderHeadersController : ControllerBase
    {
        private readonly IOrderHeaderService _context;

        public OrderHeadersController(IOrderHeaderService context)
        {
            _context = context;
        }

        // GET: api/OrderHeaders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OrderHeader>>> GetOrderHeaders()
        {
            var orderHeaders = await _context.GetAllAsync();

            return Ok(orderHeaders);
        }

        // GET: api/OrderHeaders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OrderHeader>> GetOrderHeader(int id)
        {
            var orderHeader = await _context.GetByIdAsync(id);

            if (orderHeader == null)
            {
                return NotFound();
            }

            return Ok(orderHeader);
        }

        // PUT: api/OrderHeaders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrderHeader(int id,[FromBody] OrderHeader orderHeader)
        {
            if (id != orderHeader.OrderHeaderId)
            {
                return BadRequest();
            }

            _context.Update(orderHeader);

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

        // POST: api/OrderHeaders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<OrderHeader>> PostOrderHeader([FromBody] OrderHeader orderHeader)
        {
            _context.Create(orderHeader);
            await _context.SaveAsync();

            return CreatedAtAction("GetOrderHeader", new { id = orderHeader.OrderHeaderId }, orderHeader);
        }

        // DELETE: api/OrderHeaders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrderHeader(int id)
        {
            var orderHeader = await _context.GetByIdAsync(id);
            if (orderHeader == null)
            {
                return NotFound();
            }

            orderHeader.IsActive = false;
            _context.Delete(orderHeader);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
