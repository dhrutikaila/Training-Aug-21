using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set;}
        [Required(ErrorMessage = "Password is Required")]
        public string Password { get; set;}
        
        //[MaxLength(50)]
        //public string FirstName { get; set;}
        
        //[MaxLength(50)]
        //public string LastName { get; set;}
        [Required(ErrorMessage = "Username is Required")]
        [MaxLength(50)]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Phone number is Required")]
        [Phone]
        [MaxLength(10)]
        public string PhoneNumber { get; set;}
        [Required(ErrorMessage = "Email is Required")]
        [EmailAddress]
        public string Email { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }
        public ICollection<UserAddress> userAddresses { get; set; }
    }
}
