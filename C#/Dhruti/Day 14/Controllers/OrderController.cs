using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ToyShopAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private IOrderRepository _AddOrder;

        public OrderController(IOrderRepository orderRepository)
        {
            _AddOrder = orderRepository;
        }


        [HttpPost]
        public IActionResult PlaceOrder(OrderData orderData)
        {
            int TotalAmount = 0;

            foreach (var Toy in orderData.ToyId)
            {
                var ToyObj = _AddOrder.GetToy(Toy);
                if (ToyObj.AvailabilityStatus == true)
                {
                    TotalAmount += ToyObj.UnitPrice;
                }
                else
                {
                    return NotFound($"Product {ToyObj.ToysId} is Out Of Stock");
                }
            }
            var Order = _AddOrder.AddOrder(orderData.CustomerId, TotalAmount);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + Order.OrdersId, Order);
        }
    }
}
