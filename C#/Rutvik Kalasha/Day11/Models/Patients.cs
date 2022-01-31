using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class Patients
    {
        public Patients()
        {
            PatientTakesMedicine = new HashSet<PatientTakesMedicine>();
            Treatment = new HashSet<Treatment>();
        }

        public int PatientId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public int City { get; set; }
        public decimal? ContactNo { get; set; }
        public bool? IsActive { get; set; }

        public virtual City CityNavigation { get; set; }
        public virtual ICollection<PatientTakesMedicine> PatientTakesMedicine { get; set; }
        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}