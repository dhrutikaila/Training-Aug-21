using System;
using System.Collections.Generic;

#nullable disable

namespace Hospital_Mange.Models
{
    public partial class Drug
    {
        public Drug()
        {
            PatientTakesMedicine = new HashSet<PatientTakesMedicine>();
        }

        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public short Mg { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<PatientTakesMedicine> PatientTakesMedicine { get; set; }
    }
}
