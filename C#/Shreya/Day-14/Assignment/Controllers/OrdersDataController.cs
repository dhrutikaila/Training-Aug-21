using Day_14_Assignment.Models;
using Day_14_Assignment.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Controllers
{
    
    [ApiController]
    public class OrdersDataController : ControllerBase
    {
        private IOrderDetail _OrderDetail;
        public OrdersDataController(IOrderDetail orderDetail)
        {
            _OrderDetail = orderDetail;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetOrders()
        {
            return Ok(_OrderDetail.GetOrders());
        }
        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetOrder(int id)
        {
            var order = _OrderDetail.getOrder(id);
            if (order != null)
            {
                return Ok(order);
            }
            return NotFound($"Order with this id {id} is not found");
        }
        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult GetOrder(Order order)
        {
            _OrderDetail.AddOrder(order);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + order.OrderId
                , order);
        }
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteOrder(int id)
        {
            var order = _OrderDetail.getOrder(id);
            if (order != null)
            {
                _OrderDetail.deleteOrder(order);
                return Ok();
            }
            return NotFound($"Order with this id {id} was not found");
        }
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditOrder(int id,Order order)
        {
            var ExistingOrder = _OrderDetail.getOrder(id);
            if (ExistingOrder != null)
            {
                order.OrderId = ExistingOrder.OrderId;
                _OrderDetail.updateOrder(order);
            }
            return Ok(order);
        }

    }
}
