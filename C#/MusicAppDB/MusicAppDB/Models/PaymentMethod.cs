using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class PaymentMethod
    {
        public PaymentMethod()
        {
            Payments = new HashSet<PaymentMethod>();
        }

        public int PaymentMethodId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<PaymentMethod> Payments { get; set; }
    }
}
