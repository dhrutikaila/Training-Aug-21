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
    public class DiscountController : ControllerBase
    {
        private IDiscount _discount;
        public DiscountController(IDiscount discount)
        {
            _discount = discount;
        }
        //get all data
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetDiscounts()
        {
            return Ok(_discount.GetAll());
        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetById(int id)
        {
            var discount = _discount.GetById(id);
            if (discount != null)
            {
                return Ok(discount);
            }
            return NotFound($"Discount with this id {id} was not found");
        }

        //insert data 
        [HttpPost]
        [Route("api/[controller]")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult GetById(Discount discount)
        {
            _discount.Create(discount);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + discount.DiscountId
                , discount);
        }

        //delete data 
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteDiscount(int id)
        {
            var discout = _discount.GetById(id);
            if (discout != null)
            {
                _discount.Delete(discout);
                return Ok();
            }
            return NotFound($"Discount with this id {id} was not found");
        }

        //update the data 
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditDiscount(int id, Discount discount)
        {
            var ExistingDiscount = _discount.GetById(id);
            if (ExistingDiscount != null)
            {
                discount.DiscountId = ExistingDiscount.DiscountId;
                _discount.Update(id, discount);
                return Ok();
            }
            return Ok(discount);
        }
    }
}
