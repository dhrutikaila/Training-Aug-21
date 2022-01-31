using System;
using System.Collections.Generic;



namespace ZomatoApp.Models
{
    public partial class Category
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public int ResId { get; set; }
        public string ResName { get; set; }
    }
}
