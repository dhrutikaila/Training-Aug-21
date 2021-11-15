using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
   
   
        class ToyPlant
        {
            public int plantId { get; set; }
            public string plantName { get; set; }
            public string plantCity { get; set; }
            public int toyTypeId { get; set; }
            public ToyType ToyTypeNavigation { get; set; }
            public ICollection<Toy> ToyNavigation { get; set; }
            public bool isActive { get; set; }
        }
    
}
