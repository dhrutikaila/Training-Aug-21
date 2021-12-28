using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class UserLanguage
    {
        public int UserId { get; set; }
        public int LanguageId { get; set; }

        public virtual Language Language { get; set; }
        public virtual Users User { get; set; }
    }
}
