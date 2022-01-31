using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class MedicalPrescription
    {
        [Key]
        public int PresId { get; set; }
        [Required]
        public int PtId { get; set; }
        [Required]
        public int DrId { get; set; }
        [Required]
        public int DrugId { get; set; }
        [Required]
        public int DayPartId { get; set; }

        public virtual DayParts DayPart { get; set; }
        public virtual Doctors Dr { get; set; }
        public virtual Drugs Drug { get; set; }
        public virtual Patients Pt { get; set; }
    }
}
