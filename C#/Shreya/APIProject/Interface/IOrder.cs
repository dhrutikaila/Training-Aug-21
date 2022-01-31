using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Interface
{
   public interface IOrder : IGenericInterface<Order>
    {
        void AddOrder(int userid, Order order);

         void RemoveOrder(int id);
    }
}
