using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class PatientTakesMedicine
    {
        public int Id { get; set; }
        public int? Patient { get; set; }
        public int? Drug { get; set; }
        public int? Timing { get; set; }
        public int? Assistant { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public virtual Assistants AssistantNavigation { get; set; }
        public virtual Drugs DrugNavigation { get; set; }
        public virtual Patients PatientNavigation { get; set; }
        public virtual DrugTiming TimingNavigation { get; set; }
    }
}