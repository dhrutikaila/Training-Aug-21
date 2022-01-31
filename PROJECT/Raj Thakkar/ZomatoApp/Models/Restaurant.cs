using System;
using System.Collections.Generic;


namespace ZomatoApp.Models
{
    public partial class Restaurant
    {
        public Restaurant(){
        Products = new HashSet<Product>();
            }
        public int RestaurantId { get; set; }
        public string RestaurantName { get; set; }
        public string RestaurantCity { get; set; }
        public decimal RestFoodPricetwoperson { get; set; }
        public string RestorentImage { get; set; }
        public int? Offer1id { get; set; }
        public int? Offer2id { get; set; }
        public int? Payment1id { get; set; }
        public int? Payment2id { get; set; }
        public string Restaurantfoodtype { get; set; }
        public  ICollection<Product> Products { get; set; }
    }
}
