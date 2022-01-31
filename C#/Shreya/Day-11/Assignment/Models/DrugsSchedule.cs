using System;
using System.Collections.Generic;

#nullable disable

namespace Day_10.Models
{
    public partial class DrugsSchedule
    {
        public int? DrugId { get; set; }
        public int? PatientId { get; set; }
        public string Parts { get; set; }

        public virtual Drug Drug { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
