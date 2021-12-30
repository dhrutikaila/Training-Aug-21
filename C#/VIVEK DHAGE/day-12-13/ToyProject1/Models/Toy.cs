using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyProject1.Models
{
    class Toy
    {
        public int ToyId{ get; set; }
        public string ToyName { get; set; }
        public int ToyPrice { get; set; }
        public string ToyType { get; set; }


        //navigation prop

        public Purchase Purchase { get; set; }

        public ICollection<Plant> Plants{ get; set; }
        public ICollection<Order> Orders { get; set; }

    }
}
