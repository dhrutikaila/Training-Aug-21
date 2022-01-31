using System;
using System.Collections.Generic;

#nullable disable

namespace Day_10.Models
{
    public partial class Assistance
    {
        public Assistance()
        {
            Patients = new HashSet<Patient>();
        }

        public int AssistanceId { get; set; }
        public string AssistanceName { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Department Department { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
