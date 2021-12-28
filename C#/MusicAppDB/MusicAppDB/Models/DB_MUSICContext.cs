using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class DB_MUSICContext : DbContext
    {
        public DB_MUSICContext()
        {
        }

        public DB_MUSICContext(DbContextOptions<DB_MUSICContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Album> Albums { get; set; }
        public virtual DbSet<AlbumLike> AlbumLikes { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<Genres> Genres { get; set; }
        public virtual DbSet<SongGenre> SongGenres { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }
        public virtual DbSet<Plan> Plans { get; set; }
        public virtual DbSet<Playlist> Playlists { get; set; }
        public virtual DbSet<PlaylistPodcast> PlaylistPodcasts { get; set; }
        public virtual DbSet<PlaylistSong> PlaylistSongs { get; set; }
        public virtual DbSet<Podcast> Podcasts { get; set; }
        public virtual DbSet<PodcastLike> PodcastLikes { get; set; }
        public virtual DbSet<Profile> Profiles { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Song> Songs { get; set; }
        public virtual DbSet<SongArtist> SongArtists { get; set; }
     
        public virtual DbSet<SongLike> SongLikes { get; set; }
        public virtual DbSet<Subscription> Subscriptions { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserLanguage> UserLanguages { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning  To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer(@"Server=pc0474\\mssql2017;Database=DB_MUSIC;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Latin1_General_CI_AS");

            modelBuilder.Entity<Album>(entity =>
            {
                entity.Property(e => e.AlbumId).HasColumnName("AlbumID");

                entity.Property(e => e.Active).HasDefaultValueSql("((1))");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("CreatedON")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeletedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("DeletedON");

                entity.Property(e => e.Description).HasMaxLength(100);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.Picture)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.Premium).HasDefaultValueSql("((0))");

                entity.Property(e => e.UpdatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("UpdatedON");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Albums)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Users_Albums");
            });

            modelBuilder.Entity<AlbumLike>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.AlbumId });

                entity.ToTable("AlbumLike");

                entity.Property(e => e.AlbumId).HasColumnName("AlbumID");

                entity.HasOne(d => d.Album)
                    .WithMany(p => p.AlbumLikes)
                    .HasForeignKey(d => d.AlbumId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Albums_AlbumLike");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AlbumLikes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_AlbumLike");
            });

            modelBuilder.Entity<Country>(entity =>
            {
                entity.HasIndex(e => e.CountryName, "UQ_Countries_CountryName")
                    .IsUnique();

                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.CountryName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Gender>(entity =>
            {
                entity.ToTable("Gender");

                entity.Property(e => e.GenderId).HasColumnName("GenderID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(6)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SongGenre>(entity =>
            {
                entity.Property(e => e.Genres).IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Genre");
            });

            modelBuilder.Entity<Language>(entity =>
            {
                entity.HasIndex(e => e.LanguageName, "UQ_Languages_LanguageName")
                    .IsUnique();

                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.LanguageName)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            
            modelBuilder.Entity<PaymentMethod>(entity =>
            {
                entity.Property(e => e.PaymentMethodId).HasColumnName("PaymentMethodID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Plan>(entity =>
            {
                entity.Property(e => e.PlanId).HasColumnName("PlanID");

                entity.Property(e => e.PlanName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PricePerMonth).HasColumnType("money");
            });

            modelBuilder.Entity<Playlist>(entity =>
            {
                entity.Property(e => e.PlaylistId).HasColumnName("PlaylistID");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("CreatedON")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.UpdatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("UpdatedON");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Playlists)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Users_Playlists");
            });

            modelBuilder.Entity<PlaylistPodcast>(entity =>
            {
                entity.HasKey(e => new { e.PlaylistId, e.PodcastId });

                entity.Property(e => e.PlaylistId).HasColumnName("PlaylistID");

                entity.Property(e => e.PodcastId).HasColumnName("PodcastID");

                entity.HasOne(d => d.Playlist)
                    .WithMany(p => p.PlaylistPodcasts)
                    .HasForeignKey(d => d.PlaylistId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Playlists_PlaylistPodcasts");

                entity.HasOne(d => d.Podcast)
                    .WithMany(p => p.PlaylistPodcasts)
                    .HasForeignKey(d => d.PodcastId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Podcasts_PlaylistPodcasts");
            });

            modelBuilder.Entity<PlaylistSong>(entity =>
            {
                entity.HasKey(e => new { e.PlaylistId, e.SongId });

                entity.Property(e => e.PlaylistId).HasColumnName("PlaylistID");

                entity.Property(e => e.SongId).HasColumnName("SongID");

                entity.HasOne(d => d.Playlist)
                    .WithMany(p => p.PlaylistSongs)
                    .HasForeignKey(d => d.PlaylistId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Playlists_PlaylistSongs");

                entity.HasOne(d => d.Song)
                    .WithMany(p => p.PlaylistSongs)
                    .HasForeignKey(d => d.SongId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Songs_PlaylistSongs");
            });

            modelBuilder.Entity<Podcast>(entity =>
            {
                entity.Property(e => e.PodcastId).HasColumnName("PodcastID");

                entity.Property(e => e.Active).HasDefaultValueSql("((1))");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("CreatedON")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeletedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("DeletedON");

                entity.Property(e => e.Duration).HasColumnType("decimal(6, 2)");

                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PodcastFile)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.Premium).HasDefaultValueSql("((0))");

                entity.Property(e => e.StreamedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("StreamedON");

                entity.Property(e => e.UpdatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("UpdatedON");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Language)
                    .WithMany(p => p.Podcasts)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_Languages_Podcasts");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Podcasts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Users_Podcasts");
            });

            modelBuilder.Entity<PodcastLike>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.PodcastId });

                entity.ToTable("PodcastLike");

                entity.Property(e => e.PodcastId).HasColumnName("PodcastID");

                entity.HasOne(d => d.Podcast)
                    .WithMany(p => p.PodcastLikes)
                    .HasForeignKey(d => d.PodcastId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Podcasts_PodcastLike");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.PodcastLikes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_PodcastLike");
            });

            modelBuilder.Entity<Profile>(entity =>
            {
                entity.ToTable("Profile");

                entity.HasIndex(e => e.UserId, "UQ_Profile_UserID")
                    .IsUnique();

                entity.Property(e => e.ProfileId).HasColumnName("ProfileID");

                entity.Property(e => e.Bio).HasColumnType("text");

                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("CreatedON")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeletedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("DeletedON");

                entity.Property(e => e.Dob)
                    .HasColumnType("date")
                    .HasColumnName("DOB");

                entity.Property(e => e.GenderId).HasColumnName("GenderID");

                entity.Property(e => e.Picture).HasColumnType("text");

                entity.Property(e => e.UpdatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("UpdatedON");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Profiles)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_Countries_Profile");

                entity.HasOne(d => d.Gender)
                    .WithMany(p => p.Profiles)
                    .HasForeignKey(d => d.GenderId)
                    .HasConstraintName("FK_Gender_Profile");

                entity.HasOne(d => d.User)
                    .WithOne(p => p.Profile)
                    .HasForeignKey<Profile>(d => d.UserId)
                    .HasConstraintName("FK_Users_Profile");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.RoleType)
                    .IsRequired()
                    .HasMaxLength(6)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Song>(entity =>
            {
                entity.Property(e => e.SongID).HasColumnName("SongID");

                entity.Property(e => e.Active).HasDefaultValueSql("((1))");

                entity.Property(e => e.AlbumId).HasColumnName("AlbumID");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("CreatedON")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeletedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("DeletedON");

                entity.Property(e => e.Duration).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Picture)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.PublishedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("PublishedON");

                entity.Property(e => e.SongFile)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.UpdatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("UpdatedON");

                entity.HasOne(d => d.Album)
                    .WithMany(p => p.Songs)
                    .HasForeignKey(d => d.AlbumId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Albums_Songs");

                entity.HasOne(d => d.Language)
                    .WithMany(p => p.Songs)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_Languages_Songs");
            });

            modelBuilder.Entity<SongArtist>(entity =>
            {
                entity.HasKey(e => new { e.SongId, e.UserId });

                entity.Property(e => e.SongId).HasColumnName("SongID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Song)
                    .WithMany(p => p.SongArtists)
                    .HasForeignKey(d => d.SongId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Songs_SongArtists");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.SongArtists)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_SongArtists");
            });

            modelBuilder.Entity<SongGenre>(entity =>
            {
                entity.HasKey(e => new { e.SongId, e.GenreId });

                entity.Property(e => e.SongId).HasColumnName("SongID");

               
                entity.HasOne(d => d.Song)
                    .WithMany(p => p.SongGenres)
                    .HasForeignKey(d => d.SongId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Songs_SongGenres");
            });

            modelBuilder.Entity<SongLike>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.SongId });

                entity.ToTable("SongLike");

                entity.Property(e => e.SongId).HasColumnName("SongID");

                entity.HasOne(d => d.Song)
                    .WithMany(p => p.SongLikes)
                    .HasForeignKey(d => d.SongId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Songs_SongLike");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.SongLikes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_SongLike");
            });

            modelBuilder.Entity<Subscription>(entity =>
            {
                entity.ToTable("Subscription");

                entity.Property(e => e.SubscriptionId).HasColumnName("SubscriptionID");

                entity.Property(e => e.EndTimeStamp)
                    .HasColumnType("datetime")
                    .HasComputedColumnSql("(dateadd(month,[Months],[StartTimestamp]))", false);

                entity.Property(e => e.Months).HasDefaultValueSql("((1))");

                entity.Property(e => e.StartTimestamp)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Plan)
                    .WithMany(p => p.Subscriptions)
                    .HasForeignKey(d => d.PlanId)
                    .HasConstraintName("FK_Plans_Subscription");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Subscriptions)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Users_Subscription");
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.HasIndex(e => e.Email, "UQ_Users_Email")
                    .IsUnique();

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.Property(e => e.Active)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("CreatedON")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeletedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("DeletedON");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.UpdatedOn)
                    .HasColumnType("datetime")
                    .HasColumnName("UpdatedON");

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

            });

            modelBuilder.Entity<UserLanguage>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LanguageId });

                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.HasOne(d => d.Language)
                    .WithMany(p => p.UserLanguages)
                    .HasForeignKey(d => d.LanguageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Languages_UserLanguages");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserLanguages)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_UserLanguages");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
