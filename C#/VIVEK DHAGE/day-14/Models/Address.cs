using System;
using System.Collections.Generic;

#nullable disable

namespace TOY_API_DAY14_1.Models
{
    public partial class Address
    {
        public int AddressId { get; set; }
        public string AddressLine { get; set; }
        public string City { get; set; }
        public int Pincode { get; set; }
        public string State { get; set; }
        public int? CustomerId { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
