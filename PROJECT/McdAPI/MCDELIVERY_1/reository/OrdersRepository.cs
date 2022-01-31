using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class OrdersRepository : IOrders
    {
        private readonly MCDELIVERY1Context _context;

        public OrdersRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteOrder(Order order)
        {
            _context.Orders.Remove(order);
            _context.SaveChanges();
        }

        public Order GetOrder(int id)
        {
            var order = _context.Orders.Find(id);
            return order;
        }

        public List<Order> GetOrders()
        {
            return _context.Orders.ToList();
        }


        public Order PostOrder(Order order)
        {
            _context.Orders.Add(order);
            _context.SaveChanges();
            return order;
        }

        public Order PutOrder(Order order)
        {
            var ExistOrder = _context.Orders.Find(order.OrderId);
            if (ExistOrder != null)
            {
                ExistOrder.OrderDetails = order.OrderDetails;//here order details is used for edit
                _context.Orders.Update(ExistOrder);
                _context.SaveChanges();
            }
            return order;

        }

    }
}




