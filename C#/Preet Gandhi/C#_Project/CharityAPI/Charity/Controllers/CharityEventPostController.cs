using CharityAPI.IServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using CharityAPI.Models;
using CharityAPI.Authentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Drawing;
using CharityAPI.Services;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CharityEventPostController : BaseAdminController
    {
        private readonly ICharityEventPost _cepost;
        public CharityEventPostController(ICharityEventPost context)
        {
            _cepost = context;
        }

        // GET: CharityEventPost
        [HttpGet]
        public ActionResult<IEnumerable<CharityEventPost>> GetAllPost()
        {
            return Ok(_cepost.GetAll());
        }

        //GET: CharityEventPost/3
        [HttpGet("{id}")]
        public ActionResult<CharityEventPost> GetPost(long id)
        {
            var post = _cepost.GetById(id);

            if (post == null)
            {
                return NotFound();
            }
            return Ok(post);
        }

        // PUT: CharityEventPost/id
        [HttpPut("{id}")]
        public IActionResult EditPost(long id)
        {
            var post = new CharityEventPost();
            var httpRequest = HttpContext.Request;
            post = JsonConvert.DeserializeObject<CharityEventPost>(httpRequest.Form["post"]);
            Image img = null;
            string fileName = "";
            post.UpdatedBy = UserId;
            post.UpdatedAt = DateTime.Now;
            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                post.PostUrl = HttpContext.Request.Form.Files[0].FileName;
            }

            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid model");
            }
            var postObject = _cepost.GetById(id);

            if (postObject == null)
            {
                return NotFound();
            }

            if (_cepost.Update(id, post,img))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data uploaded successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // POST: CharityEventPost
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<CharityEventPost> AddPost()
        {
            var post = new CharityEventPost();
            var httpRequest = HttpContext.Request;
            post = JsonConvert.DeserializeObject<CharityEventPost>(httpRequest.Form["post"]);
            Image img = null;
            string fileName = "";
            post.UpdatedBy = UserId;
            post.UpdatedAt = DateTime.Now;
            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
                post.PostUrl = fileName;
            }
            post.CreatedBy = UserId;
            post.CreatedAt = DateTime.Now;
            post.UpdatedBy = UserId;
            post.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }
            bool created = _cepost.Create(post, img, fileName);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Post created successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: CharityEventPost/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin, UserRoles.Organisation)]
        public IActionResult DeletePost(long id)
        {
            var postObject = _cepost.GetById(id);
            if (postObject != null)
            {
                bool deleted = _cepost.Delete(id);
                if (deleted)
                {
                    if (postObject.PostUrl != null && !string.IsNullOrEmpty(postObject.PostUrl))
                    {
                        var commonHelper = new CommonHelper();
                        var attaachmentPath = commonHelper.GetEventPostPath(id);
                        commonHelper.DeleteAllfile(attaachmentPath);
                        return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                    }
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Post deleted successfully!" });
                }
                return BadRequest();
            }
            return NotFound();
        }

        // GET: CharityEventPost/user/name
        [HttpGet("user/{name}")]
        public ActionResult<IEnumerable<CharityEventPost>> GetChEvPostByUserName(string name)
        {
            var post = _cepost.GetChEvPostByUserName(name);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: CharityEventPost/userid/id
        [HttpGet("userid/{id}")]
        public ActionResult<IEnumerable<Post>> GetChEvPostByUserId(long id)
        {
            var post = _cepost.GetChEvPostByUserId(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: CharityEventPost/Timerange
        [HttpGet("Timerange/{date}")]
        public ActionResult<IEnumerable<CharityEventPost>> GetPostByDate(DateTime date)
        {
            var post = _cepost.GetChEvPostByDate(date);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }
    }
}
