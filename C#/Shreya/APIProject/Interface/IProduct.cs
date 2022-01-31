using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Interface
{
   public interface IProduct : IGenericInterface<Product>
    {
        List<Product> GetProducts(int SubCategoryId);
        Product AddProduct(int SubcategoryId, Product product);
        Product UpdateProduct(int SubCategoryId, int ProductId, Product product);
    }
}
