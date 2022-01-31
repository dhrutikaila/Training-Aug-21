using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class Plant
    {

        [Key]
        public int PlantId { get; set; }
        public string PlantPlace { get; set; }
    }
}
