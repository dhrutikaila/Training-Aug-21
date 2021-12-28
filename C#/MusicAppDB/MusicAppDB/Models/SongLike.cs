using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class SongLike
    {
        public int UserId { get; set; }
        public int SongId { get; set; }

        public virtual Song Song { get; set; }
        public virtual Users User { get; set; }
    }
}
