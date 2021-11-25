using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
    class CustomerAddress
    {
        public int addressId { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public int customerId { get; set; }
        public Customer CustomerNavigation { get; set; }
        public ICollection<Order> OrderNavigation { get; set; }
        public bool isActive { get; set; }


    }
}

