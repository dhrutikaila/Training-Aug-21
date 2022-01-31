using System;
using System.Collections.Generic;

#nullable disable

namespace Day_10.Models
{
    public partial class TreatMent
    {
        public int? PatientId { get; set; }
        public int? DoctorId { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
