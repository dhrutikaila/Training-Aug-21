using System;
using System.Collections.Generic;



namespace ZomatoApp.Models
{
    public partial class OrderStatus
    {
        public OrderStatus()
        {
            //Ordertables = new HashSet<Ordertable>();
        }

        public int Orderstatusid { get; set; }
        public string Orderstauts { get; set; }

        //public virtual ICollection<Ordertable> Ordertables { get; set; }
    }
}
