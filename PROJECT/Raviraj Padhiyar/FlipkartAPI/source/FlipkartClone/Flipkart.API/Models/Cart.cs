using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Cart
    {
        public Cart()
        {
            CartItems = new HashSet<CartItem>();
            OrderHeaders = new HashSet<OrderHeader>();
        }

        public int CartId { get; set; }
        public int? CustomerId { get; set; }
        public decimal Total { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual ICollection<CartItem> CartItems { get; set; }
        public virtual ICollection<OrderHeader> OrderHeaders { get; set; }
    }
}
