
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ToyShop.Models
{
 public   class Order
    {
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }

        public int TotalAmount { get; set; }

        public int DiscountAmount { get; set; }

        public int NetAmount { get; set; }

        public int CustomerId { get; set; }
        public Customer Customer { get; set; }

        public ICollection<Item> OrderItems { get; set; }
    }
}