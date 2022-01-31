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
    public class SpamController : BaseAdminController
    {
        private readonly ISpam _spam;
        public SpamController(ISpam spam)
        {
            _spam = spam;
        }

        // POST: api/urgency
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<Spam> AddSpam(Spam spam)
        {
            spam.UpdatedBy = UserId;
            spam.CreatedBy = UserId;
            spam.CreatedAt = DateTime.Now;
            spam.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _spam.Create(spam);
            if (created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });


            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // GET: api/spam
        [HttpGet]
        public ActionResult<IEnumerable<Spam>> GetAll()
        {
            return Ok(_spam.GetAll());
        }

        //get spam by spam id
        // GET: api/spam/2
        [HttpGet("{id}")]
        public ActionResult<Spam> GetSpamById(int id)
        {
            var spam = _spam.GetById(id);

            if (spam == null)
            {
                return NotFound();
            }

            return Ok(spam);
        }

        //get spam by post id
        // GET: api/spam/post/2
        [HttpGet("post/{id}")]
        public ActionResult<Spam> GetSpamByPostId(long id)
        {
            var spam = _spam.GetSpamByPostId(id);

            if (spam == null)
            {
                return NotFound();
            }

            return Ok(spam);
        }   
        
        
        //get spam by user id
        // GET: api/spam/user/2
        [HttpGet("user/{id}")]
        public ActionResult<Spam> GetSpamByUserId(long id)
        {
            var spam = _spam.GetSpamByUserId(id);

            if (spam == null)
            {
                return NotFound();
            }

            return Ok(spam);
        }

        // PUT: api/spam/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditSpam(int id, Spam spam)
        {
            
            spam.UpdatedBy = UserId;
            spam.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var spamobj = _spam.GetById(id);
            if (spamobj == null)
            {
                return NotFound();

            }
            if (_spam.Update(id, spam))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }

        // DELETE: api/pincode/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeletePincode(int id)
        {
            var pinobj = _spam.GetById(id);
            if (pinobj != null)
            {
                bool deleted = _spam.Delete(id);
                if (deleted)
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                return BadRequest();
            }
            return NotFound();
        }
    }
}
