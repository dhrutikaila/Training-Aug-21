using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using CharityAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Drawing;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CharityEventController : BaseAdminController
    {
        private readonly IEvent _charityEvent;
        public CharityEventController(IEvent charityEvent)
        {
            _charityEvent = charityEvent;
        }
        // GET: api/charityEvent
        [HttpGet]
        public ActionResult<IEnumerable<CharityEvent>> GetCharityEvent()
        {
            return Ok(_charityEvent.GetAll());
        }

        // GET: api/CharityEvent/2
        [HttpGet("{id}")]
        public ActionResult<CharityEvent> GetCharityEvent(long id)
        {
            var charityEvent = _charityEvent.GetById(id);

            if (charityEvent == null)
            {
                return NoContent();
            }

            return Ok(charityEvent);
        }
        // PUT: api/CharityEvent/5
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditCharityEvent(long id)
        {
            var charityEvent = new CharityEvent();
            var httpRequest = HttpContext.Request;
            charityEvent = JsonConvert.DeserializeObject<CharityEvent>(httpRequest.Form["charityEvent"]);
            Image img = null;
            string fileName = "";

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
            }
            charityEvent.EventBannerUrl = fileName;
            charityEvent.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var charityEventObject = _charityEvent.GetById(id);
            if (charityEventObject == null)
            {
                return NotFound();

            }
            if (_charityEvent.Update(id, charityEvent,img))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data uploaded successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
            //    return StatusCode(500, new Response { Status = "Error", Message = "Image File is missing!!!" });

            //return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }
        // POST: api/charityEvent
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<CharityEvent> AddCharityEvent()
        {
            var charityEvent = new CharityEvent();
            var httpRequest = HttpContext.Request;
            charityEvent = JsonConvert.DeserializeObject<CharityEvent>(httpRequest.Form["charityEvent"]);
            Image img = null;
            string fileName = "";

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
            }
            charityEvent.EventBannerUrl = fileName;
            charityEvent.UpdatedBy = UserId;
            charityEvent.CreatedBy = UserId;
            charityEvent.CreatedAt = DateTime.Now;
            charityEvent.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _charityEvent.Create(charityEvent, img,fileName);
            if (created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });


            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/CharityEvent/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteCharityEvent(int id)
        {
            
            var charityEventObject = _charityEvent.GetById(id);
            if (charityEventObject != null)
            {
                if (_charityEvent.Delete(id))
                {
                    if (charityEventObject.EventBannerUrl != null && !string.IsNullOrEmpty(charityEventObject.EventBannerUrl))
                    {
                        var commonHelper = new CommonHelper();
                        var attaachmentPath = commonHelper.GetEventBannerPath(charityEventObject.EventOrganiserId, charityEventObject.EventId);
                        commonHelper.DeleteAllfile(attaachmentPath);
                        return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                    }
                }
                    
                return BadRequest();
            }
            return NotFound();
        }
        // GET: api/CharityEvent/city/2
        [HttpGet("city/{id}")]
        public ActionResult<CharityEvent> GetCharityEventByCIty(long id)
        {
            var charityEvent = _charityEvent.GetById(id);

            if (charityEvent == null)
            {
                return NoContent();
            }

            return Ok(charityEvent);
        }

        // GET: api/CharityEvent/organisation/2
        [HttpGet("organisation/{id}")]
        public ActionResult<CharityEvent> GetCharityEventByOrganisation(long id)
        {
            var charityEvent = _charityEvent.GetByOrganisation(id);

            if (charityEvent == null)
            {
                return NoContent();
            }

            return Ok(charityEvent);
        }
        // GET: api/CharityEvent/pincode/2
        [HttpGet("pincode/{id}")]
        public ActionResult<CharityEvent> GetCharityEventByPincode(long id)
        {
            var charityEvent = _charityEvent.GetByPincode(id);

            if (charityEvent == null)
            {
                return NoContent();
            }

            return Ok(charityEvent);
        }
        // GET: api/CharityEvent/current
        [HttpGet("current")]
        public ActionResult<CharityEvent> GetCurrrentCharityEvent(long id)
        {
            var charityEvent = _charityEvent.GetCurrent();

            if (charityEvent == null)
            {
                return NoContent();
            }

            return Ok(charityEvent);
        }
        // GET: api/CharityEvent/date
        [HttpGet("date")]
        public ActionResult<CharityEvent> GetCharityEventByDate(DateTime Date)
        {
            var charityEvent = _charityEvent.GetByDate(Date);

            if (charityEvent == null)
            {
                return NoContent();
            }

            return Ok(charityEvent);
        }
    }
}
