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
    public class OffersController : ControllerBase
    {
        private  IOffers _context;

        public OffersController(IOffers context)
        {
            _context = context;
        }

        // GET: api/Offers
        [HttpGet]
        public IActionResult GetOffers()
        {
            return Ok(_context.GetOffers());
        }

        // GET: api/Offers/5
        [HttpGet("{id}")]
        public IActionResult GetOffer(int id)
        {
            var offer = _context.GetOffer(id);

            if (offer != null)
            {
                return Ok(offer);
            }

            return NotFound("offer is not found");
        }

        // PUT: api/Offers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutOffer(int id, Offer offer)
        {

            var Editoffer = _context.GetOffer(id);
            if (Editoffer != null)
            {
                offer.OfferId= Editoffer.OfferId;
                _context.PutOffer(offer);
            }
            return Ok(offer);
        }

        // POST: api/Offers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostOffer(Offer offer)
        {
            _context.PostOffer(offer);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + offer.OfferId, offer);
        }

        // DELETE: api/Offers/5
        [HttpDelete("{id}")]
        public IActionResult DeleteOffer(int id)
        {
            var offer = _context.GetOffer(id);
            if (offer != null)
            {
                _context.DeleteOffer(offer);
                return Ok();
            }
            return NotFound($"offer with id: {id} is not found");
        }

        //private bool OfferExists(int id)
        //{
        //    return _context.get.Any(e => e.OfferId == id);
        //}
    }
}
