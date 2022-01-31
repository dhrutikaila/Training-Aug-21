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

    public class OrderStatusRepository : GenericRepository<OrderStatus>, IOrderStatus
    {
        private readonly ZomatoApp_ProjectContext _context;
        public OrderStatusRepository(ZomatoApp_ProjectContext context) : base(context)
        {
            _context=context;
        }


    public async Task<List<Cart>> GetCartsAsync()
    {
        var records = await _context.Carts.Select(x => new Cart()
        {
            CartId = x.CartId,
            ProductId = x.ProductId,
            ProductQuantity = x.ProductQuantity,
            ProductName = x.ProductName,
            ProductPrice = x.ProductPrice,
            UserId = x.UserId
        }).ToListAsync();

        return records;
    }
}
}
