using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyProject1.Models
{
    class Purchase
    {
        public int PurchaseId { get; set; }
        public int Quantity { get; set; }

        //navigation props


        public int OrderId { get; set; }
        public Order Order { get; set; }


        public int ToysId { get; set; }
        public Toy Toy { get; set; }



    }
}
