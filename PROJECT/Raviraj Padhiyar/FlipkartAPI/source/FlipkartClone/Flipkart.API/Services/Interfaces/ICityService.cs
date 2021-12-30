using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.Models;

namespace Flipkart.API.Services.Interfaces
{
    public interface ICityService : IGenericService<City>
    {
        IEnumerable<City> GetActive(IEnumerable<City> cities);
    }
}
