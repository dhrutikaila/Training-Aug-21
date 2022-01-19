using MusicAppDB.Authentication;
using MusicAppDB.IRepository;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using APISPOTIFY.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Net.Mail;
using APISPOTIFY.Authentication;
using APISPOTIFY.Repository;
using APISPOTIFY.IRepository;

namespace MusicAppDB.Repository
{
    public class UserRepository: GenericRepository<ApplicationUser>, IUser
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IConfiguration _configuration;
     

        public UserRepository(MusicAppDBContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration) : base(context)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            _configuration = configuration;
           
        }
        // Get information of a particular user based on username
        public User FindName(string name)
        {
            var registeredUser = context.User.SingleOrDefault(x => x.UserName == name);
            return registeredUser;
        }
        public IEnumerable GetAllUsers()
        {
            var users = context.User;

            return users;
        }

        public User FindContact(string contact)
        {
            var registeredUser = context.User.SingleOrDefault(x => x.Contactno == contact);
            return registeredUser;
        }

        // Login Users
        public async Task<string> LoginUser(string userName, string password)
        {
          
                var user = await userManager.FindByNameAsync(userName);

                var userRoles = await userManager.GetRolesAsync(user);

                if (user == null || !await userManager.CheckPasswordAsync(user, password))
                {
                    return null;
                }

                var authClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.UserName),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                };

                foreach (var userRole in userRoles)
                {
                    authClaims.Add(new Claim(ClaimTypes.Role, userRole));
                }

                var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));

                var token = new JwtSecurityToken(
                    issuer: _configuration["JWT:ValidIssuer"],
                    audience: _configuration["JWT:ValidAudience"],
                    expires: DateTime.Now.AddHours(8),
                    claims: authClaims,
                    signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                    );

                return new JwtSecurityTokenHandler().WriteToken(token);
          }

        

        // Register User
        public async Task<IdentityResult> RegisterUser(RegisterModel model)
        {
            ApplicationUser user = new ApplicationUser()
            {
                Email = model.Email,
                SecurityStamp = Guid.NewGuid().ToString(),
                UserName = model.UserName,
                PhoneNumber = model.ContactNo,
             

            };
            var result = await userManager.CreateAsync(user, model.Password);

            if (!await roleManager.RoleExistsAsync(UserRoles.User))
                await roleManager.CreateAsync(new IdentityRole(UserRoles.User));

            if (await roleManager.RoleExistsAsync(UserRoles.User))
            {
                await userManager.AddToRoleAsync(user, UserRoles.User);
            }

            if (result.Succeeded)
            {
               // Random rnd = new Random();
               // var otp = rnd.Next(1000, 9999);
                context.User.Add(new User()
                {
                    
                    Email = model.Email,
                    Contactno = model.ContactNo,
                    Password = user.PasswordHash,
                    UserName = model.UserName,
                   // Otp = otp
                  
                   // CreatedOn = DateTime.Now

                });

                context.SaveChanges();

              
            }

            return result;
        }
  
    }
}
