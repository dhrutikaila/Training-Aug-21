using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Country
    {
        public Country()
        {
            Profiles = new HashSet<Profile>();
        }

        public int CountryId { get; set; }
        public string CountryName { get; set; }

        public virtual ICollection<Profile> Profiles { get; set; }
    }
}
