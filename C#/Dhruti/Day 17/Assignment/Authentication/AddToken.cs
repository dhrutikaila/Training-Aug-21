
using Doctor_Api.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Doctor_Api.Authentication
{
    public class AddToken
    {
        private readonly IConfiguration _config;

        public AddToken(IConfiguration configuration)
        {
            _config = configuration;
        }
        public string GenrateToken(LoginInfo loginInfo)
        {
            var SecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var Cradentials = new SigningCredentials(SecurityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier,loginInfo.Username),
                new Claim(ClaimTypes.Email,loginInfo.EmailAddress),
                new Claim(ClaimTypes.Name,loginInfo.GivenName),
                new Claim(ClaimTypes.Surname,loginInfo.Surname),
                new Claim(ClaimTypes.Role,loginInfo.Role)
            };

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(60),
                signingCredentials: Cradentials
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
