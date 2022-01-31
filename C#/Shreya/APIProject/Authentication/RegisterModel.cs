using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Authentication
{
    public class RegisterModel
    {
        [Required(ErrorMessage ="Username is required")]
        public string UserName { get; set; }
        [EmailAddress]
        [Required(ErrorMessage ="Email is required")]
        public string Email { get; set; }
        
        [Phone]
        [Required(ErrorMessage = "Phone Number is required")]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
