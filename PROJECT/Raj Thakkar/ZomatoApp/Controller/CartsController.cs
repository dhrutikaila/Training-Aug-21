using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartsController : ControllerBase
    {
        private readonly ICart cart;

        public CartsController(ICart _cart)
        {
            cart = _cart;
        }

        // GET: api/Carts
        [HttpGet]
    
        public async Task<ActionResult> GetCarts()
        {
            var carts = await cart.GetCartsAsync();
            return Ok(carts);
        }

        // GET: api/Carts/id
        [HttpGet("{id}")]
        public async Task<ActionResult<Cart>> GetCart(int id)
        {
            var cart1 = cart.GetById(id);

            if (cart1 == null)
            {
                return NotFound();
            }

            return cart1;
        }

        // PUT: api/Carts/id
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCart([FromRoute]int id,[FromBody] Cart cart1)
        {
            if (id != cart1.CartId)
            {
                return BadRequest();
            }


            try
            {
                cart.Update(cart1);
            }
            catch (Exception ex)
            {
                if (!CartExists(id))
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

        // POST: api/Carts
        [HttpPost]
        public async Task<ActionResult<Cart>> PostCart(Cart cart1)
        {
            cart.Create(cart1);

            return CreatedAtAction("GetCart", new { id = cart1.CartId }, cart1);
        }

        // DELETE: api/Carts/id
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCart(int id)
        {
            var cart1 = cart.GetById(id);
            if (cart1 == null)
            {
                return NotFound();
            }

            cart.Delete(cart1);
            return NoContent();
        }

        private bool CartExists(int id)
        {
            return cart.Any(e => e.CartId == id);
        }
    }
}
