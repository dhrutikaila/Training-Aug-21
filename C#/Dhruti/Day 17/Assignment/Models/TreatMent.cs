using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Doctor_Api.Models
{
    public partial class Treatment
    {
        public int TrtId { get; set; }
        public DateTime TrtDate { get; set; }
        public int DeptId { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }

        public virtual Department Dept { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
