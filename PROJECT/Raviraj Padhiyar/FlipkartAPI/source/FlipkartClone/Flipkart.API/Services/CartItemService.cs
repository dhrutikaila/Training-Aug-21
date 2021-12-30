using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;

namespace Flipkart.API.Services
{
    public class CartItemService : GenericService<CartItem> , ICartItemsService
    {
        public CartItemService(FlipkartAPIDBContext context) : base(context)
        {

        }
    }
}
