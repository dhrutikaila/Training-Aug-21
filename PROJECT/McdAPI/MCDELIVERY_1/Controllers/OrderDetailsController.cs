using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MCDELIVERY_1.Models;
using MCDELIVERY_1.interfaces;

namespace MCDELIVERY_1.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderDetailsController : ControllerBase
    {
        private IOrderDetails _context;

        public OrderDetailsController(IOrderDetails context)
        {
            _context = context;
        }

        // GET: api/OrderDetails
        [HttpGet]
        public ActionResult GetOrderDetails()
        {

            return Ok(_context.GetOrderDetails());
        }

        // GET: api/OrderDetails/5
        [HttpGet("{id}")]
        public IActionResult GetOrderDetail(int id)
        {
            var orderdetails = _context.GetOrderDetail(id);

            if (orderdetails != null)
            {
                return Ok(orderdetails);
            }

            return NotFound("order detail is not found");
        }

        // PUT: api/OrderDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutOrderDetail(int id, OrderDetail orderDetail)
        {
            var EditorderDetails = _context.GetOrderDetail(id);
            if (EditorderDetails != null)
            {
                orderDetail.OrderDetailsId= EditorderDetails.OrderDetailsId;
                _context.PutOrderDetail(orderDetail);
            }
            return Ok(orderDetail);
        }

        // POST: api/OrderDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostOrderDetail(OrderDetail orderDetail)
        {
            _context.PostOrderDetail(orderDetail);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + orderDetail.OrderDetailsId, orderDetail);
        }

        // DELETE: api/OrderDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrderDetail(int id)
        {
            var orderDetail = _context.GetOrderDetail(id);
            if (orderDetail != null)
            {
                _context.DeleteOrderDetail(orderDetail);
                return Ok();
            }
            return NotFound($"order Detail with id: {id} is not found");
        }

        //private bool OrderDetailExists(int id)
        //{
        //    return _context.OrderDetails.Any(e => e.OrderDetailsId == id);
        //}
    }
}
