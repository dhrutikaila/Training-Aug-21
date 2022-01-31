using CharityAPI.IServices;
using CharityAPI.Authentication;
using CharityAPI.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class AdminServices : GenericRepository<ApplicationUser>, IAdmin
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IConfiguration _configuration;
        public AdminServices(CharityAPIContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration) : base(context)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            _configuration = configuration;
        }
        // To Register admin
        public async Task<IdentityResult> RegisterAdmin(RegisterModel model)
        {
            ApplicationUser admin = new ApplicationUser()
            {
                Email = model.Email,
                SecurityStamp = Guid.NewGuid().ToString(),
                UserName = model.Username,
                PhoneNumber = model.PhoneNumber
            };
            var result = await userManager.CreateAsync(admin, model.Password);

            if (!await roleManager.RoleExistsAsync(UserRoles.Admin))
                await roleManager.CreateAsync(new IdentityRole(UserRoles.Admin));

            if (await roleManager.RoleExistsAsync(UserRoles.Admin))
            {
                await userManager.AddToRoleAsync(admin, UserRoles.Admin);
            }

            //if (result.Succeeded)
            //{
            //    var confirmEmailToken = await userManager.GenerateEmailConfirmationTokenAsync(admin);
            //    var encodedEmailToken = Encoding.UTF8.GetBytes(confirmEmailToken);
            //    var validEmailToken = WebEncoders.Base64UrlEncode(encodedEmailToken);

            //    string url = $"{_configuration["AppUrl"]}/api/authenticate/confirmemail?userid={admin.Id}&token={validEmailToken}";

            //    MailRequest request = new MailRequest();

            //    request.ToEmail = model.Email;
            //    request.Subject = $"Hello {model.Username}, Confirm Your Email!";
            //    request.Body = $"<h1>You have successfully registered yourself with BookMyShow!</h1><h4>Your OTP is: 1234</h4><p><a href='{url}'>Click here</a> to verify your email</p>";

            //    try
            //    {
            //        mailService.SendEmailAsync(request);
            //    }
            //    catch (Exception ex)
            //    {
            //        throw;
            //    }
            //}

            return result;
        }
        // Map admin details to Admins table in BookMyShowDB from Users table in BookMyShowAuthenticationAPIDB
        public void CreateAdmin(RegisterModel model)
        {
            context.Admins.Add(new Admins()
            {
                EmailAddress = model.Email,
                PasswordHash = model.Password,
                UserName = model.Username,
                MobileNo = model.PhoneNumber,
                CreatedBy = model.Username,
                CreatedAt = DateTime.Now,
                UpdatedBy= model.Username,
                UpdatedAt = DateTime.Now,
            });

            context.SaveChanges();
        }
        // Return Admin information based on username
        public Admins GetByName(string name)
        {
            var registeredAdmin = context.Admins.SingleOrDefault(x => x.UserName == name && x.IsPublished == true);
            return registeredAdmin;
        }
        public Admins GetByContact(string contact)
        {
            var registeredAdmin = context.Admins.SingleOrDefault(x => x.MobileNo == contact);
            return registeredAdmin;
        }
        public Admins GetByEmail(string email)
        {
            
            var registeredAdmin = context.Admins.SingleOrDefault(x => x.EmailAddress == email && x.IsPublished == true);
            return registeredAdmin;
        }
        // Confirm Email
        public async Task<Response> ConfirmEmailAsync(string userId, string token)
        {
            var user = await userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return new Response
                {
                    Status = "Error",
                    Message = "User not found"
                };
            }

            var decodedToken = WebEncoders.Base64UrlDecode(token);
            string normalToken = Encoding.UTF8.GetString(decodedToken);

            var result = await userManager.ConfirmEmailAsync(user, normalToken);

            if (result.Succeeded)
            {
                return new Response
                {
                    Status = "Success",
                    Message = "Email Confirmed Successfully"
                };
            }

            return new Response
            {
                Status = "Error",
                Message = "Email not confirmed"
            };
        }
    }
}
