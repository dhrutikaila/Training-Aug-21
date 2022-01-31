using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Interface
{
    public interface ISubCategory : IGenericInterface<SubCategory>
    {
        SubCategory AddSubCategory(int CategoryId, SubCategory subCategory);
        List<SubCategory> GetSubcategorys(int CategoryId);
        SubCategory GetSubCategory(int CategoryId, int SubCategoryId);
        SubCategory UpdateSubcategory(int categoryId, int SubcategoryId, SubCategory subCategory);
    }
}
