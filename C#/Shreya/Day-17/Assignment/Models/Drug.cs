using System;
using System.Collections.Generic;

#nullable disable

namespace Day_17Assignment.Models
{
    public partial class Drug
    {
        public Drug()
        {
            DrugsSchedules = new HashSet<DrugsSchedule>();
        }

        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public string Parts { get; set; }

        public virtual ICollection<DrugsSchedule> DrugsSchedules { get; set; }
    }
}
