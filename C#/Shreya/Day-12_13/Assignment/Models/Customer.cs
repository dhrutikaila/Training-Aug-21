using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Day12_13.Models
{
    [Table("Customer")]
    class Customer
    {
        [Key]
        public int CustomerId{get;set;}
        public string CustomerName{get;set;}
    }
}
