using Microsoft.AspNetCore.Mvc;
using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Controllers
{
    [ApiController]
    public class PlayListController : ControllerBase
    {

        private IPlaylist _playlistdata;
        public PlayListController(IPlaylist songdata)
        {
            _playlistdata = songdata;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetAlbum()
        {
            return Ok(_playlistdata.GetAlbums());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetAlbum(int id)
        {
            var song = _playlistdata.GetPlaylist(id);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }

        [HttpPost]
        [Route("api/[controller]")]

        public IActionResult GetPlaylist(Playlist song)
        {
            _playlistdata.AddPlaylist(song);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + song.PlaylistId,
                song);

        }
        [HttpDelete]
        [Route("api/[controller]")]

        public IActionResult DeletePlaylist(int id)
        {
            var song = _playlistdata.GetPlaylist(id);
            if (song != null)
            {
                _playlistdata.DeletePlaylist(song);
                return Ok();
            }
            return NotFound($"songs with id :{id} was not found");

        }
        [HttpPatch]
        [Route("api/[controller]")]

        public IActionResult EditPlayList(int id, Playlist Playlist)
        {
            var existingSong = _playlistdata.GetPlaylist(id);
            if (existingSong != null)
            {
                Playlist.UserId = existingSong.UserId;
                _playlistdata.EditPlaylist(Playlist);

            }
            return Ok(Playlist);
        }
    }
}

