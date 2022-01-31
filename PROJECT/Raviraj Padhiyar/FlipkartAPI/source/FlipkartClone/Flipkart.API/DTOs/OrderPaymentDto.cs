using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class OrderPaymentDto
    {
        public int OrderPaymentId { get; set; }
        public int? OrderHeaderId { get; set; }
        public bool OrderPaymentStatus { get; set; }
        public DateTime PaymentDate { get; set; }
    }
}
