using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;
using ZomatoApp.DBContext;
using Microsoft.EntityFrameworkCore;

namespace ZomatoApp.Repository
{
    
    public class CategoryRepository : GenericRepository<Category>, ICategory
    {
        private readonly ZomatoApp_ProjectContext _context;
        public CategoryRepository(ZomatoApp_ProjectContext context) : base(context)
        {
          _context=context;
        }


        public async Task<List<Category>>GetCategoriesAsync()
        {
            var records = await _context.Categories.Select(x => new Category()
            {
                CategoryId = x.CategoryId,
                CategoryName = x.CategoryName,
                ResId = x.ResId,
                ResName = x.ResName
            }).ToListAsync();

            return records;
        }

    }
}
