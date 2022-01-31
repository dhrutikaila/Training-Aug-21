using System;
using System.Collections.Generic;

#nullable disable

namespace Day17_1.Models
{
    public partial class Drug
    {
        public Drug()
        {
            Prescribes = new HashSet<Prescribe>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Prescribe> Prescribes { get; set; }
    }
}
