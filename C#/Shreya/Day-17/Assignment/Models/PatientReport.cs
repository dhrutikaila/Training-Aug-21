using System;
using System.Collections.Generic;

#nullable disable

namespace Day_17Assignment.Models
{
    public partial class PatientReport
    {
        public string PatientName { get; set; }
        public string DoctorName { get; set; }
        public DateTime? DateOfTreatment { get; set; }
        public string DepartmentName { get; set; }
        public string DrugName { get; set; }
        public string Parts { get; set; }
    }
}
