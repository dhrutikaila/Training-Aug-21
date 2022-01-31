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
    public interface IOrganisation: IGenericInterface<ApplicationUser>
    {
        Task<IdentityResult> RegisterOrganisation(RegisterModel model);
        public void CreateOrganisation(RegisterModel model);
        public Organisations GetByName(string name);
        public Organisations GetByEmail(string name);
        public Organisations GetByContact(string contact);
        Task<Response> ConfirmEmailAsync(string userId, string token);
    }
}
