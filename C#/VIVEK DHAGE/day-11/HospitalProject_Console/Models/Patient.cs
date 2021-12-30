using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalProject_Console.Models
{
    public partial class Patient
    {
        public Patient()
        {
            Prescribes = new HashSet<Prescribe>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public virtual ICollection<Prescribe> Prescribes { get; set; }
    }
}
