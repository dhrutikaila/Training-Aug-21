using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using APISPOTIFY.Authentication;
using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Controllers
{
    
    [ApiController]
    public class SONGController : ControllerBase
    {
        private ISongdata _songdata;
     public SONGController(ISongdata songdata)
        {
            _songdata = songdata;
        }
        
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetSongs()
        {
            return Ok(_songdata.GetSong());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetSong(int id)
        {
            var song = _songdata.GetSong(id);

            if(song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }

        [HttpPost]
        [Route("api/[controller]")]

        public IActionResult GetSong(Song song)
        {
            _songdata.AddSong(song);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + song.SongId,
                song);

        }
        [HttpDelete]
        [Route("api/[controller]")]

        public IActionResult DeleteSong(int id)
        {
            var song = _songdata.GetSong(id);
            if(song!=null)
            {
                _songdata.DeleteSong(song);
                return Ok();
            }
            return NotFound($"songs with id :{id} was not found");

        }
        [HttpPatch]
        [Route("api/[controller]")]

        public IActionResult EditSong(int id, Song song)
        {
            var existingSong = _songdata.GetSong(id);
            if (existingSong != null)
            {
                song.SongId = existingSong.SongId;
                _songdata.EditSong(song);
                
            }
            return Ok(song);
        }
    }
}
