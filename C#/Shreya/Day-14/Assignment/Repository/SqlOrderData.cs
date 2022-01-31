using Day_14_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Repository
{
    public class SqlOrderData : IOrderDetail
    {
        private ToyCompanyContext _toyCompanyContext;
        public SqlOrderData(ToyCompanyContext toyCompanyContext)
        {
            _toyCompanyContext = toyCompanyContext;
        }
        public Order AddOrder(Order order)
        {
            _toyCompanyContext.Order.Add(order);
            _toyCompanyContext.SaveChanges();
            return order;
        }

        public void deleteOrder(Order order)
        {
            _toyCompanyContext.Order.Remove(order);
            _toyCompanyContext.SaveChanges();
        }

        public Order getOrder(int id)
        {
            var order = _toyCompanyContext.Order.Find(id);
            return order;
        }

        public List<Order> GetOrders()
        {
            return _toyCompanyContext.Order.ToList();
        }

        public Order updateOrder(Order order)
        {
            var ExistingOrder = _toyCompanyContext.Order.Find(order.OrderId);
            if (ExistingOrder != null)
            {
                ExistingOrder.TotalAmount = order.TotalAmount;
                ExistingOrder.CustomerAddress = order.CustomerAddress;
                ExistingOrder.NetAmount = order.NetAmount;
                ExistingOrder.TotalDiscount = order.TotalDiscount;
                _toyCompanyContext.Order.Update(order);
                _toyCompanyContext.SaveChanges();
            }
            return order;
        }

        Order IOrderDetail.deleteOrder(Order order)
        {
            throw new NotImplementedException();
        }
    }
}
