using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Day12_13.Models
{
    class CustomerAddress
    {
        [Key]
        public int AddressId { get; set; }
        public string Address { get; set;}
        public string State { get; set;}
        public string City { get; set;}

        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }

    }
}
