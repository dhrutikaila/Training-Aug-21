using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZomatoApp.DBContext;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdertablesController : ControllerBase
    {
      
        private readonly IOrder order;
        public OrdertablesController(IOrder ord)
        {
            order = ord;
           
        }

        //GET: api/Ordertable
        [HttpGet]
        public IEnumerable<Ordertable> AllOrderMethod()
        {
            return order.GetAll();
        }

        //Get By Id: api/Ordertable/id
        [HttpGet("{id}")]
        public ActionResult<Ordertable> GetOrder(int id)
        {
            var orders = order.GetById(id);

            if (orders == null)
            {
                return NotFound();
            }
            else
            {
                return orders;
            }
        }

        //POST: api/Ordertable
        [HttpPost]
        public string creates([FromBody] Ordertable addOrder)
        {
            addOrder.Dates=DateTime.Now;
             order.Create(addOrder);
              
                return $"Ordertable order is added successfully";
  
        }

        //Delete by id
        [HttpDelete("{id}")]
        public IActionResult DeleteOrder(int id)
        {
            var Order = order.GetById(id);
            if (Order == null)
            {
                return NotFound();
            }

            order.Delete(Order);

            return NoContent();
        }

        //Put
        [HttpPut("{id}")]
        public ActionResult<Ordertable> PutOrder(int id, Ordertable Order)
        {
            try
            {
                order.Update(Order);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return GetOrder(id);

        }

    }
}
