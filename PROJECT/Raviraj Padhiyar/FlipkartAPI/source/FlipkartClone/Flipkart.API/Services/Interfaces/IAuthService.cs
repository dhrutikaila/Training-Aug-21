using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace Flipkart.API.Services.Interfaces
{
    public interface IAuthService
    {
        Task<string> Login(LoginModel loginModel);
        Task<bool> Register(RegisterModel registerModel);
    }
}
