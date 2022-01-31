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
    public class CategoryController : ControllerBase
    {
      
        private readonly ICategory Category;
        public CategoryController(ICategory category)
        {
            Category = category;
           
        }

        //GET: api/Category
        [HttpGet]
        public IEnumerable<Category> GetAllCategoryMethod()
        {
            return  Category.GetAll();
        }

        //POST: api/Category
        [HttpPost]
        public string creates([FromBody] Category addCustomer)
        {

            Category checkCategory = Category.FirstOrDefault(s => s.CategoryName == addCustomer.CategoryName && s.ResId == addCustomer.ResId);
            if (checkCategory != null)
                //new Exception("Create already exists...");
                return "Category already exists...";
            else
            {
                Category.Create(addCustomer);
                return $"Category {addCustomer.CategoryName} is added successfully and your id is {addCustomer.CategoryId}";
            }
        }

        //Get by ID
        [HttpGet("{id}")]
        public ActionResult<Category> GetCategories(int id)
        {
            var categories = Category.GetById(id);

            if (categories == null)
            {
                return NotFound();
            }
            return categories;
        }
        //Delete
        [HttpDelete("{id}")]
        public IActionResult DeleteCategory(int id)
        {
            var categories = Category.GetById(id);
            if (categories == null)
            {
                return NotFound();
            }

            Category.Delete(categories);

            return NoContent();
        }

        //PUT: api/Category/id
        [HttpPut("{id}")]
        public ActionResult<Category> PutCategory(int id, Category categories)
        {
            try
            {
                Category.Update(categories);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return GetCategories(id);
        }
    }
}
