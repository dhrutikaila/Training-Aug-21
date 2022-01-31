using APIProject.Authentication;
using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Controllers
{
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrder _order;
       // private readonly MamaEarthDBContext _mamaEarthDBContext;
        public OrderController(IOrder order)
        {
            _order = order;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetOrders()
        {

            return Ok(_order.GetAll());
        }
        //get data by id
        [HttpGet]
        [Route("api/[controller]/{id}")]
        [Authorize(Roles = UserRoles.User)]
        public IActionResult GetById(int id)
        {
            var Order = _order.GetById(id);
            if (Order != null)                                                                                  
            {
                return Ok(Order);   
            }
            return NotFound($"Order with this id {id} was not found");
        }
        //insert data 
        [HttpPost]
        [Route("api/{id}/[controller]")]
        [Authorize(Roles = UserRoles.User)]
        public IActionResult GetById(int id ,Order order )
        {
           
            _order.AddOrder(id,order);
            //_order.RemoveCart(id);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + order.OrderId
                , order);   
        }
        //delete data 
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        [Authorize(Roles = UserRoles.User)]
        public IActionResult DeleteOrder(int id)
        {
            var Order = _order.GetById(id);
            if (Order != null)
            {
                _order.Delete(Order);
                return Ok("Order Deleted SuccessFully!");
            }
            return NotFound($"Order with this id {id} was not found");
        }
        //update the data 
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        [Authorize(Roles = UserRoles.User)]
        public IActionResult EditEmergencyContact(int id, Order order)
        {
            var ExistingOrder = _order.GetById(id);
            if (ExistingOrder != null)
            {
                order.OrderId = ExistingOrder.OrderId;
                _order.Update(id, order);
                return Ok();
            }
            return Ok(order);
        }
    }
}
