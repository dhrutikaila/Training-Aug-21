using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public int? UserId { get; set; }
        public User User { get; set; }
        [Required(ErrorMessage = "Order date is required")]
        public DateTime OrderDate { get; set; }
        public Decimal TotalPrice { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }
        public ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
