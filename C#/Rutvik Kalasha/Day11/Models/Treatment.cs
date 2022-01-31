using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
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
        public virtual Patients PatientNavigation { get; set; }
    }
}