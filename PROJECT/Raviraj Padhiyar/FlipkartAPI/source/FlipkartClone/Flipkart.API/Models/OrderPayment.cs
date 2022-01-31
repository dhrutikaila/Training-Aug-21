using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class OrderPayment
    {
        public int OrderPaymentId { get; set; }
        public int? OrderHeaderId { get; set; }
        public bool OrderPaymentStatus { get; set; }
        public DateTime PaymentDate { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual OrderHeader OrderHeader { get; set; }
    }
}
