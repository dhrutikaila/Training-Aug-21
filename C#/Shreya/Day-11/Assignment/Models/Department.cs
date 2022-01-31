using System;
using System.Collections.Generic;

#nullable disable

namespace Day_10.Models
{
    public partial class Department
    {
        public Department()
        {
            Assistances = new HashSet<Assistance>();
            Doctors = new HashSet<Doctor>();
            Patients = new HashSet<Patient>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        public virtual ICollection<Assistance> Assistances { get; set; }
        public virtual ICollection<Doctor> Doctors { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
