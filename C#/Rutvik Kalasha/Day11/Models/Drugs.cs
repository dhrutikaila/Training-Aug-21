using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class Drugs
    {
        public Drugs()
        {
            PatientTakesMedicine = new HashSet<PatientTakesMedicine>();
        }

        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public short Mg { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<PatientTakesMedicine> PatientTakesMedicine { get; set; }
    }
}