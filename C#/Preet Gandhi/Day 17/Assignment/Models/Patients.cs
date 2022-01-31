using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class Patients
    {
        public Patients()
        {
            MedicalPrescription = new HashSet<MedicalPrescription>();
            Treatment = new HashSet<Treatment>();
        }
        [Key]
        public int PtId { get; set; }
        [Required]
        public string PtName { get; set; }
        public byte PtAge { get; set; }
        public string PtGender { get; set; }
        public string PtDisease { get; set; }

        public virtual ICollection<MedicalPrescription> MedicalPrescription { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
