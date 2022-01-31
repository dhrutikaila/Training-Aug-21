using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class States
    {
        public States()
        {
            City = new HashSet<City>();
        }

        public int StateId { get; set; }
        public string StateName { get; set; }

        public virtual ICollection<City> City { get; set; }
    }
}