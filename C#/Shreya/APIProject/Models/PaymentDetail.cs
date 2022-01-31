using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class PaymentDetail
    {
        [Key]
        public int PaymentId { get; set; }
        [ForeignKey("CartItemId")]
        public virtual CartItem CartItem { get; set; }
        [ForeignKey("PaymentTypeId")]
        public virtual PaymentMethod PaymentMethod { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }

      }
}
