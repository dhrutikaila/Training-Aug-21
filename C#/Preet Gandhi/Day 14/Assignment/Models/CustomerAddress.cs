using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class CustomerAddress
    {
        [Key]
        public int CustomerAddressId { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }

        public int CustomerId { get; set; }
        public Customer Customer { get; set; }

        public Order Order { get; set; }
    }
}
