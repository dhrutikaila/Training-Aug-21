using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MusicAppDB.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlbumlikeController : ControllerBase
    {
        private IAlbumlike _songdata;
        public AlbumlikeController(IAlbumlike songdata)
        {
            _songdata = songdata;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetSongs()
        {
            return Ok(_songdata.GetSongs());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetAlbumlike(int id)
        {
            var song = _songdata.Getlike(id);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }
    }
}
