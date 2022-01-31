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
    [Route("api/[controller]")]
    [ApiController]
    public class DealsController : ControllerBase
    {
        private  IDeals _context;

        public DealsController(IDeals context)
        {
            _context = context;
        }

        // GET: api/Deals
        [HttpGet]
        public IActionResult GetDeals()
        {
            return Ok(_context.GetDeals());
        }

        // GET: api/Deals/5
        [HttpGet("{id}")]
        public IActionResult GetDeal(int id)
        {

            var deal = _context.GetDeal(id);

            if (deal != null)
            {
                return Ok(deal);
            }

            return NotFound("deal is not found");
        }

        // PUT: api/Deals/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutDeal(int id, Deal deal)
        {
            var Editdeal = _context.GetDeal(id);
            if (Editdeal != null)
            {
                deal.DealsId = Editdeal.DealsId;
                _context.PutDeal(deal);
            }
            return Ok(deal);
        }

        // POST: api/Deals
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostDeal(Deal deal)
        {
            _context.PostDeal(deal);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + deal.DealsId, deal);
        }

        // DELETE: api/Deals/5
        [HttpDelete("{id}")]
        public IActionResult DeleteDeal(int id)
        {

            var deal = _context.GetDeal(id);
            if (deal != null)
            {
                _context.DeleteDeal(deal);
                return Ok();
            }
            return NotFound($"deal with id: {id} is not found");
        }

        //private bool DealExists(int id)
        //{
        //    return _context.Deals.Any(e => e.DealsId == id);
        //}
    }
}
