using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class CustomerAddressDto
    {
        public int CustomerAddressId { get; set; }
        public int? CustomerId { get; set; }
        public int? AddressId { get; set; }
        public DateTime ModifiedAt { get; set; }
    }
}
