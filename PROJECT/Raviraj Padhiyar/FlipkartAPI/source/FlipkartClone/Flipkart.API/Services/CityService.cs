using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;

namespace Flipkart.API.Services
{
    public class CityService : GenericService<City> , ICityService
    {

        public CityService(FlipkartAPIDBContext context) : base(context)
        {

        }

        public IEnumerable<City> GetActive(IEnumerable<City> cities)
        {
            return cities.Where(c => c.IsActive == true);
        }
    }
}
