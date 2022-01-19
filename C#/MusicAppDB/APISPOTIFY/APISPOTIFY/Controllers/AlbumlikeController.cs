using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using APISPOTIFY.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Controllers
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
            return Ok(_songdata.GetAlbumLike());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetAlbumlike(int AlbumId,int UserId)
        {
            var song = _songdata.GetAlbumLike(AlbumId, UserId);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{AlbumId} was not found");
        }
    }
}
