using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PodcastController : ControllerBase
    {

        private IPodcast _songdata;
        public PodcastController(IPodcast songdata)
        {
            _songdata = songdata;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult Getpodcasts()
        {
            return Ok(_songdata.Getpodcasts());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult Getpodcast(int id)
        {
            var song = _songdata.Getpodcast(id);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }

        [HttpPost]
        [Route("api/[controller]")]

        public IActionResult Getpodcast(Podcast song)
        {
            _songdata.Addpodcast(song);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + song.PodcastId,
                song);

        }
        [HttpDelete]
        [Route("api/[controller]")]

        public IActionResult DeleteSong(int id)
        {
            var song = _songdata.Getpodcast(id);
            if (song != null)
            {
                _songdata.Deletepodcast(song);
                return Ok();
            }
            return NotFound($"songs with id :{id} was not found");

        }
        [HttpPatch]
        [Route("api/[controller]")]

        public IActionResult Editpodcast(int id, Podcast song)
        {
            var existingSong = _songdata.Getpodcast(id);
            if (existingSong != null)
            {
                song.PodcastId = existingSong.PodcastId;
                _songdata.Editpodcast(song);

            }
            return Ok(song);
        }
    }
}

