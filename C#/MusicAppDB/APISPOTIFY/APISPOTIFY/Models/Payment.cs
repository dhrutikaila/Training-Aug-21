using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Payment
    {
        public int PaymentId { get; set; }
        public int UserId { get; set; }
        public int SubscriptionId { get; set; }
        public int PaymentMethodId { get; set; }
        public bool PaymnetStatus { get; set; }

        public virtual PaymentMethod PaymentMethod { get; set; }
        public virtual Subscription Subscription { get; set; }
        public virtual User User { get; set; }
    }
}
