using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace HospitalAuthenticationTask.Models
{
    public partial class Departments
    {
        public Departments()
        {
            Assistants = new HashSet<Assistants>();
            Doctors = new HashSet<Doctors>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        public virtual ICollection<Assistants> Assistants { get; set; }
        public virtual ICollection<Doctors> Doctors { get; set; }
    }
}
