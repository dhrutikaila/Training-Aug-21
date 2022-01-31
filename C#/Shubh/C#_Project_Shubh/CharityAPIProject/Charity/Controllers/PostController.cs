using CharityAPI.IServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Models;
using CharityAPI.Authentication;
using Newtonsoft.Json;
using System.Drawing;
using CharityAPI.Services;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : BaseAdminController
    {
        private readonly IPost _post;
        public PostController(IPost context)
        {
            _post = context;
        }

        // GET: post
        [HttpGet]
        public ActionResult<IEnumerable<Post>> GetAllPost()
        {
            return Ok(_post.GetAll());
        }

        //GET: post/3
        [HttpGet("{id}")]
        public ActionResult<Post> GetPost(long id)
        {
            var post = _post.GetById(id);

            if(post == null)
            {
                return NotFound();
            }
            return Ok(post);
        }

        // PUT: post/id
        [HttpPut("{id}")]
        public IActionResult EditPost(long id)
        {
            var post = new Post();
            var httpRequest = HttpContext.Request;
            post = JsonConvert.DeserializeObject<Post>(httpRequest.Form["post"]);
            Image img = null;
            string fileName = "";

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
            }
            post.ImageUrl = fileName;
            post.UpdatedBy = UserId;
            post.UpdatedAt = DateTime.Now;
            
            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid model");
            }
            var postObject = _post.GetById(id);

            if(postObject == null)
            {
                return NotFound();
            }

            if(_post.Update(id, post,img))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data uploaded successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // POST: post
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<Post> AddPost()
        {

            var post = new Post();
            var httpRequest = HttpContext.Request;
            post = JsonConvert.DeserializeObject<Post>(httpRequest.Form["post"]);
            Image img = null;
            string fileName = "";

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
            }
            post.CreatedBy = UserId ;
            post.CreatedAt = DateTime.Now;
            post.CloseAt = DateTime.Now;
            post.UpdatedBy = UserId;
            post.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }
            bool created = _post.Create(post, img, fileName);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Post created successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: post/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeletePost(long id)
        {
            var postObject = _post.GetById(id);
            if (postObject != null)
            {
                bool deleted = _post.Delete(id);
                if (deleted)
                {
                    if (postObject.ImageUrl != null && !string.IsNullOrEmpty(postObject.ImageUrl))
                    {
                        var commonHelper = new CommonHelper();
                        var attaachmentPath = commonHelper.GetPostPath(postObject.UserId, postObject.PostId);
                        commonHelper.DeleteAllfile(attaachmentPath);
                        return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                    }
                }
                return BadRequest();
            }
            return NotFound();
        }

        //GET: post/City/id
        [HttpGet("City/{id}")]
        public ActionResult<IEnumerable<Post>> GetPostByCity(long id)
        {
            var post = _post.GetPostByCity(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: post/State/id
        [HttpGet("State/{id}")]
        public ActionResult<IEnumerable<Post>> GetPostByState(long id)
        {
            var post = _post.GetPostByState(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: post/PincodeId/id
        [HttpGet("PincodeId/{id}")]
        public ActionResult<IEnumerable<Post>> GetPostByPincodeId(long id)
        {
            var post = _post.GetPostByPincodeId(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: post/Pincode/PincodeNo.
        [HttpGet("Pincode/{id}")]
        public ActionResult<IEnumerable<Post>> GetPostByPincode(long id)
        {
            var post = _post.GetPostByPincode(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        // GET: post/Location/name
        [HttpGet("Location/{name}")]
        public ActionResult<IEnumerable<Post>> GetPostByLocation(string name)
        {
            var post = _post.GetPostByLocation(name);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        // GET: post/user/name
        [HttpGet("user/{name}")]
        public ActionResult<IEnumerable<Post>> GetPostByUserName(string name)
        {
            var post = _post.GetPostByUserName(name);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: post/userid/id
        [HttpGet("userid/{id}")]
        public ActionResult<IEnumerable<Post>> GetPostByUserId(long id)
        {
            var post = _post.GetPostByUserId(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }

        //GET: post/Requirement/id
        [HttpGet("Requirement/{id}")]
        public ActionResult<IEnumerable<Post>> GetPostByRequirement(long id)
        {
            var post = _post.GetPostByRequirement(id);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }


        //GET: post/Timerange/date
        [HttpGet("Timerange/{date}")]
        public ActionResult<IEnumerable<Post>> GetPostByDate(DateTime date)
        {
            var post = _post.GetPostByDate(date);

            if (post == null)
            {
                return NoContent();
            }

            return Ok(post);
        }
    }
}
