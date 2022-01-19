using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Subscription
    {
        public Subscription()
        {
            Payments = new HashSet<Payment>();
        }

        public int SubscriptionId { get; set; }
        public int UserId { get; set; }
        public int PlanId { get; set; }
        public int Months { get; set; }
        public DateTime StartTimestamp { get; set; }
        public DateTime? EndTimeStamp { get; set; }

        public virtual Plan Plan { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Payment> Payments { get; set; }
    }
}
