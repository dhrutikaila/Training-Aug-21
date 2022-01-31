using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class OrderDetailRepository : GenericRepository<OrderDetail> , IOrderDetail
    {
        public OrderDetailRepository(MamaEarthDBContext context) : base(context)
        {
        }
    }
}
