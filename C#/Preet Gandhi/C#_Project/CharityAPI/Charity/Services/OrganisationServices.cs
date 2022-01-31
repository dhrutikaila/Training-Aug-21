using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class OrganisationServices : GenericRepository<ApplicationUser>, IOrganisation
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IConfiguration _configuration;
        public OrganisationServices(CharityAPIContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration) : base(context)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            _configuration = configuration;
        }
        // To Register Organisation
        public async Task<IdentityResult> RegisterOrganisation(RegisterModel model)
        {
            ApplicationUser organisation = new ApplicationUser()
            {
                Email = model.Email,
                SecurityStamp = Guid.NewGuid().ToString(),
                UserName = model.Username,
                PhoneNumber = model.PhoneNumber
            };
            var result = await userManager.CreateAsync(organisation, model.Password);

            if (!await roleManager.RoleExistsAsync(UserRoles.Organisation))
                await roleManager.CreateAsync(new IdentityRole(UserRoles.Organisation));

            if (await roleManager.RoleExistsAsync(UserRoles.Organisation))
            {
                await userManager.AddToRoleAsync(organisation, UserRoles.Organisation);
            }

            //if (result.Succeeded)
            //{
            //    var confirmEmailToken = await userManager.GenerateEmailConfirmationTokenAsync(organisation);
            //    var encodedEmailToken = Encoding.UTF8.GetBytes(confirmEmailToken);
            //    var validEmailToken = WebEncoders.Base64UrlEncode(encodedEmailToken);

            //    string url = $"{_configuration["AppUrl"]}/api/authenticate/confirmemail?userid={organisation.Id}&token={validEmailToken}";

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
        // Map organisation details to Organisations table in BookMyShowDB from Users table in BookMyShowAuthenticationAPIDB
        public void CreateOrganisation(RegisterModel model)
        {
            Random rnd = new Random();
            //var otp = rnd.Next(1000, 9999);
            var otp = 1234;
            context.Organisations.Add(new Organisations()
            {
                EmailAddress = model.Email,
                PasswordHash = model.Password,
                UserName = model.Username,
                MobileNo = model.PhoneNumber,
                Otp = otp,
                OtpCreatedAt = DateTime.Now,
                CreatedBy = model.Username,
                CreatedAt = DateTime.Now,
                UpdatedBy = model.Username,
                UpdatedAt = DateTime.Now,
            });

            context.SaveChanges();
        }
        // Return Organisation information based on username
        public Organisations GetByName(string name)
        {
            var registeredOrganisation = context.Organisations.Include(x=>x.OrganisationData).SingleOrDefault(x => x.UserName == name && x.IsPublished == true);
            return registeredOrganisation;
        }
        public Organisations GetByContact(string contact)
        {
            var registeredOrganisation = context.Organisations.SingleOrDefault(x => x.MobileNo == contact);
            return registeredOrganisation;
        }
        public Organisations GetByEmail(string email)
        {

            var registeredOrganisation = context.Organisations.SingleOrDefault(x => x.EmailAddress == email);
            return registeredOrganisation;
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
