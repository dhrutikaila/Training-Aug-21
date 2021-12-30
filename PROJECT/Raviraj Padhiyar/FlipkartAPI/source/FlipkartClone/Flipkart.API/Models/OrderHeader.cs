using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class OrderHeader
    {
        public OrderHeader()
        {
            OrderDetails = new HashSet<OrderDetail>();
            OrderPayments = new HashSet<OrderPayment>();
        }

        public int OrderHeaderId { get; set; }
        public int? OrderStatusId { get; set; }
        public DateTime OrderDate { get; set; }
        public int? CustomerId { get; set; }
        public int? CartId { get; set; }
        public int? BillToAddressId { get; set; }
        public int? ShippingToAddressId { get; set; }
        public decimal SubTotal { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Address BillToAddress { get; set; }
        public virtual Cart Cart { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual OrderStatus OrderStatus { get; set; }
        public virtual Address ShippingToAddress { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<OrderPayment> OrderPayments { get; set; }
    }
}
