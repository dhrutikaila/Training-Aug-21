using APISPOTIFY.Authentication;

using APISPOTIFY.Models;
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
using MailKit.Net.Smtp;
using MimeKit;
using APISPOTIFY.IRepository;
using MusicAppDB.IRepository;

namespace APISPOTIFY.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : Controller
    {
        private readonly IUser users;
        private readonly IAdmin admins;
       
        private readonly IConfiguration _configuration;
        private readonly UserManager<ApplicationUser> userManager;

        public AuthenticationController(IUser user, IAdmin admin,IConfiguration configuration, UserManager<ApplicationUser> userManager)
        {
            users = user;
            admins = admin;
            _configuration = configuration;
            this.userManager = userManager;
        }

        // POST: api/music/authenticate/
        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)//int otp
        {
            
           var username = "";
            var pass = "";
            var role = "";
            //var userOtp = 0;

            if (users.FindName(model.Username) != null)
            {
                username = model.Username;
                pass = model.Password;
         
                role = "User";
                //if (otp != userOtp)
                //{
                //    return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Incorrect OTP!" });
                //}


            }
            else if (admins.FindName(model.Username) != null)
            {
                username = model.Username;
                //pass = admins.FindName(model.Username).Password;
                pass = model.Password;
                role = "Admin";

                //if (otp != 1234)
                //{
                //    return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Incorrect OTP!" });
                //}
            }
           else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Success", Message = "SuccessFul Username or Password!" });
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

        // POST: api/music/authenticate/register
        [HttpPost]
        [Route("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            if (users.FindName(model.UserName) != null)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "User already exists!" });
            }



            //var result = await users.RegisterUser(model);
            //if (!result.Succeeded)
            //    return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "User creation failed! Please check user details and try again." });

            // users.CreateUser(model);
            else
            {
                return Ok(new Response { Status = "Success", Message = "User created successfully!" });
            }
        }

        // POST: api/music/authenticate/register-admin
        [HttpPost]
        [Route("register-admin")]
        public async Task<IActionResult> RegisterAdmin([FromBody] RegisterModel model)
        {
            if (admins.FindName(model.UserName) != null)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Admin already exists!" });
            }


            var result = await admins.RegisterAdmin(model);
            if (!result.Succeeded)
                return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Admin creation failed! Please check admin details and try again." });

            admins.CreateAdmin(model);

            return Ok(new Response { Status = "Success", Message = "Admin created successfully!" });
        }

 
    }
}
