using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace HospitalAuthenticationTask.Models
{
    public partial class DayParts
    {
        public DayParts()
        {
            Medications = new HashSet<Medications>();
        }

        public int Id { get; set; }
        public string PartName { get; set; }

        public virtual ICollection<Medications> Medications { get; set; }
    }
}
