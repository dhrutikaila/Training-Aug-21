using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.ResourceParameters;
using Flipkart.API.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Flipkart.API.Services
{
    public class ProductService : GenericService<Product> , IProductService
    {
        public ProductService(FlipkartAPIDBContext context) : base(context)
        {
                
        }

        public async Task<IEnumerable<Vproduct>> GetAllAsync(ProductResoruceParameters productResoruceParameters)
        {
            if(productResoruceParameters == null)
            {
                throw new ArgumentNullException(nameof(productResoruceParameters));
            }


            var products = await _context.Vproducts.ToListAsync();


            if (productResoruceParameters.IsActive)
            {
                products = products.Where(p => p.IsActive == true).ToList();
            }

            if(!String.IsNullOrWhiteSpace(productResoruceParameters.start))
            {
                var startIndex = Int32.Parse(productResoruceParameters.start.Trim());
                products = products.Where(p => p.ProductId >= startIndex).ToList();
            }


            if (!String.IsNullOrWhiteSpace(productResoruceParameters.CategoryQuery))
            {
                var category = productResoruceParameters.CategoryQuery.Trim();
                products = products.Where(p => p.CategoryTitle == category).ToList();
            }

            if (!String.IsNullOrWhiteSpace(productResoruceParameters.SubCatgoryQuery))
            {
                var subCatgory = productResoruceParameters.SubCatgoryQuery.Trim();
                products = products.Where(p => p.SubCategoryTitle == subCatgory).ToList();
            }

            if (!String.IsNullOrWhiteSpace(productResoruceParameters.brandQuery))
            {
                var brand = productResoruceParameters.brandQuery.Trim();
                products = products.Where(p => p.BrandTitle == brand).ToList();
            }

            if (!String.IsNullOrWhiteSpace(productResoruceParameters.discountQuery))
            {
                var discountPercentage = Int32.Parse(productResoruceParameters.discountQuery.Trim());
                products = products.Where(p => p.DiscountPercentage >= discountPercentage).ToList();
            }

            if (!String.IsNullOrWhiteSpace(productResoruceParameters.minPrice))
            {
                var minPrice = Int32.Parse(productResoruceParameters.minPrice.Trim());
                products = products.Where(p => p.Price >= minPrice).ToList();
            }

            if (!String.IsNullOrWhiteSpace(productResoruceParameters.maxPrice))
            {
                var maxPrice = Int32.Parse(productResoruceParameters.maxPrice.Trim());
                products = products.Where(p => p.Price <= maxPrice).ToList();
            }

            if (!String.IsNullOrWhiteSpace(productResoruceParameters.count))
            {
                var count = Int32.Parse(productResoruceParameters.count.Trim());
                products = products.Take(count).ToList();
            }


            return products;
        }
        public async Task<IEnumerable<Inventory>> GetProductInventories(int id)
        { 

            var inventories = await _context.Inventories.Where(i => i.ProductId == id).ToListAsync();

            return inventories;
        }

        public async Task<Inventory> GetProductInventoriesById(int id)
        {
            var inventory = await _context.Inventories.FindAsync(id);
            return inventory;
        }

        public async Task<IEnumerable<ProductImage>> GetProductProductProductImages(int id)
        {
            var productImages = await _context.ProductImages.Where(pi => pi.ProductId == id).ToListAsync();
            return productImages;
        }

        public async Task<ProductImage> GetProductProductProductImagesById(int id)
        {
            var productImage = await _context.ProductImages.FindAsync(id);
            return productImage;
        }
    }
}
