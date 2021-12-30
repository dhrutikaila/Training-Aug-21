using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalAuthenticationTask.Authentication
{
    public class RegisterModel
    {
        [Required(ErrorMessage = "User name is required")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Email name is required")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Password name is required")]
        public string Password { get; set; }
    }
}
