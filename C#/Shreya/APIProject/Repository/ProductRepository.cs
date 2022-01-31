using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class ProductRepository : GenericRepository<Product> , IProduct
    {
        public ProductRepository(MamaEarthDBContext context):base(context)
        {

        }

        public Product AddProduct(int SubcategoryId, Product product)
        {
            product.SubCategoryid = SubcategoryId;
            var discount = _mamaEarthDBContext.Discount
                            .Where(x => x.DiscountId == product.DiscountId)
                            //.Select(x=>x.Percentage)
                            .ToList();
            decimal price = 0;
            if (discount.Count == 0 && product.DiscountId == 0)
            {
                product.UpdatedPrice = product.ProductPrice;
            }
            else
            {
                foreach (var item in discount)
                {

                    price = product.ProductPrice - (product.ProductPrice * item.Percentage / 100);
                    product.UpdatedPrice = price;
                }
            }
            _mamaEarthDBContext.Product.Add(product);
            _mamaEarthDBContext.SaveChanges();
            return product;
        }

        public List<Product> GetProducts(int SubCategoryId)
        {
            var product = _mamaEarthDBContext.Product
                                 .Where(op => op.SubCategoryid == SubCategoryId).ToList();
            return product;
        }

        public Product UpdateProduct(int SubCategoryId, int ProductId, Product product)
        {
            var ExistingProduct = _mamaEarthDBContext.Product
                            .SingleOrDefault(op => op.SubCategoryid == SubCategoryId && op.ProductId == ProductId);
            if (ExistingProduct != null)
            {
                ExistingProduct.ProductName = product.ProductName;
                ExistingProduct.ProductPrice = product.ProductPrice;
            }
            _mamaEarthDBContext.SaveChanges();
            return product;
        }
    }
}
