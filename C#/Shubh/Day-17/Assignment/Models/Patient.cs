using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class Patient
    {
        public Patient()
        {
            Treatment = new HashSet<Treatment>();
        }

        public int PatientId { get; set; }
        public string PatientFirstName { get; set; }
        public string PatientLastName { get; set; }
        public DateTime Dob { get; set; }
        public int MobileNo { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
