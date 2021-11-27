using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
    class Item
    {
        public int OrderId { get; set; }

        public Order Order { get; set; }

        public int ToyId { get; set; }

        public Toy Toy { get; set; }

        public byte Quantity { get; set; }
    }
}
