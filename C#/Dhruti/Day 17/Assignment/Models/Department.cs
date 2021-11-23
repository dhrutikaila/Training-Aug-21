using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Hospital_Mange.Models
{ 
public partial class Departments
{
    public Departments()
    {
        Doctors = new HashSet<Doctors>();
    }

    public int DepartmentId { get; set; }
    public string DepartmentName { get; set; }
    public bool? IsActive { get; set; }

    public virtual ICollection<Doctors> Doctors { get; set; }
}
}