using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Authentication
{
    public class RegisterModel
    {
        [Required(ErrorMessage = "User Name is required")]
        public string UserName { get; set; }

        [EmailAddress]
        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        [Phone]
        [Required(ErrorMessage = "PhoneNumber is required")]
        public string ContactNo { get; set; }
       


        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }
    }
}
