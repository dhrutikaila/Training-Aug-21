using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_14_Assignment.Models;

namespace Day_14_Assignment.OrderData
{
    public class SqlOrderData : IOrderData
    {
        private readonly ToyCompanyContext _toyCompanyContext;
        public SqlOrderData(ToyCompanyContext orderContext)
        {
            _toyCompanyContext = orderContext;
        }
        public Order AddOrder(Order order)
        {
            _toyCompanyContext.Orders.Add(order);
            _toyCompanyContext.SaveChanges();
            return order;
        }

        public void DeleteOrder(Order order)
        {
            _toyCompanyContext.Orders.Remove(order);
            _toyCompanyContext.SaveChanges();
        }

        public Order EditOrder(Order order)
        {
            var existingOrder = _toyCompanyContext.Orders.Find(order.OrderId);

            if (existingOrder != null)
            {
                existingOrder.CustomerAddressId = order.CustomerAddressId;
                existingOrder.TotalAmount = order.TotalAmount;
                existingOrder.DiscountAmount = order.DiscountAmount;
                existingOrder.NetAmount = order.NetAmount;

                _toyCompanyContext.Orders.Update(existingOrder);
                _toyCompanyContext.SaveChanges();
            }
            return order;
        }

        public Order GetOrder(int id)
        {
            var order = _toyCompanyContext.Orders.Find(id);
            return order;
        }

        public List<Order> GetOrders()
        {
            return _toyCompanyContext.Orders.ToList();
        }
    }
}