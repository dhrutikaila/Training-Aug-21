using AuthExampleFinal.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AuthExampleFinal.Repository
{
   public interface IAccountRepository
    {
        Task<IdentityResult> SignUpAsync(SignUp signUp);
        Task<string> LoginAsync(SignIn signIn);
    }
}
