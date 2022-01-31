using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class Doctor
    {
        public Doctor()
        {
            Assistant = new HashSet<Assistant>();
            Treatment = new HashSet<Treatment>();
        }

        public int DoctorId { get; set; }
        public string DoctorFirstName { get; set; }
        public string DoctorLastName { get; set; }
        public int? DocDepartmentId { get; set; }
        public bool? IsActive { get; set; }

        public virtual Department DocDepartment { get; set; }
        public virtual ICollection<Assistant> Assistant { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
