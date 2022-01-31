using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class MedicalPrescription
    {
        public int PresId { get; set; }
        public int PtId { get; set; }
        public int DrId { get; set; }
        public int DrugId { get; set; }
        public int DayPartId { get; set; }

        public virtual DayParts DayPart { get; set; }
        public virtual Doctors Dr { get; set; }
        public virtual Drugs Drug { get; set; }
        public virtual Patients Pt { get; set; }
    }
}
