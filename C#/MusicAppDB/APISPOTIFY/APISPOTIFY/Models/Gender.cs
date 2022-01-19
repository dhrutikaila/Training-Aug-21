using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Gender
    {
        public Gender()
        {
            Profiles = new HashSet<Profile>();
        }

        public int GenderId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Profile> Profiles { get; set; }
    }
}
