using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class Medicines
    {
        public Medicines()
        {
            MedicineTime = new HashSet<MedicineTime>();
        }

        public int MedicineId { get; set; }
        public string MedicineName { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<MedicineTime> MedicineTime { get; set; }
    }
}
