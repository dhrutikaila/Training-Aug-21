using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class Assistants
    {
        public Assistants()
        {
            PatientTakesMedicine = new HashSet<PatientTakesMedicine>();
            Treatment = new HashSet<Treatment>();
        }

        public int AssistantId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? WorksUnder { get; set; }
        public decimal YearsOfExperience { get; set; }
        public bool? IsActive { get; set; }

        public virtual Doctors WorksUnderNavigation { get; set; }
        public virtual ICollection<PatientTakesMedicine> PatientTakesMedicine { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}