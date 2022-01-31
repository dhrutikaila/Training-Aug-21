using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface IOrderDetails
    {
        List<OrderDetail> GetOrderDetails();

        OrderDetail GetOrderDetail(int id);

        OrderDetail PostOrderDetail(OrderDetail orderdetail);

        OrderDetail PutOrderDetail(OrderDetail orderdetail);

        void DeleteOrderDetail(OrderDetail orderdetail);
    }
}
