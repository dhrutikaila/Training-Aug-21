using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class Treatment
    {
        public Treatment()
        {
            Prescribed = new HashSet<Prescribed>();
        }

        public int TreatmentId { get; set; }
        public string DiseaseName { get; set; }
        public DateTime AdmitDate { get; set; }
        public DateTime? DischargeDate { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public string AssistantId { get; set; }
        public bool? IsActive { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual ICollection<Prescribed> Prescribed { get; set; }
    }
}
