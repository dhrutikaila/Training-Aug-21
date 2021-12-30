using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalProject_Console.Models
{
    public partial class Department
    {
        public Department()
        {
            Assistants = new HashSet<Assistant>();
            Doctors = new HashSet<Doctor>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        public virtual ICollection<Assistant> Assistants { get; set; }
        public virtual ICollection<Doctor> Doctors { get; set; }
    }
}
