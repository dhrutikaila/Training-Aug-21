using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class Assistant
    {
        public int AssistantId { get; set; }
        public string AssistantFirstName { get; set; }
        public string AssistantLastName { get; set; }
        public int? AssistDoctorId { get; set; }
        public int? AssistDepartmentId { get; set; }
        public bool? IsActive { get; set; }

        public virtual Department AssistDepartment { get; set; }
        public virtual Doctor AssistDoctor { get; set; }
    }
}
