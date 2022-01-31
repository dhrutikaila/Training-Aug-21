using CharityAPI.Authentication;
using CharityAPI.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IAdmin
    {
        Task<IdentityResult> RegisterAdmin(RegisterModel model);
        public void CreateAdmin(RegisterModel model);
        public Admins GetByName(string name);
        public Admins GetByEmail(string name);
        public Admins GetByContact(string contact);
        Task<Response> ConfirmEmailAsync(string userId, string token);
    }
}
