using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class Patient
    {
        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public int? DepartmentId { get; set; }
        public int? AssistanceId { get; set; }

        public virtual Assistance Assistance { get; set; }
        public virtual Department Department { get; set; }
    }
}
