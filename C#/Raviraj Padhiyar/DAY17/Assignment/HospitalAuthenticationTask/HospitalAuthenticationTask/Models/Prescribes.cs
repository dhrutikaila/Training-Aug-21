using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace HospitalAuthenticationTask.Models
{
    public partial class Prescribes
    {
        public Prescribes()
        {
            Medications = new HashSet<Medications>();
        }

        public int Id { get; set; }
        public int? PatientId { get; set; }
        public int? DoctorId { get; set; }
        public int? AssistantId { get; set; }
        public DateTime Date { get; set; }

        public virtual Assistants Assistant { get; set; }
        public virtual Doctors Doctor { get; set; }
        public virtual Patients Patient { get; set; }
        public virtual ICollection<Medications> Medications { get; set; }
    }
}
