using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class Doctors
    {
        public Doctors()
        {
            MedicalPrescription = new HashSet<MedicalPrescription>();
            Treatment = new HashSet<Treatment>();
        }

        public int DrId { get; set; }
        public string DrName { get; set; }
        public byte? DrAge { get; set; }
        public string DrGender { get; set; }

        public virtual ICollection<MedicalPrescription> MedicalPrescription { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
