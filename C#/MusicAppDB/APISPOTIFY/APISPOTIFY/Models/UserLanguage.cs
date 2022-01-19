using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class UserLanguage
    {
        public int UserId { get; set; }
        public int LanguageId { get; set; }

        public virtual Language Language { get; set; }
        public virtual User User { get; set; }
    }
}
