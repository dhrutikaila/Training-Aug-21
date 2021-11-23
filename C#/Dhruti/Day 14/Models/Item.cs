using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
    class Item
    {
        public int itemId { get; set; }
        public int quantity { get; set; }
        public int toyId { get; set; }
        public Toy ToyNavigation { get; set; }
        public int orderId { get; set; }
        public Order OrderNavigation { get; set; }
        public bool isActive { get; set; }

    }
}
