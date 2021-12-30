using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductSellersController : ControllerBase
    {
        private readonly FlipkartAPIDBContext _context;

        public ProductSellersController(FlipkartAPIDBContext context)
        {
            _context = context;
        }

        // GET: api/ProductSellers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductSeller>>> GetProductSellers()
        {
            return await _context.ProductSellers.ToListAsync();
        }

        // GET: api/ProductSellers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductSeller>> GetProductSeller(int id)
        {
            var productSeller = await _context.ProductSellers.FindAsync(id);

            if (productSeller == null)
            {
                return NotFound();
            }

            return productSeller;
        }

        // PUT: api/ProductSellers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProductSeller(int id, ProductSeller productSeller)
        {
            if (id != productSeller.ProductSellerId)
            {
                return BadRequest();
            }

            _context.Entry(productSeller).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductSellerExists(id))
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

        // POST: api/ProductSellers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ProductSeller>> PostProductSeller(ProductSeller productSeller)
        {
            _context.ProductSellers.Add(productSeller);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProductSeller", new { id = productSeller.ProductSellerId }, productSeller);
        }

        // DELETE: api/ProductSellers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProductSeller(int id)
        {
            var productSeller = await _context.ProductSellers.FindAsync(id);
            if (productSeller == null)
            {
                return NotFound();
            }

            _context.ProductSellers.Remove(productSeller);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductSellerExists(int id)
        {
            return _context.ProductSellers.Any(e => e.ProductSellerId == id);
        }
    }
}
