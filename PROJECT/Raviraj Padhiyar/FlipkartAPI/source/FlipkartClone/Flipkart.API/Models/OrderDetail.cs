using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class OrderDetail
    {
        public int OrderDetailId { get; set; }
        public int? OrderHeaderId { get; set; }
        public int? ProductId { get; set; }
        public int? OrderStatusId { get; set; }
        public int ProductQuantity { get; set; }
        public decimal UnitPrice { get; set; }
        public Guid CarrieTrakingNumber { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
        public decimal? NetPrice { get; set; }

        public virtual OrderHeader OrderHeader { get; set; }
        public virtual OrderStatus OrderStatus { get; set; }
        public virtual Product Product { get; set; }
    }
}
