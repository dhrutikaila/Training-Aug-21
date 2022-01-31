using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Day12_13.Models
{
    class Plant
    {
        [Key]
        public int PlantId { get; set; }
        public string PlantPlace { get; set; }

    }
}
