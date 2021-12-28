using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class SongGenre
    {
        public int SongId { get; set; }
        public int GenreId { get; set; }

        public virtual Genres Genres { get; set; }
        public virtual Song Song { get; set; }
       
        
    }
}
