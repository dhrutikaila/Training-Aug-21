using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Controllers
{
    
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUser _user;
        public UserController(IUser user)
        {
            _user = user;
        }
        //get all data 
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetUsers()
        {
            return Ok(_user.GetAllUsers());
        }
    }
}
