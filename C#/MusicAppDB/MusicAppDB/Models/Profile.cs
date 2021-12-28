using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class Profile
    {
        public int ProfileId { get; set; }
        public int UserId { get; set; }
        public DateTime? Dob { get; set; }
        public string Bio { get; set; }
        public string Picture { get; set; }
        public int? GenderId { get; set; }
        public int? CountryId { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public DateTime? DeletedOn { get; set; }

        public virtual Country Country { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual Users User { get; set; }
    }
}
