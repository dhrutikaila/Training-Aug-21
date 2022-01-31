using APIProject.Authentication;
using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Controllers
{
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IProduct _product;
        public ProductController(IProduct product)
        {
            _product = product;
        }
        //get all product (subcategory vise)
        [HttpGet]
        [Route("Category/SubCategory/{id}/Product")]

        public IActionResult GetProducts(int id)
        {
            var product = _product.GetProducts(id);
            if (product == null)
            {
                return NotFound($"Product with this {id} is not found");
            }
            return Ok(product);
        }

        //Get all Products
        [HttpGet]
        [Route("Category/SubCategory/Product")]
        public IActionResult GetProducts()
        {
            return Ok(_product.GetAll());
        }

        //insert data subcategory vise 
        [HttpPost]
        [Route("Category/SubCategory/{id}/Product")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult GetById(int id ,Product product)
        {
            product.SubCategoryid = id;
            _product.AddProduct(id , product);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + product.SubCategoryid
                , product);
        }

        //delete data 
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteProduct(int id)
        {
            var product = _product.GetById(id);
            if (product != null)
            {
                _product.Delete(product);
                return Ok("Product Deleted SuccessFully");
            }
            return NotFound($"Product with this id {id} was not found");
        }

        //update the data 
        [HttpPatch]
        [Route("Category/SubCategory/{id}/Product/{pid}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditProduct(int id,int pid, Product product)
        {
            product.ProductId = id;
            product.ProductId = pid;
            var ExistingProduct = _product.UpdateProduct(id, pid, product);
            if (ExistingProduct == null)
            {
                return NotFound($"Product with this id {pid} was not found");
            }
            return Ok(product);
        }
    }
}
