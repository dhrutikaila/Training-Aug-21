using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;
using ZomatoApp.DBContext;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserSignupsController : ControllerBase
    {
        
        
        private readonly IUserSignup UserSignup;
        public UserSignupsController(IUserSignup user)
        {
            UserSignup = user;
            
        }

        //Get All Method
        [HttpGet]
        public IEnumerable<UserSignup> AddUserMethod()
        {
            return UserSignup.GetAll();
        }

        //Create User
        [HttpPost]
        public string creates([FromBody] UserSignup addUser)
        {

            UserSignup checkuser = UserSignup.FirstOrDefault(s => s.Phoneno == addUser.Phoneno);
            if (checkuser != null)
                //new Exception("Create already exists...");
                return "User already exists...";
            else
            {
                UserSignup.Create(addUser);
                UserSignup addedUser = UserSignup.GetAll().Last();
                return $"UserSingup {addedUser.Names} is added successfully and your id is {addedUser.UserId}";
            }
        }

        //Get By Id
        [HttpGet("{id}")]
        public ActionResult<UserSignup> GetUserSignups(int id)
        {
            var userSignup = UserSignup.GetById(id);

            if (userSignup == null)
            {
                return NotFound();
            }
            return userSignup;
        }

        //Delete User
        [HttpDelete("{id}")]
        public IActionResult DeleteUserSignup(int id)
        {
            var userSignup = UserSignup.GetById(id);
            if (userSignup == null)
            {
                return NotFound();
            }

            UserSignup.Delete(userSignup);

            return NoContent();
        }

        //Update
        [HttpPut("{id}")]
        public ActionResult<UserSignup> PutUserSignup(int id, UserSignup userSignup)
        {
            try
            {
                UserSignup.Update(userSignup);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return GetUserSignups(id);

        }
    }
}
