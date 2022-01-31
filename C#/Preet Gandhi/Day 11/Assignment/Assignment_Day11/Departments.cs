using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_11.Assignment_Day11
{
    public partial class Departments
    {
        public Departments()
        {
            Treatment = new HashSet<Treatment>();
        }

        public int DeptId { get; set; }
        public string DeptName { get; set; }

        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
