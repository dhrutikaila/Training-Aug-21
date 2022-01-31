using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class CartRepository : ICart
    {
        private readonly MCDELIVERY1Context _context;

        public CartRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteCart(Cart cart)
        {
            _context.Carts.Remove(cart);
            _context.SaveChanges();
        }


        public Cart GetCart(int id)
        {
            var cart = _context.Carts.Find(id);
            return cart;
        }
       

        public List<Cart> GetCarts()
        {
            return _context.Carts.ToList();
        }


        public Cart PostCart(Cart cart)
        {
            _context.Carts.Add(cart);
            _context.SaveChanges();
            return cart;
        }

        public Cart PutCart(Cart cart)
        {
            var Existcart = _context.Carts.Find(cart.CartId);
            if (Existcart != null)
            {
                Existcart.DatePlaced = Existcart.DatePlaced;//here date is used for edit
                _context.Carts.Update(Existcart);
                _context.SaveChanges();
            }
            return cart;
        }


    }
}
