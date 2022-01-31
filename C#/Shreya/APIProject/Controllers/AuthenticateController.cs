using APIProject.Authentication;
using APIProject.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace APIProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        private readonly IUser users;
        private readonly IAdmin admins;
        private readonly IConfiguration _configuration;
        private readonly UserManager<ApplicationUser> userManager;
        public AuthenticateController(IUser user, IAdmin admin, IConfiguration configuration, UserManager<ApplicationUser> userManager)
        {
            users = user;
            admins = admin;
            _configuration = configuration;
            this.userManager = userManager;
        }
        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] LoginModel loginModel)
        {
            var username = "";
            var pass = "";
            var role = "";
            if (users.FindName(loginModel.UserName) != null)
            {
                username = loginModel.UserName;
                pass = loginModel.Password;
                role = "User";
            }
            else if (admins.FindName(loginModel.UserName) != null)
            {
                username = loginModel.UserName;
                pass = loginModel.Password;
                role = "Admin";
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Incorrect Username or Password!" });
            }
            var newToken = await users.LoginUser(username, pass);

            if (newToken != null)
            {
                return Ok(new
                {
                    role = role,
                    username = username,
                    token = newToken
                });
            }

            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Not Exist!" });
        }
        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel registerModel)
        {
            if (users.FindName(registerModel.UserName) != null) 
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    new Response { Status = "Error", Message = "User already exists!" });
            }
            if(users.FindContact(registerModel.PhoneNumber) != null) 
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                   new Response { Status = "Error", Message = "Contact Number already exists!" });
            }
            var result = await users.RegisterUser(registerModel);
            if (!result.Succeeded)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "User creation failed!" });
            }
            else
            {
                return Ok(new Response { Status = "Success", Message = "User created successfully!" });
            }
        }
        [HttpPost]
        [Route("RegisterAdmin")]
        public async Task<IActionResult> RegisterAdmin([FromBody] RegisterModel registerModel)
        {
            if(admins.FindName(registerModel.UserName) != null) 
            {
                return StatusCode(StatusCodes.Status500InternalServerError, 
                    new Response { Status = "Error", Message = "Admin already exists!" });
            }
            if(admins.FindContact(registerModel.PhoneNumber) != null) 
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    new Response { Status = "Error", Message = "Phone Number already exists!" });
            }
            var result = await admins.RegisterAdmin(registerModel);
            if (!result.Succeeded)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Admin creation failed! Please check admin details and try again." });
            }
            admins.CreateAdmin(registerModel);

            return Ok(new Response { Status = "Success", Message = "Admin created successfully!" });

        }
    }
}
