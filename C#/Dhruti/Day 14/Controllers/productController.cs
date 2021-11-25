


using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ToyShopAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IToyRepository _Toy;
        public ProductController(IToyRepository toyRepository)
        {
            _Toy = toyRepository;
        }

        [HttpGet]
        public IActionResult GetProducts()
        {
            return Ok(_Toy.GetToys());
        }
        [HttpGet("Search")]
        public IActionResult SearchProducts(string ProductName)
        {
            var Toys = _Toy.SearchToy(ProductName);
            if (Toys == null)
            {
                return NotFound("Sorry This Type Of Toy is Not Available");
            }
            return Ok(Toys);
        }
    }
}