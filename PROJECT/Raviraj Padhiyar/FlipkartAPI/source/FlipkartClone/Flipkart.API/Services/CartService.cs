using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;

namespace Flipkart.API.Services
{
    public class CartService : GenericService<Cart> , ICartService
    {
        public CartService(FlipkartAPIDBContext context) : base(context)
        {

        }
    }
}
