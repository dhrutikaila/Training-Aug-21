using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class CustomerAddress
    {
        public int CustomerAddressId { get; set; }
        public int? CustomerId { get; set; }
        public int? AddressId { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Address Address { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
