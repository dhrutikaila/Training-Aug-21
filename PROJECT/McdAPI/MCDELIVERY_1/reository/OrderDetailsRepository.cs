using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class OrderDetailsRepository : IOrderDetails
    {
        private readonly MCDELIVERY1Context _context;

        public OrderDetailsRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteOrderDetail(OrderDetail orderdetail)
        {
            _context.OrderDetails.Remove(orderdetail);
            _context.SaveChanges();
        }

        public OrderDetail GetOrderDetail(int id)
        {
            var orderdetail = _context.OrderDetails.Find(id);
            return orderdetail;
        }

        public List<OrderDetail> GetOrderDetails()
        {
            return _context.OrderDetails.ToList();
        }

        public OrderDetail PostOrderDetail(OrderDetail orderdetail)
        {
            _context.OrderDetails.Add(orderdetail);
            _context.SaveChanges();
            return orderdetail;
        }

        public OrderDetail PutOrderDetail(OrderDetail orderdetail)
        {
            var ExistOrderDetail = _context.OrderDetails.Find(orderdetail.OrderDetailsId);
            if (ExistOrderDetail != null)
            {
                ExistOrderDetail.Product = orderdetail.Product;//here product is used for edit
                _context.OrderDetails.Update(ExistOrderDetail);
                _context.SaveChanges();
            }
            return orderdetail;

        }


    }
}