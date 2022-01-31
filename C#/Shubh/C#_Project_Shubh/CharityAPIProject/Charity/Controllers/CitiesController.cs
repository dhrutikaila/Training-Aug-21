using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitiesController : BaseAdminController
    {
        private readonly ICities _cities;
        public CitiesController(ICities cities)
        {
            _cities = cities;
        }

        // POST: api/cities
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<Cities> AddCities(Cities cities)
        {
            cities.UpdatedBy = UserId;
            cities.CreatedBy = UserId;
            cities.CreatedAt = DateTime.Now;
            cities.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _cities.Create(cities);
            if (created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });


            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }
        // GET: api/cities
        [HttpGet]
        public ActionResult<IEnumerable<Cities>> GetAll()
        {
            return Ok(_cities.GetAll());
        }

        //get city by city id
        // GET: api/cities/1
        [HttpGet("{id}")]
        public ActionResult<Cities> GetCityById(long id)
        {
            var city = _cities.GetById(id);

            if (city == null)
            {
                return NotFound();
            }

            return Ok(city);
        }

        //get api by state id
        //GET: api/cities/state/2
        [HttpGet("states/{sid}")]
        public ActionResult<Cities> GetCityByStateId(long sid)
        {
            var city = _cities.GetById(sid);

            if (city == null)
            {
                return NotFound();
            }

            return Ok(city);
        }

        
        //GET: api/cities/city/cname
        [HttpGet("city/{cname}")]
        public ActionResult<IEnumerable> GetCityByCityName(string cname)
        {
            var city = _cities.GetCityByCityName(cname);

            if (city == null)
            {
                return NotFound();
            }

            return Ok(city);
        }


        // PUT: api/cities/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditCity(int id, Cities cities)
        {
            cities.UpdatedBy = UserId;
            cities.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var cityobj = _cities.GetById(id);
            if (cityobj == null)
            {
                return NotFound();

            }
            if (_cities.Update(id, cities))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }

        //delete city
        // DELETE: api/requirementType/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteCity(int id)
        {
            var cityobj = _cities.GetById(id);
            if (cityobj != null)
            {
                bool deleted = _cities.Delete(id);
                if (deleted)
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                return BadRequest();
            }
            return NotFound();
        }
    }
}
