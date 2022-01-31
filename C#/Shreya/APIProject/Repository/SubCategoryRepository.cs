using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class SubCategoryRepository : GenericRepository<SubCategory> , ISubCategory
    {
        public SubCategoryRepository(MamaEarthDBContext context) : base(context)
        {

        }
         public SubCategory AddSubCategory(int categoryId, SubCategory subCategory) 
        {
            subCategory.CategoryId = categoryId;
            _mamaEarthDBContext.SubCategory.Add(subCategory);
            _mamaEarthDBContext.SaveChanges();
            return subCategory;
        }

        public List<SubCategory> GetSubcategorys(int CategoryId)
        {
            var subCategory = _mamaEarthDBContext.SubCategory
                                .Where(op => op.CategoryId == CategoryId).ToList();
            return subCategory;
        }

        public SubCategory GetSubCategory(int CategoryId, int SubCategoryId)
        {
            var subcategory = _mamaEarthDBContext.SubCategory
                              .SingleOrDefault(op => op.CategoryId == CategoryId && op.SubCategoryId == SubCategoryId);
            return subcategory;
        }

        public SubCategory UpdateSubcategory(int categoryId, int SubcategoryId, SubCategory subCategory)
        {
            var ExistingSubcategory = _mamaEarthDBContext.SubCategory
                            .SingleOrDefault(op => op.CategoryId == categoryId && op.SubCategoryId == SubcategoryId);
            if (ExistingSubcategory != null)
            {
                ExistingSubcategory.SubCategoryName = subCategory.SubCategoryName;
                ExistingSubcategory.Description = subCategory.Description;
            }
            _mamaEarthDBContext.SaveChanges();
            return subCategory;
        }
    }
}
