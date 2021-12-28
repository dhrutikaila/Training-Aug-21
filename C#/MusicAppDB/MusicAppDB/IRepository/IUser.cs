using Microsoft.AspNetCore.Identity;
using MusicAppDB.Authentication;
using MusicAppDB.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
    public interface IUser : IGenericInterface<ApplicationUser>
    {
        Task<IdentityResult> RegisterUser(RegisterModel model);
        Task<string> LoginUser(string userName, string password);
        public User FindName(string name);
        public User FindContact(string contact);
        Task<Response> ConfirmEmailAsync(string userId, string token);
        Task<bool> IsEmailConfirmedAsync(string userName);
        public IEnumerable GetAllUsers();
    }
}
