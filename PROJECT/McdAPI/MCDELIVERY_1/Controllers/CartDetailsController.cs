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
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CartDetailsController : ControllerBase
    {
        private  ICartDetails _context;

        public CartDetailsController(ICartDetails context)
        {
            _context = context;
        }


        // GET: api/CartDetails
        [HttpGet]
        public IActionResult GetCartDetails()
        {
            return Ok(_context.GetCartDetails());
        }


        // GET: api/CartDetails/5
        [HttpGet("{id}")]
        public IActionResult GetCartDetail(int id)
        {
            var cartdetail = _context.GetCartDetail(id);

            if (cartdetail != null)
            {
                return Ok(cartdetail);
            }

            return NotFound("cart detail not found");
        }

        // PUT: api/CartDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutCart(int id, CartDetail cartdetail)
        {
            var Editcartdetail = _context.GetCartDetail(id);
            if (Editcartdetail != null)
            {
                cartdetail.CartDetailId = Editcartdetail.CartDetailId;
                _context.PutCartDetails(cartdetail);
            }
            return Ok(cartdetail);
        }


        // POST: api/CartDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostCartDetail(CartDetail cartDetail)
        {
            _context.PostCartDetail(cartDetail);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + cartDetail.CartDetailId, cartDetail);
        }

        // DELETE: api/CartDetails/5
        [HttpDelete("{id}")]
        public IActionResult DeleteCartDetail(int id)
        {
            var cartDetail= _context.GetCartDetail(id);
            if (cartDetail != null)
            {
                _context.DeleteCartDetail(cartDetail);
                return Ok();
            }
            return NotFound($"Admin with id: {id} is not found");
        }


        //private bool CartDetailExists(int id)
        //{
        //    return _context.CartDetails.Any(e => e.CartDetailId == id);
        //}
    }
}


