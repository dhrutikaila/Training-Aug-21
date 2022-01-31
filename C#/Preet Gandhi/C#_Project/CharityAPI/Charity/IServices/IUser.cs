using CharityAPI.Authentication;
using CharityAPI.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IUser: IGenericInterface<ApplicationUser>
    {
        Task<IdentityResult> RegisterUser(RegisterModel model);
        Task<string> LoginUser(string userName, string password);
        public ApplicationUser FindName(string name);
        public ApplicationUser FindByEmail(string name);
        public ApplicationUser FindContact(string contact);
        public Users GetByName(string name);
        public Users GetByEmail(string name);
        public Users GetByContact(string contact);
        Task<Response> ConfirmEmailAsync(string userId, string token);
        Task<bool> IsEmailConfirmedAsync(string userName);
        public IEnumerable GetAllUsers();
    }
}
