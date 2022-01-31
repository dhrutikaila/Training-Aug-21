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
    public class CharityEventPostLikeController : BaseAdminController
    {
        private readonly ICharityEventPostLike _postlikedetails;
        public CharityEventPostLikeController(ICharityEventPostLike postlikedetails)
        {
            _postlikedetails = postlikedetails;
        }

        //post add like details
        // POST: api/pincode
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<CharityEventPostLike> AddLikeDetails(CharityEventPostLike postlikedetails)
        {

          
            postlikedetails.UpdatedBy = UserId;
            postlikedetails.CreatedBy = UserId;
            postlikedetails.CreatedAt = DateTime.Now;
            postlikedetails.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _postlikedetails.Create(postlikedetails);
            if (created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });


            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // GET: api/state
        [HttpGet]
        public ActionResult<IEnumerable<CharityEventPostLike>> GetAll()
        {
            return Ok(_postlikedetails.GetAll());
        }

        //get state by postlike id
        // GET: api/postlikeservice/2
        [HttpGet("{id}")]
        public ActionResult<CharityEventPostLike> GetPostLikeById(long id)
        {
            var like = _postlikedetails.GetById(id);

            if (like == null)
            {
                return NotFound();
            }

            return Ok(like);
        }

        //get postlike by user id
        // GET: api/postlikeservice/user/
        [HttpGet("user/{id}")]
        public ActionResult<CharityEventPostLike> GetPostLikeByUserId(long id)
        {
            var like = _postlikedetails.GetPostLikeDetailsByUserID(id);

            if (like == null)
            {
                return NotFound();
            }

            return Ok(like);
        }

        //get number of like by post id 
        [HttpGet("like/number/{id}")]
        public long GetNumberOfLikesByPostId(long id)
        {
            var like = _postlikedetails.GetNumberOfLikesByPostId(id);

            return like;
        }

        //get number of like by post id 
        [HttpGet("dislike/number/{id}")]
        public long GetNumberOfDisLikesByPostId(long id)
        {
            var like = _postlikedetails.GetNumberOfDisLikesByPostId(id);

            return like;
        }

        // PUT: api/postlike
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditPostLike(int id, CharityEventPostLike model)
        {
            model.UpdatedBy = UserId;
            model.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var likeobj = _postlikedetails.GetById(id);
            if (likeobj == null)
            {
                return NotFound();

            }
            if (_postlikedetails.Update(id, model))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }

        // DELETE: api/postlike/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeletePostLike(int id)
        {
            var likeobj = _postlikedetails.GetById(id);
            if (likeobj != null)
            {
                bool deleted = _postlikedetails.Delete(id);
                if (deleted)
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                return BadRequest();
            }
            return NotFound();
        }
    }
}
