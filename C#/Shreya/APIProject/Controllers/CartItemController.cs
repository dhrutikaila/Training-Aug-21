using APIProject.Authentication;
using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace APIProject.Controllers
{
   
    [ApiController]
    public class CartItemController : ControllerBase
    {
        private readonly ICartItem _cartItem;
        public CartItemController(ICartItem cartItem)
        {
            _cartItem = cartItem;
        }

        [HttpPost]
        [Route("/api/[Controller]")]
       // [Authorize(Roles = UserRoles.User)]
        public IActionResult GetById(CartItem cartItem)
        {
            _cartItem.AddCartItem(cartItem);
            return Ok(cartItem);
        }

        [HttpGet]
        [Route("User/{id}/CartItem")]
       // [Authorize(Roles = UserRoles.User)]
        public IActionResult GetCartById(int id)
        {
            var cartItem = _cartItem.GetCartItems(id);
            if (cartItem == null)
            {
                return NotFound($"Cart Item with this id {id} is empty");
            }
            return Ok(cartItem);
        }

        [HttpPatch]
        [Route("CartItem/{catid}")]
        [Authorize(Roles = UserRoles.User)]
        public IActionResult UpdateCart(int cartid, int id, CartItem cartItem)
        {
            cartItem.CartItemId = cartid;
            cartItem.ProductId = id;
            var ExistingCart = _cartItem.UpdateCart(cartid, id,cartItem);
            if (ExistingCart == null)                                                                   
            {
                return NotFound($"Cart Item with this id {id} was not found");
            }
            return Ok(cartItem);
        }
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteCart(int id)
        {
            var cart = _cartItem.GetById(id);
            if (cart != null)
            {
                _cartItem.Delete(cart);
                return Ok();
            }
            return NotFound($"Cart with this id {id} was not found");
        }
    }
}
