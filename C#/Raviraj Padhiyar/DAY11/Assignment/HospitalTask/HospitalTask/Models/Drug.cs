using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalTask.Models
{
    public partial class Drug
    {
        public Drug()
        {
            Medications = new HashSet<Medication>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Medication> Medications { get; set; }
    }
}
