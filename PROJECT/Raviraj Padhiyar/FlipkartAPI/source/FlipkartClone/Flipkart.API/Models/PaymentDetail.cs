using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class PaymentDetail
    {
        public int PaymentDetailId { get; set; }
        public int? CustomerId { get; set; }
        public string Upiid { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
