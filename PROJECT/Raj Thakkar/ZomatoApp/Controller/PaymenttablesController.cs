using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZomatoApp.Models;
using ZomatoApp.DBContext;
using ZomatoApp.Repository.Interfaces;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymenttablesController : ControllerBase
    {
        private readonly IPaymenttable Pay;

        public PaymenttablesController(IPaymenttable pay)
        {
            Pay = pay;
        }

        // GET: api/Paymenttables
        [HttpGet]
        public IEnumerable<Paymenttable> GetPaymenttables()
        {
            return Pay.GetAll();
        }

        // GET: api/Paymenttables/id
        [HttpGet("{id}")]
        public async Task<ActionResult<Paymenttable>> GetPaymenttable(int id)
        {
            var paymenttable = Pay.GetById(id);

            if (paymenttable == null)
            {
                return NotFound();
            }

            return paymenttable;
        }

        // PUT: api/Paymenttables/id
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPaymenttable(int id, Paymenttable paymenttable)
        {
            if (id != paymenttable.Payid)
            {
                return BadRequest();
            }

           

            try
            {
                 Pay.Update(paymenttable);
            }
            catch (Exception ex)
            {
                if (!PaymenttableExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Paymenttables
        [HttpPost]
        public async Task<ActionResult<Paymenttable>> PostPaymenttable(Paymenttable paymenttable)
        {
            Pay.Create(paymenttable);
           

            return CreatedAtAction("GetPaymenttable", new { id = paymenttable.Payid }, paymenttable);
        }

        // DELETE: api/Paymenttables/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePaymenttable(int id)
        {
            var paymenttable = Pay.GetById(id);
            if (paymenttable == null)
            {
                return NotFound();
            }

            Pay.Delete(paymenttable);
           

            return NoContent();
        }

        private bool PaymenttableExists(int id)
        {
            return Pay.Any(e => e.Payid == id);
        }
    }
}
