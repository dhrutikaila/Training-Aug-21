using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_14_Assignment.Models;

namespace Day_14_Assignment.OrderData
{
    public interface IOrderData
    {
        List<Order> GetOrders();

        Order GetOrder(int id);

        Order AddOrder(Order order);

        void DeleteOrder(Order order);

        Order EditOrder(Order order);
    }
}