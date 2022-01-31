using System;
using System.Collections.Generic;



namespace ZomatoApp.Models
{
    public partial class Cart
    {
        public int CartId { get; set; }
        public int ProductId { get; set; }
        public int ProductQuantity { get; set; }
        public string ProductName { get; set; }
        public int ProductPrice { get; set; }
        public int UserId { get; set; }
    }
}
