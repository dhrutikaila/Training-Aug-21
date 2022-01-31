using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class Treatment
    {
        [Key]
        public int TrtId { get; set; }
        [Required]
        public int DeptId { get; set; }
        [Required]
        public int PtId { get; set; }
        [Required]
        public int DrId { get; set; }
        [Required]
        public int AsstId { get; set; }

        public virtual HealthcareAssistances Asst { get; set; }
        public virtual Departments Dept { get; set; }
        public virtual Doctors Dr { get; set; }
        public virtual Patients Pt { get; set; }
    }
}
