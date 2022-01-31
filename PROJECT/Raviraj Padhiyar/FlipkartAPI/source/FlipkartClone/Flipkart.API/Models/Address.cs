using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Address
    {
        public Address()
        {
            CustomerAddresses = new HashSet<CustomerAddress>();
            OrderHeaderBillToAddresses = new HashSet<OrderHeader>();
            OrderHeaderShippingToAddresses = new HashSet<OrderHeader>();
            Sellers = new HashSet<Seller>();
        }

        public int AddressId { get; set; }
        public string Addressline1 { get; set; }
        public string AddressLine2 { get; set; }
        public long ContactNumber { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public int PostalCode { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual City City { get; set; }
        public virtual State State { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }
        public virtual ICollection<OrderHeader> OrderHeaderBillToAddresses { get; set; }
        public virtual ICollection<OrderHeader> OrderHeaderShippingToAddresses { get; set; }
        public virtual ICollection<Seller> Sellers { get; set; }
    }
}
