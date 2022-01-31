using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalProject_Console.Models
{
    public partial class Treatment
    {
        public int? PatientId { get; set; }
        public int? DoctorId { get; set; }
        public int? AssistantId { get; set; }

        public virtual Assistant Assistant { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
