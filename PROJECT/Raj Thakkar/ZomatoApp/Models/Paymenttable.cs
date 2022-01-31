using System;
using System.Collections.Generic;



namespace ZomatoApp.Models
{
    public partial class Paymenttable
    {
        public int Payid { get; set; }
        public string Cardnumber { get; set; }
        public string Cardcvv { get; set; }
        public string CardName { get; set; }
        public int Userid { get; set; }
        public int Orderid { get; set; }

        //public virtual Ordertable Order { get; set; }
        //public virtual UserSignup User { get; set; }
    }
}
