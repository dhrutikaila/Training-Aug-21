using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Genre
    {
        public Genre()
        {
            SongGenres = new HashSet<SongGenre>();
        }

        public int GenreId { get; set; }
        public string Genre1 { get; set; }

        public virtual ICollection<SongGenre> SongGenres { get; set; }
    }
}
