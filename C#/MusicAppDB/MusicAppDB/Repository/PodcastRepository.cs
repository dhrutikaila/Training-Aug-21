using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Repository
{
    public class PodcastRepository : IPodcast

    {

        private List<Podcast> Podcasts = new List<Podcast>()
        {
          new Podcast()
          {

              PodcastFile="khuda hai kaha he tu"
          }

        };
        public Podcast Addpodcast(Podcast song)
        {
            //song.SongID = int.Parse(Console.ReadLine());
            Podcasts.Add(song);
            return song;
        }

        public void Deletepodcast(Podcast song)
        {
            Podcasts.Remove(song);
        }

        public Podcast Editpodcast(Podcast song)
        {
            var existingSong = Getpodcast(song.PodcastId);
            existingSong.Name = song.Name;
            return existingSong;
        }

        public Podcast Getpodcast(int id)
        {
            return Podcasts.SingleOrDefault(x => x.PodcastId == id);
        }

        public List<Podcast> Getpodcasts()
        {
            return Podcasts;
            //throw new NotImplementedException();
        }
    }
}
