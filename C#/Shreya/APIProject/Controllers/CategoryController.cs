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
    //[Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private ICategory _category;
        public CategoryController(ICategory category)
        {
            _category = category;
        }
        
        //get all data
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetCategory()
        {
            return Ok(_category.GetAll());
        }

        //get data by id
        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetCategoryById(int id)
        {
            var category = _category.GetById(id);
            if (category != null)
            {
                return Ok(category);
            }
            return NotFound($"Category with this id {id} was not found");
        } 

        //insert data 
        [HttpPost]
        [Route("api/[controller]")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult GetById(Category category)
        {
            _category.Create(category);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + category.CategoryId
                , category);
        }

        //delete data 
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteCategory(int id)
        {
            var category = _category.GetById(id);
            if (category != null)
            {
                _category.Delete(category);
                return Ok("Category Deleted SuccessFully");
            }
            return NotFound($"Category with this id {id} was not found");
        }

        //update the data 
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditProduct(int id, Category category)
        {
                _category.Update(id, category);
                return Ok(category);
        }          
   }
}

