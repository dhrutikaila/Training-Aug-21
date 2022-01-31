using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class MedicineTime
    {
        public int MedicineTimeId { get; set; }
        public int MedicineId { get; set; }
        public string MedicineTake { get; set; }
        public bool? InMorning { get; set; }
        public bool? InNoon { get; set; }
        public bool? InNight { get; set; }

        public virtual Medicines Medicine { get; set; }
    }
}
