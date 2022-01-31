using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class UserAddress
    {
        [Key]               
        public int UserAddressId { get; set; }
        public int UserId { get; set; }
       
        [Required(ErrorMessage = "Address is Required")]
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        [Required(ErrorMessage = "City is Required")]
        public string City { get; set; }
        [Required(ErrorMessage = "Pin Code is Required")]
        [RegularExpression(@"^[1-9][0-9]{5}$", ErrorMessage = "Invalid Pincode")]
        public int PinCode { get; set; }
        public string Country { get; set; }
        public string PhoneNumber { get; set; }
        public bool Status { get; set; }    
    }
}
