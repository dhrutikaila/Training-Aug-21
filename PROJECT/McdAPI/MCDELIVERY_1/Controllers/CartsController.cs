using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MCDELIVERY_1.Models;
using MCDELIVERY_1.interfaces;

namespace MCDELIVERY_1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartsController : ControllerBase
    {
        private ICart _context;

        public CartsController(ICart context)
        {
            _context = context;
        }


        // GET: api/Carts
        [HttpGet]
        public IActionResult GetCarts()
        {
            return Ok(_context.GetCarts());
        }

        // GET: api/Carts/5
        [HttpGet("{id}")]
        public IActionResult GetCart(int id)
        {

            var cart = _context.GetCart(id);

            if (cart != null)
            {
                return Ok(cart);
            }

            return NotFound("cart not found");
        }

        // PUT: api/Carts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutCart(int id, Cart cart)
        {
            var Editcart = _context.GetCart(id);
            if (Editcart != null)
            {
                cart.CartId = Editcart.CartId;
                _context.PutCart(cart);
            }
            return Ok(cart);
        }

        // POST: api/Carts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostCart(Cart cart)
        {
            _context.PostCart(cart);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + cart.CartId, cart);
        }

        // DELETE: api/Carts/5
        [HttpDelete("{id}")]
        public IActionResult DeleteCart(int id)
        {

            var cart = _context.GetCart(id);
            if (cart != null)
            {
                _context.DeleteCart(cart);
                return Ok();
            }
            return NotFound($"cart with id: {id} is not found");
        }

        //private bool CartExists(int id)
        //{
        //    return _context.Carts.Any(e => e.CartId == id);
        //}
    }
}
