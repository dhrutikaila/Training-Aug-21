using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.Models;
using Flipkart.API.ResourceParameters;
using Microsoft.AspNetCore.Mvc;

namespace Flipkart.API.Services.Interfaces
{
    public interface IProductService : IGenericService<Product>
    {
        Task<IEnumerable<Vproduct>> GetAllAsync(ProductResoruceParameters productResoruceParameters);

        Task<IEnumerable<Inventory>> GetProductInventories(int id);
        Task<IEnumerable<ProductImage>> GetProductProductProductImages(int id);
        Task<Inventory> GetProductInventoriesById(int id);
        Task<ProductImage> GetProductProductProductImagesById(int id);
    }
}
