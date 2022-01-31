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
    public class PaymentController : ControllerBase
    {
       
        private readonly IPayment Pay;
        public PaymentController(IPayment pay)
        {
            Pay = pay;
          
        }

        //GET: api/Payment
        [HttpGet]
        public IEnumerable<Payment> AddNewDataMethod()
        {
            return Pay.GetAll();
        }


        // DELETE: api/Payment/id
        [HttpDelete("{id}")]
        public string Deletes([FromBody] int id)
        {
            try
            {
                var dataDelete = Pay.GetById(id);
                Pay.Delete(dataDelete);
                return "Payment removed successfully";
            }
            catch (Exception)
            {
                return $"Payment not found...";
            }
        }
    }
}