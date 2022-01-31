using APIProject.Authentication;
using APIProject.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Interface
{
    public interface IUser : IGenericInterface<ApplicationUser> 
    {
        Task<IdentityResult> RegisterUser(RegisterModel model);
        Task<string> LoginUser(string userName, string password);
        public User FindName(string name);
        public User FindContact(string contact);
        public IEnumerable GetAllUsers();
    }
}
