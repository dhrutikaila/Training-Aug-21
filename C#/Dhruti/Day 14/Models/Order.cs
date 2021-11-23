
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ToyShop.Models
{
    class Order
    {
        public int orderId { get; set; }
        public int addressId { get; set; }
        public CustomerAddress CustomerAddressNavigation { get; set; }
        public ICollection<Item> ItemNavigation { get; set; }
        public bool isActive { get; set; }
    }
}