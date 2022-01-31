using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AuthExampleFinal.Models
{
    public class SignUp
    {
        
        [Required]
        public string FirstName { get; set; }
        
        [Required]
        public string LastName { get; set; }
        
        
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        
        [Required]
        [Compare("ConfirmPassword")]
        public string Password { get; set; }
       
        [Required]
        public string ConfirmPassword { get; set; }
    }
}
