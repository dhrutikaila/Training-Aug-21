using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class Doctors
    {
        public Doctors()
        {
            MedicalPrescription = new HashSet<MedicalPrescription>();
            Treatment = new HashSet<Treatment>();
        }
        [Key]
        public int DrId { get; set; }
        [Required]
        public string DrName { get; set; }
        public byte? DrAge { get; set; }
        public string DrGender { get; set; }

        public virtual ICollection<MedicalPrescription> MedicalPrescription { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
