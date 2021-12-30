using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyProject1.Models
{
    class Customer
    {
        public int CustomerId { get; set; }
        public string Name  { get; set; }
        public int MobileNumber{ get; set; }

        //Navigation properties

        public  ICollection<Address> Addresses { get; set; }
        public ICollection<Order> Orders{ get; set; }


    }
}
