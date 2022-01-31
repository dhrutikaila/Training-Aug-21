using Microsoft.AspNetCore.Mvc;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using ZomatoApp.DBContext;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        
        private readonly IProduct Product;
        public ProductController(IProduct product)
        {
            Product = product;
            
        }

        //Get all products
        [HttpGet]
        public IEnumerable<Product> AddNewDataMethod()
        {
            return Product.GetAll();
        }


        //Add product
        [HttpPost]
        public string creates([FromBody] Product obEntity)
        {

            Product check = Product.FirstOrDefault(s => s.ProductName == obEntity.ProductName);
            if (check != null)
                //new Exception("Create already exists...");
                return "Product already exists...";
            else
            {
                Product.Create(obEntity);
                Product ObjEntity = Product.GetAll().Last();
                return $"Product {ObjEntity.ProductName} is added successfully and your id is {ObjEntity.ProductId}";
            }
        }

        //Get product by id
        [HttpGet("{id}")]
        public ActionResult<Product> GetProducts(int id)
        {
            var product = Product.GetById(id);

            if (product == null)
            {
                return NotFound();
            }
            return product;
        }

        //delete product
        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            var products = Product.GetById(id);
            if (products == null)
            {
                return NotFound();
            }

            Product.Delete(products);

            return NoContent();
        }

        //Put
        [HttpPut("{id}")]
        public ActionResult<Product> PutProduct(int id, Product product)
        {
            try
            {
                Product.Update(product);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return GetProducts(id);

        }
    }
}
