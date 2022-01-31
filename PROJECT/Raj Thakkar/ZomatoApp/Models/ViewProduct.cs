using System;
using System.Collections.Generic;



namespace ZomatoApp.Models
{
    public partial class ViewProduct
    {
        public int RestaurantId { get; set; }
        public string RestaurantName { get; set; }
        public string ProductName { get; set; }
        public decimal? ProductPrice { get; set; }
    }
}
