using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Controllers
{
    public class OrderDetailController : ControllerBase
    {
        private IOrderDetail _orderDetail;
        public OrderDetailController(IOrderDetail orderDetail)
        {
            _orderDetail = orderDetail;
        }

        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetUsers()
        {
            return Ok(_orderDetail.GetAll());   
        }
        //get data by id
        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetById(int id)
        {
            var OrderDetail = _orderDetail.GetById(id);
            if (OrderDetail != null)
            {
                return Ok(OrderDetail);
            }
            return NotFound($"Order Detail with this id {id} was not found");
        }

        //insert data 
        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult GetById(OrderDetail orderDetail)
        {
            _orderDetail.Create(orderDetail);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + orderDetail.OrderDetailId
                , orderDetail);
        }

        //delete data 
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteUser(int id)
        {
            var OrderDetail = _orderDetail.GetById(id);
            if (OrderDetail != null)
            {
                _orderDetail.Delete(OrderDetail);
                return Ok();
            }
            return NotFound($"Order detail with this id {id} was not found");
        }

        //update the data 
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditEmergencyContact(int id, OrderDetail orderDetail)
        {
            var ExistingOrderDetail = _orderDetail.GetById(id);
            if (ExistingOrderDetail != null)
            {
                orderDetail.OrderDetailId = ExistingOrderDetail.OrderDetailId;
                _orderDetail.Update(id, orderDetail);
                return Ok();
            }
            return Ok(orderDetail);
        }
    }
}
