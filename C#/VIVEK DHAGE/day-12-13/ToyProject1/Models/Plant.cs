using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyProject1.Models
{
    class Plant
    {
        public int PlantId { get; set; }
        public string PlantName { get; set; }
        public string PlantAddress { get; set; }
        public int PlantPincode { get; set; }


        //Navigation props
        

        public  ICollection<Toy> Toys { get; set; }
    }
}
