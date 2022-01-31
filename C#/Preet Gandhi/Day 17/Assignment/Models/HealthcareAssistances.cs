using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class HealthcareAssistances
    {
        public HealthcareAssistances()
        {
            Treatment = new HashSet<Treatment>();
        }

        [Key]
        public int AsstId { get; set; }
        [Required]
        public string AsstName { get; set; }
        public byte? AsstAge { get; set; }
        public string AsstGender { get; set; }

        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
