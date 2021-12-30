using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface ICart
    {
        List<Cart> GetCarts();

        Cart GetCart(int id);

        Cart PostCart(Cart cart);

        Cart PutCart(Cart cart);

        void DeleteCart(Cart cart);
    }
}
