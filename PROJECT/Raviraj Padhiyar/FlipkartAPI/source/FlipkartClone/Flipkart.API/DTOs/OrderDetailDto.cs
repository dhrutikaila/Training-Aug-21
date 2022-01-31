using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class OrderDetailDto
    {
        public int OrderDetailId { get; set; }
        public int? OrderHeaderId { get; set; }
        public int? ProductId { get; set; }
        public int? OrderStatusId { get; set; }
        public int ProductQuantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal NetPrice { get; set; }
        public Guid CarrieTrakingNumber { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
