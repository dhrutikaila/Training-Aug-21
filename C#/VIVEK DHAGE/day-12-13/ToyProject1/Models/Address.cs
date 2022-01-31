using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyProject1.Models
{
    class Address
    {
        public int AddressId { get; set; }
        public string AddressLine { get; set; }
        public string City { get; set; }
        public int Pincode { get; set; }
        public string  State { get; set; }

        //navigation property

        public Order Order { get; set; }



    }
}
