using APIProject.Interface;
using APIProject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class OrderRepository : GenericRepository<Order>, IOrder
    {
        public OrderRepository(MamaEarthDBContext context) : base(context)
        {
        }
        public  void AddOrder(int userid ,Order order)
        {
            
            var user = _mamaEarthDBContext.CartItem.Where(x => x.UserId == userid).ToList();
            order.UserId = userid;
            decimal total = 0;
            var cartItems = _mamaEarthDBContext.CartItem
                            .Include(x => x.OrderDetails).Where(x=>x.UserId == userid).
                            ToList();
            //var cartItem = _mamaEarthDBContext.CartItem
              //          .Include(o => o.OrderDetails)
                        //.ThenInclude(o=>o.CartItem)
                        //.Where(o => o.OrderDetails. == userid && o => )
            //var cartItems = _mamaEarthDBContext.CartItem.Include(o=>o.OrderDetails)
            //                .ThenInclude(o=>o.Order)
            //                .Where(o=>o.UserId == userid && o.CartItemId == order.OrderDetails.)
           foreach (var item in cartItems)
           {
                  total = total + item.Price;
           }
           order.TotalPrice = total;
           _mamaEarthDBContext.Add(order);
           _mamaEarthDBContext.SaveChanges();
           if (order.OrderDetails.Count() > 0)
           {
               _mamaEarthDBContext.OrderDetails.AddRange(order.OrderDetails);
           }  
        }

        public void RemoveOrder(int id)
        {
            var order = _mamaEarthDBContext.Orders.Where(x => x.OrderId == id).SingleOrDefault();

        }
    }
}
    
