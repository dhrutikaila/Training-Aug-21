using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class OrderStatus
    {
        public OrderStatus()
        {
            OrderDetails = new HashSet<OrderDetail>();
            OrderHeaders = new HashSet<OrderHeader>();
        }

        public int OrderStatusId { get; set; }
        public string OrderStatus1 { get; set; }
        public DateTime ModifiedAt { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<OrderHeader> OrderHeaders { get; set; }
    }
}
