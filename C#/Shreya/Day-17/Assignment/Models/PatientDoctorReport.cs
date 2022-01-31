using System;
using System.Collections.Generic;

#nullable disable

namespace Day_17Assignment.Models
{
    public partial class PatientDoctorReport
    {
        public string PatientName { get; set; }
        public string DoctorName { get; set; }
        public DateTime? DateOfTreatment { get; set; }
        public string DepartmentName { get; set; }
    }
}
