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
    public class SubCategoryController : ControllerBase
    {
        private ISubCategory _subCategory;
        public SubCategoryController(ISubCategory subCategory)
        {
            _subCategory = subCategory;
        } 
        //get subcategory category id vise
        [HttpGet]
        [Route("Category/{id}/SubCategory/{Subcategoryid}")]
        public IActionResult GetSubCategory(int id, int Subcategoryid)
        {
            var subcategory = _subCategory.GetSubCategory(id, Subcategoryid);
            if (subcategory == null)
            {
                return NotFound($"Subcategory with this {Subcategoryid} is not found");
            }
            return Ok(subcategory);
        }
        [HttpGet]
        [Route("Category/{id}/SubCategory")]
        public IActionResult GetSubCategoryById(int id)
        {
            var SubCategory = _subCategory.GetSubcategorys(id);
            if (SubCategory == null)
            {
                return NotFound($"SubCategory with this id {id} was not found");
            }
            return Ok(SubCategory);
        }

        //insert data 
        [HttpPost]
        [Authorize(Roles = UserRoles.Admin)]
        [Route("Category/{catid}/SubCategory")]
        
        public IActionResult GetById(int catid,SubCategory subCategory)
        {
            subCategory.CategoryId = catid;
            _subCategory.AddSubCategory(catid,subCategory);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + subCategory.CategoryId
                , subCategory);
        }

        //delete data 
        [HttpDelete]
        [Route("SubCategory/{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteSubCategory(int id)
        {
            var SubCategory = _subCategory.GetById(id);
            if (SubCategory != null)
            {
                _subCategory.Delete(SubCategory);
                return Ok();
            }
            return NotFound($"SubCategory with this id {id} was not found");
        }

        //update the data 
        [HttpPatch]
        [Route("Category/{catid}/SubCategory/{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult UpdateSubcategory(int catid, int id, SubCategory subCategory)
        {
            subCategory.SubCategoryId = id;
            subCategory.CategoryId = catid;
            var ExistingSubcategory = _subCategory.UpdateSubcategory(catid, id, subCategory);
            if (ExistingSubcategory == null)
            {
                return NotFound($"Subcategory with this id {id} was not found");
            }
            return Ok(subCategory);
        }
    }
}
