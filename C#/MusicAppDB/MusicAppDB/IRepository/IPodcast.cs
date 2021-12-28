using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
 public   interface IPodcast
    {
        List<Podcast> Getpodcasts();
        Podcast Getpodcast(int id);
        Podcast Addpodcast(Podcast song);
        void Deletepodcast(Podcast song);
        Podcast Editpodcast(Podcast song);
    }
}
