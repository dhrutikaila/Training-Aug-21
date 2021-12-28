using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class Language
    {
        public Language()
        {
            Podcasts = new HashSet<Podcast>();
            Songs = new HashSet<Song>();
            UserLanguages = new HashSet<UserLanguage>();
        }

        public int LanguageId { get; set; }
        public string LanguageName { get; set; }

        public virtual ICollection<Podcast> Podcasts { get; set; }
        public virtual ICollection<Song> Songs { get; set; }
        public virtual ICollection<UserLanguage> UserLanguages { get; set; }
    }
}
