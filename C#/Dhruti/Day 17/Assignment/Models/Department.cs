using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Doctor_Api.Models
{
    public partial class Department
    {
        public Department()
        {
            HealthcareAssistants = new HashSet<Assistance>();
            Treatments = new HashSet<Treatment>();
        }

        public int DeptId { get; set; }
        public string DeptName { get; set; }

        public virtual ICollection<Assistance> HealthcareAssistants { get; set; }
        public virtual ICollection<Treatment> Treatments { get; set; }
    }
}