using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyCompany.Models
{
    class ShippingAddress
    {
        [Key]
        public int Id { get; set; }
        public int OrderHeaderId { get; set; }
        public int AddressId { get; set; }

        public Address Address { get; set; }
        public OrderHeader OrderHeader { get; set; }

    }
}
