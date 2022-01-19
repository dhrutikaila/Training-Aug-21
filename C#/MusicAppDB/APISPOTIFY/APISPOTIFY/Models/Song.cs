using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Song
    {
        public Song()
        {
            PlaylistSongs = new HashSet<PlaylistSong>();
            SongArtists = new HashSet<SongArtist>();
            SongGenres = new HashSet<SongGenre>();
            SongLikes = new HashSet<SongLike>();
        }

        public int SongId { get; set; }
        public int? AlbumId { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public int LanguageId { get; set; }
        public string SongFile { get; set; }
        public decimal Duration { get; set; }
        public DateTime? PublishedOn { get; set; }
        public bool? Active { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int ViewCount { get; set; }
        public int Downloads { get; set; }

        public virtual Album Album { get; set; }
        public virtual Language Language { get; set; }
        public virtual ICollection<PlaylistSong> PlaylistSongs { get; set; }
        public virtual ICollection<SongArtist> SongArtists { get; set; }
        public virtual ICollection<SongGenre> SongGenres { get; set; }
        public virtual ICollection<SongLike> SongLikes { get; set; }
    }
}
