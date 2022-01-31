using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;
using ZomatoApp.DBContext;
using Microsoft.EntityFrameworkCore;

namespace ZomatoApp.Repository
{

    public class OrderRepository : GenericRepository<Ordertable>, IOrder
    {
        private readonly ZomatoApp_ProjectContext _context;
        public OrderRepository(ZomatoApp_ProjectContext context) : base(context)
        {
           _context=context;
        }


    public async Task<List<Ordertable>>GetOrdertablesAsync()
    {
        var records = await _context.Ordertables.Select(x => new Ordertable()
        {
            Orderid = x.Orderid,
            Dates = x.Dates,
            CustomerName = x.CustomerName,
            CustomerId = x.CustomerId,
            Orderstats = x.Orderstats,
            Paymentid = x.Paymentid
        }).ToListAsync();

        return records;
    }
}
}