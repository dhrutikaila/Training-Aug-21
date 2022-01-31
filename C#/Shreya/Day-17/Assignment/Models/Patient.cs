using System;
using System.Collections.Generic;

#nullable disable

namespace Day_17Assignment.Models
{
    public partial class Patient
    {
        public Patient()
        {
            DrugsSchedules = new HashSet<DrugsSchedule>();
            TreatMents = new HashSet<TreatMent>();
        }

        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public int? AssistanceId { get; set; }

        public virtual Assistance Assistance { get; set; }
        public virtual ICollection<DrugsSchedule> DrugsSchedules { get; set; }
        public virtual ICollection<TreatMent> TreatMents { get; set; }
    }
}
