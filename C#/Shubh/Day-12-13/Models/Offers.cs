using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day12.ToyModels
{
    public class Offers
    {
        [Key]
        public int OfferId { get; set; }
        public decimal Percentage { get; set; }
        public Orders Orders { get; set; }
    }
}
