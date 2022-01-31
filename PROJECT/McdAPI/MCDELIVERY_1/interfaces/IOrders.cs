using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface IOrders
    {
        List<Order> GetOrders();

        Order GetOrder(int id);

        Order PostOrder(Order order);

        Order PutOrder(Order order);

        void DeleteOrder(Order order);
    }
}
