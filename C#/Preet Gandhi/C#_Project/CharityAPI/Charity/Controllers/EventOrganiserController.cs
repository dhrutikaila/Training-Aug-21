using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventOrganiserController : BaseAdminController
    {
        private readonly IEventOrganiser _charityEventOrg;
        public EventOrganiserController(IEventOrganiser charityEventOrg)
        {
            _charityEventOrg = charityEventOrg;
        }
        // GET: api/charityEvent
        [HttpGet]
        public ActionResult<IEnumerable<CharityEventOrganiser>> GetCharityEventOrganisers()
        {
            return Ok(_charityEventOrg.GetAll());
        }
        // GET: api/CharityEvent/2
        [HttpGet("{id}")]
        public ActionResult<CharityEventOrganiser> GetCharityEventOrganiser(long id)
        {
            var charityEventOrg = _charityEventOrg.GetById(id);

            if (charityEventOrg == null)
            {
                return NoContent();
            }

            return Ok(charityEventOrg);
        }

        // GET: api/CharityEvent/event/2
        [HttpGet("event/{eventId}")]
        public ActionResult<CharityEventOrganiser> GetCharityEventOrganiserByEvent(long eventId)
        {
            var charityEventOrg = _charityEventOrg.GetByEventId(eventId);

            if (charityEventOrg == null)
            {
                return NoContent();
            }

            return Ok(charityEventOrg);
        }

        // GET: api/CharityEvent/organiser/2
        [HttpGet("organiser/{orgId}")]
        public ActionResult<CharityEventOrganiser> GetCharityEventOrganserByOrg(long orgId)
        {
            var charityEventOrg = _charityEventOrg.GetByOrganiserId(orgId);

            if (charityEventOrg == null)
            {
                return NoContent();
            }

            return Ok(charityEventOrg);
        }

        // PUT: api/CharityEvent/5
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditCharityEvent(long id, CharityEventOrganiser charityEventOrg)
        {
            charityEventOrg.UpdatedBy = UserId;
            charityEventOrg.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var charityEventObject = _charityEventOrg.GetById(id);
            if (charityEventObject == null)
            {
                return NotFound();

            }
            if (_charityEventOrg.Update(id, charityEventOrg))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }
        // POST: api/CharityEventOrganiser
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<CharityEventOrganiser> AddCharityEvent(CharityEventOrganiser charityEventOrg)
        {
            charityEventOrg.UpdatedBy = UserId;
            charityEventOrg.CreatedBy = UserId;
            charityEventOrg.CreatedAt = DateTime.Now;
            charityEventOrg.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _charityEventOrg.Create(charityEventOrg);
            if (created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });


            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/CharityEventOrganiser/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteCharityEvent(int id)
        {
            var charityEventObject = _charityEventOrg.GetById(id);
            if (charityEventObject != null)
            {
                bool deleted = _charityEventOrg.Delete(id);
                if (deleted)
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                return BadRequest();
            }
            return NotFound();
        }
    }
}
