using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class Users
    {
        public Users()
        {
           // Roles = new HashSet<Role>();
            AlbumLikes = new HashSet<AlbumLike>();
            Albums = new HashSet<Album>();
            Payments = new HashSet<PaymentMethod>();
            Playlists = new HashSet<Playlist>();
            PodcastLikes = new HashSet<PodcastLike>();
            Podcasts = new HashSet<Podcast>();
            SongArtists = new HashSet<SongArtist>();
            SongLikes = new HashSet<SongLike>();
            Subscriptions = new HashSet<Subscription>();
            UserLanguages = new HashSet<UserLanguage>();
        }

        public int UserId { get; set; }
        public int RoleId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool? Active { get; set; }
        public bool IsVerfied { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public DateTime? DeletedOn { get; set; }

       
        public virtual Profile Profile { get; set; }
        public virtual ICollection<AlbumLike> AlbumLikes { get; set; }
        public virtual ICollection<Album> Albums { get; set; }
        public virtual ICollection<PaymentMethod> Payments { get; set; }
        public virtual ICollection<Playlist> Playlists { get; set; }
        public virtual ICollection<PodcastLike> PodcastLikes { get; set; }
        public virtual ICollection<Podcast> Podcasts { get; set; }
        public virtual ICollection<SongArtist> SongArtists { get; set; }
        public virtual ICollection<SongLike> SongLikes { get; set; }
        public virtual ICollection<Subscription> Subscriptions { get; set; }
        public virtual ICollection<UserLanguage> UserLanguages { get; set; }
        public object Role { get; internal set; }
        // public virtual ICollection<Role> Roles { get; set; }
    }
}
