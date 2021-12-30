using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class OrderHeaderDto
    {
        public int OrderHeaderId { get; set; }
        public int? OrderStatusId { get; set; }
        public DateTime OrderDate { get; set; }
        public int? CustomerId { get; set; }
        public int? CartId { get; set; }
        public int? BillToAddressId { get; set; }
        public int? ShippingToAddressId { get; set; }
        public decimal SubTotal { get; set; }
    }
}
