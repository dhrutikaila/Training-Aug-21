﻿using System;
using System.Collections.Generic;



namespace ZomatoApp.Models
{
    public partial class Payment
    {
        public Payment()
        {
            Ordertables = new HashSet<Ordertable>();
        }

        public int PaymentId { get; set; }
        public string PaymentName { get; set; }

        public virtual ICollection<Ordertable> Ordertables { get; set; }
    }
}
