using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Plan
    {
        public Plan()
        {
            Subscriptions = new HashSet<Subscription>();
        }

        public int PlanId { get; set; }
        public string PlanName { get; set; }
        public decimal PricePerMonth { get; set; }

        public virtual ICollection<Subscription> Subscriptions { get; set; }
    }
}
