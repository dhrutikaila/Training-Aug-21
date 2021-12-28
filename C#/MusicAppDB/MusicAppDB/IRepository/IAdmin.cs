using Microsoft.AspNetCore.Identity;
using MusicAppDB.Authentication;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
   public interface IAdmin
    {

        Task<IdentityResult> RegisterAdmin(RegisterModel model);
        public void CreateAdmin(RegisterModel model);
        public Admin FindName(string name);
        public Admin FindContact(string contact);
        Task<Response> ConfirmEmailAsync(string userId, string token);
    }
}
