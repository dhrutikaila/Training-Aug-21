using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class HealthcareAssistances
    {
        public HealthcareAssistances()
        {
            Treatment = new HashSet<Treatment>();
        }

        public int AsstId { get; set; }
        public string AsstName { get; set; }
        public byte? AsstAge { get; set; }
        public string AsstGender { get; set; }

        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
