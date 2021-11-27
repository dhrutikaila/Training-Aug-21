using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
    class Customer
    {
        public int CustomerId { get; set; }
        [Required]
        [MaxLength(25)]
        public byte Age { get; set; }
        public string CustomerName { get; set; }
        [Required]
        [MaxLength(10)]
        public string PhoneNumber { get; set; }
       
        public ICollection<Order> Orders { get; set; }

    }
}