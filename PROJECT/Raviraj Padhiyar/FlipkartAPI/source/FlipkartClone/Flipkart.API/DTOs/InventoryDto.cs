using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class InventoryDto
    {
        public int InventoryId { get; set; }
        public int? ProductId { get; set; }
        public int UnitInStock { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
    }
}
