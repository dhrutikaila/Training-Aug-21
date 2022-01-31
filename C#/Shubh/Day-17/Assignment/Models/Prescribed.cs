using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class Prescribed
    {
        public int PrescribedId { get; set; }
        public string MedicineTimeId { get; set; }
        public DateTime PrescibedDate { get; set; }
        public int TreatmentId { get; set; }
        public bool? IsActive { get; set; }

        public virtual Treatment Treatment { get; set; }
    }
}
