using APISPOTIFY.IRepository;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APISPOTIFY.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenerController : ControllerBase
    {
        private Igener _songdata;
        public GenerController(Igener songdata)
        {
            _songdata = songdata;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetSongs()
        {
            return Ok(_songdata.Getgenre());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetAlbumlike(int AlbumId, int UserId)
        {
            var song = _songdata.Getgenre(AlbumId, UserId);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{AlbumId} was not found");
        }
    }
}
