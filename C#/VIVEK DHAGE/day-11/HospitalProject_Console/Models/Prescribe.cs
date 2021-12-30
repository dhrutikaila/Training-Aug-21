using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalProject_Console.Models
{
    public partial class Prescribe
    {
        public int Id { get; set; }
        public int? PatientId { get; set; }
        public int? DoctorId { get; set; }
        public int? AssistantId { get; set; }
        public DateTime Date { get; set; }
        public int? DrugId { get; set; }

        public virtual Assistant Assistant { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual Drug Drug { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
