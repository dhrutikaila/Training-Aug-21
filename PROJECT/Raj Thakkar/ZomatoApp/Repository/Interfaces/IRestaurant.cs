using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;

namespace ZomatoApp.Repository.Interfaces
{
    public interface IRestaurant : GenericInterface<Restaurant>
    {
        public IEnumerable<Restaurant> GetRestaurants();
    }
}
