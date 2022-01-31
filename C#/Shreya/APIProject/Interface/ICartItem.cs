using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Interface
{
    public interface ICartItem : IGenericInterface<CartItem>
    {
        CartItem AddCartItem(CartItem cartItem);
        List<CartItem> GetCartItems(int cartitemid);
        CartItem GetCartItem(int userid, int cartitemid);
        CartItem UpdateCart(int productid, int cartitemid, CartItem cartItem);
    }
}
