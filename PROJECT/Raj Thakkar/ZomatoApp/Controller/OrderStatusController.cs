using Microsoft.AspNetCore.Mvc;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using ZomatoApp.DBContext;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderStatusController : ControllerBase
    {
        
        private readonly IOrderStatus orderStatus;
        public OrderStatusController(IOrderStatus ostats)
        {
            this.orderStatus = ostats;
           
        }

        //GET: api/OrderStatus
        [HttpGet]
        public IEnumerable<OrderStatus> AddNewDataMethod()
        {
            return orderStatus.GetAll();
        }

        //Get by ID: api/OrderStatus/id
        [HttpGet("{id}")]
        public ActionResult<OrderStatus> GetCities(int id)
        {
            var orderstatus = orderStatus.GetById(id);

            if (orderstatus == null)
            {
                return NotFound();
            }
            return orderstatus;
        }

        //POST: api/OrderStatus
        [HttpPost]
        public string creates([FromBody] OrderStatus obEntity)
        {

            OrderStatus check = orderStatus.FirstOrDefault(s => s.Orderstatusid == obEntity.Orderstatusid);
            if (check != null)
                //new Exception("Create already exists...");
                return "OrderStatus already exists...";
            else
            {
                orderStatus.Create(obEntity);
                OrderStatus ObjEntity = (OrderStatus)orderStatus.GetById(obEntity.Orderstatusid);
                return $"OrderStatus {ObjEntity.Orderstatusid} is added successfully and your id is {ObjEntity.Orderstatusid}";
            }
        }


        // DELETE: api/OrderStatus/id
        [HttpDelete("{id}")]
        public String Deletes(int id)
        {
            try
            {
                var dataDelete = orderStatus.GetById(id);
                orderStatus.Delete(dataDelete);
                return "OrderStatus removed successfully";
            }
            catch (Exception)
            {
                return $"OrderStatus not found...";
            }
        }
        
    }
}
