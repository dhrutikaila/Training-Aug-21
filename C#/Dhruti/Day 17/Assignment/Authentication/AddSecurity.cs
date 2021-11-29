using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Doctor_Api.Authentication
{
 
        public class AddSecurity
        {
            public const string Key = "dhruti@7044#14#01#2000";

            public static string ConvertToEncrypt(string Password)
            {
                if (string.IsNullOrEmpty(Password))
                {
                    return "";
                }

                Password += Key;
                var PasswordBytes = Encoding.UTF8.GetBytes(Password);

                return Convert.ToBase64String(PasswordBytes);
            }
            public static string ConvertToDecrypt(string base64EncodeData)
            {
                if (string.IsNullOrEmpty(base64EncodeData))
                {
                    return "";
                }

                var base64EncodeBytes = Convert.FromBase64String(base64EncodeData);
                var Result = Encoding.UTF8.GetString(base64EncodeBytes);
                Result = Result.Substring(0, Result.Length - Key.Length);

                return Result;
            }
        }
    }


