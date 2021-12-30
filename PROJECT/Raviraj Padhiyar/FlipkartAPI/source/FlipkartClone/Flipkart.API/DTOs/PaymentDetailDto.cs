using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class PaymentDetailDto
    {
        public int PaymentDetailId { get; set; }
        public int? CustomerId { get; set; }
        public string Upiid { get; set; }
    }
}
