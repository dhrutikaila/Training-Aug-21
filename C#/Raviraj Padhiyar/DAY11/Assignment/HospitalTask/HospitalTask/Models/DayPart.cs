using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalTask.Models
{
    public partial class DayPart
    {
        public DayPart()
        {
            Medications = new HashSet<Medication>();
        }

        public int Id { get; set; }
        public string PartName { get; set; }

        public virtual ICollection<Medication> Medications { get; set; }
    }
}
