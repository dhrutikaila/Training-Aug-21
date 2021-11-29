using Authentication.Controllers;
using Doctor_Api.Authentication;
using Doctor_Api.Controllers;
using Doctor_Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Doctor_Api.Repositories
{
    public class LoginInfoRepository : ILoginInfoRepository
    {
        private readonly HOSPITALContext context;

        public LoginInfoRepository(HOSPITALContext HOSPITALContext)
        {
            context = HOSPITALContext;
        }
        public LoginInfo SignIn(LoginModel loginModel)
        {
            if (loginModel == null)
            {
                throw new ArgumentNullException(nameof(loginModel));
            }

            var Password = AddSecurity.ConvertToEncrypt(loginModel.Password);
            var User = context.LoginInfos.SingleOrDefault(user => user.Username == loginModel.Username && user.Password == Password);
            return User;
        }


        public void SingUp(LoginInfo loginInfo)
        {
            if (loginInfo == null)
            {
                throw new ArgumentNullException(nameof(loginInfo));
            }
            context.LoginInfos.Add(loginInfo);
            context.SaveChanges();
        }
    }
}