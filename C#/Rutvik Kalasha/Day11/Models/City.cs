using System;
using System.Collections.Generic;

namespace AssignmentsDay11.Models
{
    public partial class City
    {
        public City()
        {
            Patients = new HashSet<Patients>();
        }

        public int CityId { get; set; }
        public string CityName { get; set; }
        public int? StateId { get; set; }

        public virtual States State { get; set; }
        public virtual ICollection<Patients> Patients { get; set; }
    }
}