using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;

namespace ZomatoApp.Repository.Interfaces
{
    public interface ICart : GenericInterface<Cart>
    {
       Task<List<Cart>> GetCartsAsync();

    }
}
