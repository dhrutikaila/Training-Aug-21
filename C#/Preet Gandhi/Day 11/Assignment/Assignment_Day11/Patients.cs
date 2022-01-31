using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class Patients
    {
        public Patients()
        {
            MedicalPrescription = new HashSet<MedicalPrescription>();
            Treatment = new HashSet<Treatment>();
        }

        public int PtId { get; set; }
        public string PtName { get; set; }
        public byte PtAge { get; set; }
        public string PtGender { get; set; }
        public string PtDisease { get; set; }

        public virtual ICollection<MedicalPrescription> MedicalPrescription { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
