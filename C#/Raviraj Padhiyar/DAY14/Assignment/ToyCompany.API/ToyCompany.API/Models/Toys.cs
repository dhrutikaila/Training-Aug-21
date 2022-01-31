using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class Toys
    {
        public Toys()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int Id { get; set; }
        public string ToyName { get; set; }
        public decimal Price { get; set; }
        public int TypeId { get; set; }

        public virtual ToyTypes Type { get; set; }
        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
