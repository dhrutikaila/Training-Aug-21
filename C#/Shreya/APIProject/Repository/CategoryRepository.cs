using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace APIProject.Repository
{
    public class CategoryRepository : GenericRepository<Category> , ICategory
    {
        public CategoryRepository(MamaEarthDBContext context) : base(context)
        {

        }
    }
}
