using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MusicAppDB.Authentication;
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
    public class GenresController : ControllerBase
    {
        private IGenres _songdata;
        public GenresController(IGenres songdata)
        {
            _songdata = songdata;
        }
        [Authorize(Roles = UserRoles.Admin)]
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetSongs()
        {
            return Ok(_songdata.GetGenres());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetSong(int id)
        {
            var song = _songdata.GetGenres(id);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }

        [HttpPost]
        [Route("api/[controller]")]

        public IActionResult GetSong(Genres Genre)
        {
            _songdata.AddGenres(Genre);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + Genre.GenreId,
                Genre);

        }
        [HttpDelete]
        [Route("api/[controller]")]

        public IActionResult DeleteGenres(int id)
        {
            var song = _songdata.GetGenres(id);
            if (song != null)
            {
                _songdata.DeleteGenres(song);
                return Ok();
            }
            return NotFound($"songs with id :{id} was not found");

        }
        [HttpPatch]
        [Route("api/[controller]")]

        public IActionResult EditSong(int id, Genres song)
        {
            var existingSong = _songdata.GetGenres(id);
            if (existingSong != null)
            {
                song.GenreId = existingSong.GenreId;
                _songdata.EditGenres(song);

            }
            return Ok(song);
        }
    }
}

