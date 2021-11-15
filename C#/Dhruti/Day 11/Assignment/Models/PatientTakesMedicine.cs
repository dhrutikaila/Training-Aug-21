using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Hospital_Mange.Models
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
        public virtual Drug DrugNavigation { get; set; }
        public virtual Patient PatientNavigation { get; set; }
        public virtual DrugTiming TimingNavigation { get; set; }
    }
}
