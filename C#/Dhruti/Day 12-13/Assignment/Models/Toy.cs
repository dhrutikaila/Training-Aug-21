using System;
using System.Collections.Generic;


namespace ToyShop.Models
{

    class Toy
    {
        public int toyId { get; set; }
        public string toyName { get; set; }
        public double toyPrice { get; set; }
        public int ToyPlantId { get; set; }
        public ToyPlant ToyPlantNavigation { get; set; }
        public ICollection<Item> ItemNavigation { get; set; }
        public bool isActive { get; set; }

    }
}
