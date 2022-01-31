using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class Drugs
    {
        public Drugs()
        {
            MedicalPrescription = new HashSet<MedicalPrescription>();
        }

        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public string DrugDisease { get; set; }

        public virtual ICollection<MedicalPrescription> MedicalPrescription { get; set; }
    }
}
