using System;
using System.Collections.Generic;

#nullable disable

namespace Day_17Assignment.Models
{
    public partial class Department
    {
        public Department()
        {
            Assistances = new HashSet<Assistance>();
            Doctors = new HashSet<Doctor>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        public virtual ICollection<Assistance> Assistances { get; set; }
        public virtual ICollection<Doctor> Doctors { get; set; }
    }
}
