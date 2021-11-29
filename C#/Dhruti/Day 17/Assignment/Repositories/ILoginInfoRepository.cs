using Authentication.Controllers;
using Doctor_Api.Models;

namespace Doctor_Api.Controllers
{
    public interface ILoginInfoRepository
    {
        void SingUp(LoginInfo loginInfo);

        LoginInfo SignIn(LoginModel loginModel);
    }
}