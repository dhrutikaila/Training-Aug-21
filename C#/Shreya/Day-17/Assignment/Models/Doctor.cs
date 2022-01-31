using System;
using System.Collections.Generic;

#nullable disable

namespace Day_17Assignment.Models
{
    public partial class Doctor
    {
        public Doctor()
        {
            DrugsSchedules = new HashSet<DrugsSchedule>();
            TreatMents = new HashSet<TreatMent>();
        }

        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Department Department { get; set; }
        public virtual ICollection<DrugsSchedule> DrugsSchedules { get; set; }
        public virtual ICollection<TreatMent> TreatMents { get; set; }
    }
}
