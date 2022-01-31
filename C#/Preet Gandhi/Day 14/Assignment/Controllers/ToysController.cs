using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_14_Assignment.ToyData;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Day_14_Assignment.Controllers
{
    [ApiController]
    public class ToysController : ControllerBase
    {
        private readonly IToyData _toyData;
        public ToysController(IToyData toyData)
        {
            _toyData = toyData;
        }

        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetToys()
        {
            return Ok(_toyData.GetToys());
        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetToy(int id)
        {
            var toy = _toyData.GetToy(id);

            if (toy != null)
            {
                return Ok(toy);
            }
            return NotFound($"Toy with id: {id} was not found.");
        }
    }
}
