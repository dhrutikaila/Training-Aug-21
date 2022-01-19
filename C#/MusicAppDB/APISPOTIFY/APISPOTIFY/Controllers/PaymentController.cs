using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;



namespace APISPOTIFY.Controllers
{
    
    [ApiController]
    public class PaymentController : ControllerBase
    {
        // GET: api/<PaymentController>
       
        private IPayment _albumdata;
        public PaymentController(IPayment songdata)
        {
            _albumdata = songdata;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetAlbums()
        {
            return Ok(_albumdata.Getpayment());

        }
        // GET api/<PaymentController>/5

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetAlbum(int id)
        {
            var song = _albumdata.Getpayment(id);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }

        [HttpPost]
        [Route("api/[controller]")]

        public IActionResult GetAlbum(Payment song)
        {
            _albumdata.Addpayment(song);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + song.UserId,
                song);

        }
        [HttpDelete]
        [Route("api/[controller]")]

        public IActionResult DeleteSong(int id)
        {
            var song = _albumdata.Getpayment(id);
            if (song != null)
            {
                _albumdata.Deletepayment(song);
                return Ok();
            }
            return NotFound($"songs with id :{id} was not found");

        }
       

    }
}
