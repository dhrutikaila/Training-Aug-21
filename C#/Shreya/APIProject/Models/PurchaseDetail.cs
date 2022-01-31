using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
namespace APIProject.Models
{
    public class PurchaseDetail
    {
        [Key]
        public int PurchaseDetailid {get; set;}
        public int OrderDetailId {get; set;}
        public int UserId { get; set;}
        //public Order OrderDetail { get; set; }
        public User user { get; set; }
    }
}
