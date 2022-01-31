using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VolunteerController : BaseAdminController
    {
        private readonly IVolunteer _volunteer;

        public VolunteerController(IVolunteer volunteer)
        {
            _volunteer = volunteer;
        }

        //GET: api/volunteer
        [HttpGet]
        public ActionResult<IEnumerable<Volunteer>> GetVolunteers()
        {
            return Ok(_volunteer.GetAll());
        }

        //GET: api/volunteer/1
        [HttpGet("{id}")]
        public ActionResult<Volunteer> GetVolunteer(long id)
        {
            var volunteer = _volunteer.GetById(id);

            if (volunteer == null)
            {
                return NotFound();
            }

            return Ok(volunteer);
        }

        // PUT: api/volunteer/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditVolunteer(long id, Volunteer volunteer)
        {
            volunteer.UpdatedBy = UserId;
            volunteer.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid Model");
            }
            var volunteerObject = _volunteer.GetById(id);

            if (volunteerObject == null)
            {
                return NotFound();
            }
            if (_volunteer.Update(id, volunteer))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // POST: api/volunteer
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<Volunteer> AddVolunteer(Volunteer volunteer)
        {

            volunteer.CreatedBy = UserId;
            volunteer.CreatedAt = DateTime.Now;
            volunteer.UpdatedBy = UserId;
            volunteer.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }
            bool created = _volunteer.Create(volunteer);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/volunteer/1
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteVolunteer(long id)
        {
            var volunteerObject = _volunteer.GetById(id);
            if (volunteerObject != null)
            {
                bool deleted = _volunteer.Delete(id);
                if (deleted)
                {
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                }
                return BadRequest();
            }
            return NotFound();
        }

        //GET: api/volunteer/userid/1
        [HttpGet("userid/{id}")]
        public ActionResult<IEnumerable<Volunteer>> GetVolunteerByUserId(long id)
        {
            var volunteer = _volunteer.GetByUserId(id);

            if (volunteer == null)
            {
                return NoContent();
            }

            return Ok(volunteer);
        }

        //GET: api/volunteer/organisationid/1
        [HttpGet("organisationid/{id}")]
        public ActionResult<IEnumerable<Volunteer>> GetVolunteerByOrganisationId(long id)
        {
            var volunteer = _volunteer.GetByOrganisationId(id);

            if (volunteer == null)
            {
                return NoContent();
            }

            return Ok(volunteer);
        }

        //GET: api/volunteer/organisation/RHA
        [HttpGet("organisation/{name}")]
        public ActionResult<IEnumerable<Volunteer>> GetVolunteerByOrganisationName(string name)
        {
            var volunteer = _volunteer.GetByOrganisationName(name);

            if (volunteer == null)
            {
                return NoContent();
            }

            return Ok(volunteer);
        }
    }
}
