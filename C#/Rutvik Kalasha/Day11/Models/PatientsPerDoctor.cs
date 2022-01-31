using System;
using System.Collections.Generic;


namespace AssignmentsDay11.Models
{
    public partial class PatientsPerDoctor
    {
        public int DoctorId { get; set; }
        public string DrName { get; set; }
        public string PatientName { get; set; }
    }
}