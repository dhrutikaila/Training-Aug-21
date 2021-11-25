using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
    class Customer
    {
        public int customerId { get; set; }
        public int Age { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public int phoneNumber { get; set; }
        public bool isActive { get; set; }
        public ICollection<CustomerAddress> AddressNavigation { get; set; }

    }
}