using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyProject1.Models
{
    class Order
    {
        public int OrderId { get; set; }
        public int Amount { get; set; }
        public int Discount { get; set; }
        public int NetAmount { get; set; }


        //navigation props

        public int AddressId { get; set; }
        public Address Address { get; set; }
        

        public  ICollection<Toy> Toys { get; set; }

        public Purchase Purchase { get; set; }


    }
}
