using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClusterLocationController : BaseAdminController
    {
        private readonly IClusterLocation _clusterLocation;

        public ClusterLocationController(IClusterLocation clusterLocation)
        {
            _clusterLocation = clusterLocation;
        }


        //GET: api/clusterLocation
        [HttpGet]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocations()
        {
            return Ok(_clusterLocation.GetAll());
        }

        //GET: api/clusterLocation/1
        [HttpGet("{id}")]
        public ActionResult<ClusterLocations> GetClusterLocation(long id)
        {
            var clusterLocation = _clusterLocation.GetById(id);

            if(clusterLocation == null)
            {
                return NotFound();
            }

            return Ok(clusterLocation);
        }

        // PUT: api/clusterLocation/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditClusterLocation(long id, ClusterLocations clusterLocations)
        {
            clusterLocations.UpdatedBy = UserId;
            clusterLocations.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid Model");
            }
            var clusterLocationObject = _clusterLocation.GetById(id);

            if(clusterLocationObject == null)
            {
                return NotFound();
            }
            if(_clusterLocation.Update(id, clusterLocations))
            {
                return StatusCode(StatusCodes.Status200OK, new Response {  Status = "Updated", Message = "Data updated successfully!" });
                }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // POST: api/clusterLocation
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<ClusterLocations> AddClusterLocation(ClusterLocations clusterLocations)
        {
            
            clusterLocations.CreatedBy = UserId;
            clusterLocations.CreatedAt = DateTime.Now;
            clusterLocations.UpdatedBy = UserId;
            clusterLocations.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }   
            bool created = _clusterLocation.Create(clusterLocations);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/clusterLocation/1
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteClusterLocation(long id)
        {
            var clusterLocationObject = _clusterLocation.GetById(id);
            if (clusterLocationObject != null)
            {
                bool deleted = _clusterLocation.Delete(id);
                if (deleted)
                {
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                }
                return BadRequest();
            }
            return NotFound();
        }

        //GET: api/clusterLocation/pincodeid/1
        [HttpGet("pincodeid/{id}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByPincodeId(long id)
        {
            var clusterLocation = _clusterLocation.GetByPincodeId(id);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }

        //GET: api/clusterLocation/pincode/380001
        [HttpGet("pincode/{pincode}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByPincode(long pincode)
        {
            var clusterLocation = _clusterLocation.GetByPincode(pincode);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }

        //GET: api/clusterLocation/cityid/1
        [HttpGet("cityid/{id}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByCityId(long id)
        {
            var clusterLocation = _clusterLocation.GetByCityId(id);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }

        //GET: api/clusterLocation/city/Ahmedabad
        [HttpGet("city/{name}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByCityId(string name)
        {
            var clusterLocation = _clusterLocation.GetByCityName(name);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }

        //GET: api/clusterLocation/stateid/1
        [HttpGet("stateid/{id}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByStateId(long id)
        {
            var clusterLocation = _clusterLocation.GetByStateId(id);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }

        //GET: api/clusterLocation/location/Bapunagar
        [HttpGet("location/{name}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByLocationName(string name)
        {
            var clusterLocation = _clusterLocation.GetByLocationName(name);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }

        //GET: api/clusterLocation/requirementid/1
        [HttpGet("requirementid/{id}")]
        public ActionResult<IEnumerable<ClusterLocations>> GetClusterLocationByRequirementId(long id)
        {
            var clusterLocation = _clusterLocation.GetByRequirementId(id);

            if (clusterLocation == null)
            {
                return NoContent();
            }

            return Ok(clusterLocation);
        }
    }
}
