using APIProject.Authentication;
using APIProject.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Interface
{
    public interface IAdmin
    {
        Task<IdentityResult> RegisterAdmin(RegisterModel model);
        public void CreateAdmin(RegisterModel model);
        public Admin FindName(string name);
        public Admin FindContact(string contact);
    }
}
