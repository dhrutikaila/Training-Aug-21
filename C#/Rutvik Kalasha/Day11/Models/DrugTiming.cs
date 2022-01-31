using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class DrugTiming
    {
        public DrugTiming()
        {
            PatientTakesMedicine = new HashSet<PatientTakesMedicine>();
        }

        public int TimingId { get; set; }
        public string Part { get; set; }

        public virtual ICollection<PatientTakesMedicine> PatientTakesMedicine { get; set; }
    }
}