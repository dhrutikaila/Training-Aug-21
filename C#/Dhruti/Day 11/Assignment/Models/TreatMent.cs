using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Hospital_Mange.Models
{
    public partial class Treatment
    {
        public int TreatmentId { get; set; }
        public int? Patient { get; set; }
        public int? Doctor { get; set; }
        public int? Assistant { get; set; }
        public DateTime TreatmentDate { get; set; }

        public virtual Assistants AssistantNavigation { get; set; }
        public virtual Doctors DoctorNavigation { get; set; }
        public virtual Patient PatientNavigation { get; set; }
    }
}
