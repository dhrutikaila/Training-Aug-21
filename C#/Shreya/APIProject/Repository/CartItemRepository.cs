using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class CartItemRepository : GenericRepository<CartItem> , ICartItem
    {
        public CartItemRepository(MamaEarthDBContext context) : base(context)
        {
        }
        public CartItem AddCartItem(CartItem cartItem)
        {
            //cartItem.UserId = Userid;
           // var item = _mamaEarthDBContext.Product.Where(x => x.ProductId == productid).FirstOrDefault();
            var price = _mamaEarthDBContext.Product.
                        Where(x => x.ProductId == cartItem.ProductId).
                        Select(x=>x.ProductPrice).SingleOrDefault();

            var total = cartItem.Quantity * price;
            cartItem.Price = total;
            _mamaEarthDBContext.CartItem.Add(cartItem);
            _mamaEarthDBContext.SaveChanges();
            return cartItem;
        }   

        public CartItem GetCartItem(int userid, int cartitemid)
        {
            var cart = _mamaEarthDBContext.CartItem
                              .SingleOrDefault(op => op.CartItemId == cartitemid && op.UserId == userid);
            return cart;
        }

        public List<CartItem> GetCartItems(int cartitemid)
        {
            var cart = _mamaEarthDBContext.CartItem
                               .Where(op => op.UserId == cartitemid).ToList();
            return cart;
        }

        public CartItem UpdateCart(int productid, int cartitemid, CartItem cartItem)
        {
            var ExistingCart = _mamaEarthDBContext.CartItem
                           .SingleOrDefault(op => op.CartItemId == cartitemid && op.ProductId == productid);
            if (ExistingCart != null)
            {
                ExistingCart.Quantity = cartItem.Quantity;
            }
            _mamaEarthDBContext.SaveChanges();
            return cartItem;
        }
    }
}
