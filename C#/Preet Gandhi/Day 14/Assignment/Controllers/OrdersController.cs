using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_14_Assignment.Models;
using Day_14_Assignment.OrderData;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Day_14_Assignment.Controllers
{
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderData _orderData;
        public OrdersController(IOrderData orderData)
        {
            _orderData = orderData;
        }

        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetOrders()
        {
            return Ok(_orderData.GetOrders());
        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetOrder(int id)
        {
            var order = _orderData.GetOrder(id);

            if (order != null)
            {
                return Ok(order);
            }
            return NotFound($"Order with id: {id} was not found.");
        }

        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult AddOrder(Order order)
        {
            _orderData.AddOrder(order);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + order.OrderId, order);
        }

        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteOrder(int id)
        {
            var order = _orderData.GetOrder(id);

            if (order != null)
            {
                _orderData.DeleteOrder(order);
                return Ok();
            }

            return NotFound($"Order with id: {id} was not found.");
        }

        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditOrder(int id, Order order)
        {
            var existingOrder = _orderData.GetOrder(id);

            if (existingOrder != null)
            {
                order.OrderId = existingOrder.OrderId;
                _orderData.EditOrder(order);
            }

            return Ok(order);
        }
    }
}
