
using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Doctor_Api.Models
{
    public partial class DrugTiming
    {
        public DrugTiming()
        {
            PatientTakesMedicine = new HashSet<Drug>();
        }

        public int TimingId { get; set; }
        public string Part { get; set; }

        public virtual ICollection<Drug> PatientTakesMedicine { get; set; }
    }
}