using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Models
{
    public partial class VSong
    {
        public int SongID { get; set; }
        public string Name { get; set; }
        public string Region { get; set; }
        public int RegionId { get; set; }
    }
}
