using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Doctor_Api.Models
{
    public partial class Prescription
    {
        public int PreId { get; set; }
        public DateTime PreDate { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public int DrugsId { get; set; }
        public byte DayPart { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual Drug Drugs { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
