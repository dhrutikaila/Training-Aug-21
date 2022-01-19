using APISPOTIFY.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MusicAppDB.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Controllers
{
   
        [Route("api/[controller]")]
        [ApiController]
        public class UserController : ControllerBase
        {
            private readonly IUser users;

            public UserController(IUser context)
            {
                users = context;
            }

            // GET: api/MUSICUSERS/Users
            [HttpGet]
            public ActionResult<IEnumerable<User>> GetUsers()
            {
                return Ok(users.GetAllUsers());
            }
        }
    
}
