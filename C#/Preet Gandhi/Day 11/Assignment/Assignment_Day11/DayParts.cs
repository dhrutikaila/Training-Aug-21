using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class DayParts
    {
        public DayParts()
        {
            MedicalPrescription = new HashSet<MedicalPrescription>();
        }

        public int DayPartId { get; set; }
        public string DayPartName { get; set; }

        public virtual ICollection<MedicalPrescription> MedicalPrescription { get; set; }
    }
}
