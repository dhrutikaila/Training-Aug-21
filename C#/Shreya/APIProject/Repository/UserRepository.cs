using APIProject.Authentication;
using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
namespace APIProject.Repository
{
    public class UserRepository : GenericRepository<ApplicationUser> , IUser
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IConfiguration _configuration;
        
        public UserRepository(MamaEarthDBContext context,
                               UserManager<ApplicationUser> userManager, 
                               RoleManager<IdentityRole> roleManager,
                               IConfiguration configuration) : base(context)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            _configuration = configuration;  
        }

        public User FindContact(string contact)
        {
            var registeredUser = _mamaEarthDBContext.User.SingleOrDefault(x => x.PhoneNumber == contact);
            return registeredUser;
        }

        public User FindName(string name)
        {
            var registeredUser = _mamaEarthDBContext.User.SingleOrDefault(x => x.UserName == name);
            return registeredUser;
        }

        public IEnumerable GetAllUsers()
        {
            var users = _mamaEarthDBContext.User;
            return users;
        }
        public async Task<string> LoginUser(string userName, string password)
        {
            var user = await userManager.FindByNameAsync(userName);
            var userRoles = await userManager.GetRolesAsync(user);
            if(user == null || !await userManager.CheckPasswordAsync(user, password)) 
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
                expires: DateTime.Now.AddHours(3),
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                );
            return new JwtSecurityTokenHandler().WriteToken(token); 
        }

        public async Task<IdentityResult> RegisterUser(RegisterModel model)
        {
            ApplicationUser user = new ApplicationUser()
            {
                Email = model.Email,
                SecurityStamp = Guid.NewGuid().ToString(),  
                UserName = model.UserName,
                PhoneNumber = model.PhoneNumber
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
                _mamaEarthDBContext.User.Add(new User()
                {
                    PhoneNumber = model.PhoneNumber,
                    Email = model.Email,
                    Password = user.PasswordHash,
                    UserName = model.UserName,
                    CreatedAt = DateTime.Now
                });
                _mamaEarthDBContext.SaveChanges();
            }
            return result;
        }
    }
}
