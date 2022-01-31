using System;
using System.Collections.Generic;

#nullable disable

namespace TOY_API_DAY14_1.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Addresses = new HashSet<Address>();
            OrderTbls = new HashSet<OrderTbl>();
        }

        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string MobileNumber { get; set; }

        public virtual ICollection<Address> Addresses { get; set; }
        public virtual ICollection<OrderTbl> OrderTbls { get; set; }
    }
}
