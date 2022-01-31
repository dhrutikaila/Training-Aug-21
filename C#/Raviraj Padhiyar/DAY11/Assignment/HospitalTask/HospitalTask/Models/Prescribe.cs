using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalTask.Models
{
    public partial class Prescribe
    {
        public Prescribe()
        {
            Medications = new HashSet<Medication>();
        }

        public int Id { get; set; }
        public int? PatientId { get; set; }
        public int? DoctorId { get; set; }
        public int? AssistantId { get; set; }
        public DateTime Date { get; set; }

        public virtual Assistant Assistant { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual ICollection<Medication> Medications { get; set; }
    }
}
