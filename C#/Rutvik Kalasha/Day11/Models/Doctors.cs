using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class Doctors
    {
        public Doctors()
        {
            Assistants = new HashSet<Assistants>();
            Treatment = new HashSet<Treatment>();
        }

        public int DoctorId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Designation { get; set; }
        public decimal YearsOfExperience { get; set; }
        public int? Department { get; set; }
        public bool? IsActive { get; set; }

        public virtual Departments DepartmentNavigation { get; set; }
        public virtual ICollection<Assistants> Assistants { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}