using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using CharityAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserDataController : BaseAdminController
    {
        private readonly IUserData _userData;

        public UserDataController(IUserData userData)
        {
            _userData = userData;
        }

        //GET: api/userData
        [HttpGet]
        public ActionResult<IEnumerable<UserData>> GetUserDatas()
        {
            return Ok(_userData.GetAll());
        }

        //GET: api/userData/1
        [HttpGet("{id}")]
        public ActionResult<UserData> GetUserData(long id)
        {
            var userData = _userData.GetById(id);

            if (userData == null)
            {
                return NotFound();
            }

            return Ok(userData);
        }

        // PUT: api/userData/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditUserData(long id)
        {
            var userData = new UserData();
            var httpRequest = HttpContext.Request;
            userData = JsonConvert.DeserializeObject<UserData>(httpRequest.Form["userData"]);
            Image img = null;

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                userData.ProfileImage = HttpContext.Request.Form.Files[0].FileName;
                 
            }
            
            userData.UpdatedBy = UserId;
            userData.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid Model");
            }
            var userDataObject = _userData.GetById(id);

            if (userDataObject == null)
            {
                return NotFound();
            }
            if (_userData.Update(id, userData,img))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // POST: api/userData
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<UserData> AddUserData()
        {
            var userData = new UserData();
            var httpRequest = HttpContext.Request;
            userData = JsonConvert.DeserializeObject<UserData>(httpRequest.Form["userData"]);
            Image img = null;
            string fileName = "";

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
            }
            userData.ProfileImage = fileName;
            userData.CreatedBy = UserId;
            userData.CreatedAt = DateTime.Now;
            userData.UpdatedBy = UserId;
            userData.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }
            bool created = _userData.Create(userData,img,fileName);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/userData/1
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteUserData(long id)
        {
            var userDataObject = _userData.GetById(id);
            if (userDataObject != null)
            {
                bool deleted = _userData.Delete(id);
                if (deleted)
                {
                    if (userDataObject.ProfileImage != null && !string.IsNullOrEmpty(userDataObject.ProfileImage))
                    {
                        var commonHelper = new CommonHelper();
                        var attaachmentPath = commonHelper.GetUserPath(id);
                        commonHelper.DeleteAllfile(attaachmentPath);
                        return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                    }
                }
                return BadRequest();
            }
            return NotFound();
        }

        //GET: api/clusterLocation/cityid/1
        [HttpGet("cityid/{id}")]
        public ActionResult<IEnumerable<UserData>> GetUserDataByCityId(long id)
        {
            var userData = _userData.GetByCityId(id);

            if (userData == null)
            {
                return NoContent();
            }

            return Ok(userData);
        }

        //GET: api/clusterLocation/city/Ahmedabad
        [HttpGet("city/{name}")]
        public ActionResult<IEnumerable<UserData>> GetUserDataByCityName(string name)
        {
            var userData = _userData.GetByCityName(name);

            if (userData == null)
            {
                return NoContent();
            }

            return Ok(userData);
        }

        //GET: api/clusterLocation/pincode/380001
        [HttpGet("pincode/{pincode}")]
        public ActionResult<IEnumerable<UserData>> GetUserDataByPincode(long pincode)
        {
            var userData = _userData.GetByPincode(pincode);

            if (userData == null)
            {
                return NoContent();
            }

            return Ok(userData);
        }

        //GET: api/clusterLocation/stateid/1
        [HttpGet("stateid/{id}")]
        public ActionResult<IEnumerable<UserData>> GetUserDataByStateId(long id)
        {
            var userData = _userData.GetByStateId(id);

            if (userData == null)
            {
                return NoContent();
            }

            return Ok(userData);
        }

        //GET: api/clusterLocation/usermane/preet
        [HttpGet("username/{name}")]
        public ActionResult<UserData> GetUserDataByUserName(string name)
        {
            var userData = _userData.GetByUserName(name);

            if (userData == null)
            {
                return NotFound();
            }

            return Ok(userData);
        }

        //GET: api/clusterLocation/usersid/1
        [HttpGet("usersid/{id}")]
        public ActionResult<UserData> GetUserDataByUsersId(long id)
        {
            var userData = _userData.GetByUsersId(id);

            if (userData == null)
            {
                return NotFound();
            }

            return Ok(userData);
        }
    }
}
