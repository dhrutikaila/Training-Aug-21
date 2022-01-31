﻿using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplicationAssignmentDay17.Models
{
    public partial class Department
    {
        public Department()
        {
            Doctors = new HashSet<Doctor>();
        }

        public int DeptId { get; set; }
        public string DeptName { get; set; }

        public virtual ICollection<Doctor> Doctors { get; set; }
    }
}
