using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class Customers
    {
        public Customers()
        {
            OrderHeaders = new HashSet<OrderHeaders>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string ContactNumber { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<OrderHeaders> OrderHeaders { get; set; }
    }
}
