using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Carts = new HashSet<Cart>();
            CustomerAddresses = new HashSet<CustomerAddress>();
            OrderHeaders = new HashSet<OrderHeader>();
            PaymentDetails = new HashSet<PaymentDetail>();
        }

        public int CustomerId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public long PhoneNumber { get; set; }
        public string Email { get; set; }
        public bool Active { get; set; }
        public DateTime RegisteredAt { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
        public string UserName { get; set; }

        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }
        public virtual ICollection<OrderHeader> OrderHeaders { get; set; }
        public virtual ICollection<PaymentDetail> PaymentDetails { get; set; }
    }
}
