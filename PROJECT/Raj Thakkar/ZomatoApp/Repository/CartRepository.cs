using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;
using ZomatoApp.DBContext;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

namespace ZomatoApp.Repository
{
    public class CartRepository : GenericRepository<Cart>, ICart
    {
        private readonly ZomatoApp_ProjectContext _context;
        private readonly IMapper _mapper;

        public CartRepository(ZomatoApp_ProjectContext context, IMapper mapper) : base(context)
        {
            _context=context;
            _mapper=mapper;
        }


        public async Task<List<Cart>> GetCartsAsync()
        {
            //var records = await _context.Carts.Select(x => new Cart()
            //{
            //    CartId = x.CartId,
            //    ProductId = x.ProductId,
            //    ProductQuantity = x.ProductQuantity,
            //    ProductName = x.ProductName,
            //    ProductPrice = x.ProductPrice,
            //    UserId = x.UserId
            var cart = await _context.Carts.ToListAsync();
            //}).ToListAsync();

            return _mapper.Map<List<Cart>>(cart);
        }
        

    }
}
