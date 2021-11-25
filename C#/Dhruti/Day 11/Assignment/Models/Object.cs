
using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Hospital_Mange.Models
{
    public partial class Object
    {
        public int ObjId { get; set; }
        public int TypeId { get; set; }
        public string ObjName { get; set; }

        public virtual ObjectMaster Type { get; set; }
    }
}




   
