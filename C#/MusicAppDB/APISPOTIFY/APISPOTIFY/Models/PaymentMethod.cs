using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class PaymentMethod
    {
        public PaymentMethod()
        {
            Payments = new HashSet<Payment>();
        }

        public int PaymentMethodId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Payment> Payments { get; set; }
    }
}
