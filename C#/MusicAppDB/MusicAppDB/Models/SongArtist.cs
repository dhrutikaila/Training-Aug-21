using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class SongArtist
    {
        public int SongId { get; set; }
        public int UserId { get; set; }

        public virtual Song Song { get; set; }
        public virtual Users User { get; set; }
    }
}
