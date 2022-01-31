using Day_14_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Repository
{
    public interface IOrderDetail
    {
        List<Order> GetOrders();
        Order getOrder(int id);
        Order AddOrder(Order order);
        Order updateOrder(Order order);
        Order deleteOrder(Order order);

    }
}
