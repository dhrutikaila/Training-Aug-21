using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace HospitalAuthenticationTask.Models
{
    public partial class Medications
    {
        public int Id { get; set; }
        public int? PrescribeId { get; set; }
        public int? DrugId { get; set; }
        public int Qunatity { get; set; }
        public int? DayPartId { get; set; }

        public virtual DayParts DayPart { get; set; }
        public virtual Drugs Drug { get; set; }
        public virtual Prescribes Prescribe { get; set; }
    }
}
