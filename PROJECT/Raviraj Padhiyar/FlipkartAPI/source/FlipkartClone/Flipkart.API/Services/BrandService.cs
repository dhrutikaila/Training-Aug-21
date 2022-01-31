using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;

namespace Flipkart.API.Services
{
    public class BrandService : GenericService<Brand>, IBrandService
    {
        public BrandService(FlipkartAPIDBContext context) : base(context)
        {

        }
    }
}
