using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class Departments
    {
        public Departments()
        {
            Treatment = new HashSet<Treatment>();
        }
        [Key]
        public int DeptId { get; set; }
        [Required]
        public string DeptName { get; set; }

        public virtual ICollection<Treatment> Treatment { get; set; }
    }
}
