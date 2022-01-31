using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class Treatment
    {
        public int TrtId { get; set; }
        public int DeptId { get; set; }
        public int PtId { get; set; }
        public int DrId { get; set; }
        public int AsstId { get; set; }

        public virtual HealthcareAssistances Asst { get; set; }
        public virtual Departments Dept { get; set; }
        public virtual Doctors Dr { get; set; }
        public virtual Patients Pt { get; set; }
    }
}
