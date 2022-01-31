using APIProject.Authentication;
using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class AdminRepository : GenericRepository<ApplicationUser> , IAdmin
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IConfiguration _configuration;

        public AdminRepository(MamaEarthDBContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration) : base(context)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            _configuration = configuration;
        
        }

        public void CreateAdmin(RegisterModel model)
        {
            _mamaEarthDBContext.Admin.Add(new Admin()
            {
                PhoneNumber = model.PhoneNumber,
                Email = model.Email,
                Password = model.Password,
                UserName = model.UserName
            });

            _mamaEarthDBContext.SaveChanges();
        }

        public Admin FindContact(string contact)
        {
            var registeredAdmin = _mamaEarthDBContext.Admin.SingleOrDefault(x => x.PhoneNumber == contact);
            return registeredAdmin;
        }

        public Admin FindName(string name)
        {
            var registeredAdmin = _mamaEarthDBContext.Admin.FirstOrDefault(x => x.UserName == name);
            return registeredAdmin;
        }

        public async Task<IdentityResult> RegisterAdmin(RegisterModel model)
        {
            ApplicationUser admin = new ApplicationUser()
            {
                Email = model.Email,
                SecurityStamp = Guid.NewGuid().ToString(),
                UserName = model.UserName,
                PhoneNumber = model.PhoneNumber
            };
            var result = await userManager.CreateAsync(admin, model.Password);

            if (!await roleManager.RoleExistsAsync(UserRoles.Admin))
                await roleManager.CreateAsync(new IdentityRole(UserRoles.Admin));

            if (await roleManager.RoleExistsAsync(UserRoles.Admin))
            {
                await userManager.AddToRoleAsync(admin, UserRoles.Admin);
            }
            if (result.Succeeded)
            {
                _mamaEarthDBContext.Admin.Add(new Admin()
                {
                    PhoneNumber = model.PhoneNumber,
                    Email = model.Email,
                    Password = admin.PasswordHash,
                    UserName = model.UserName
                });
                _mamaEarthDBContext.SaveChanges();
            }
            return result;
        }
     }
 }

