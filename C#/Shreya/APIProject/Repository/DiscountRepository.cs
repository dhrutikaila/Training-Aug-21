using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class DiscountRepository : GenericRepository<Discount> , IDiscount
    {
        public DiscountRepository(MamaEarthDBContext context) : base(context)
        {

        }
    }
}
