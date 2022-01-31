using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class Departments
    {
        public Departments()
        {
            Doctors = new HashSet<Doctors>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Doctors> Doctors { get; set; }
    }
}