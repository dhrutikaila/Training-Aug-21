using Microsoft.AspNetCore.Mvc;
using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Controllers
{
    [ApiController]
    public class AlbumController : ControllerBase
    {
        
     
            private IAlbumdata _albumdata;
            public AlbumController(IAlbumdata songdata)
            {
            _albumdata = songdata;
            }
            [HttpGet]
            [Route("api/[controller]")]
            public IActionResult GetAlbum()
            {
                return Ok(_albumdata.GetAlbums());

            }

            [HttpGet]
            [Route("api/[controller]/{id}")]
            public IActionResult GetAlbum(int id)
            {
                var song = _albumdata.GetAlbum(id);

                if (song != null)
                {
                    return Ok(song);
                }
                return NotFound($"songs with id :{id} was not found");
            }

            [HttpPost]
            [Route("api/[controller]")]

            public IActionResult GetAlbum(Album song)
            {
            _albumdata.AddAlbum(song);
                return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + song.AlbumId,
                    song);

            }
            [HttpDelete]
            [Route("api/[controller]")]

            public IActionResult DeleteSong(int id)
            {
                var song = _albumdata.GetAlbum(id);
                if (song != null)
                {
                _albumdata.DeleteAlbum(song);
                    return Ok();
                }
                return NotFound($"songs with id :{id} was not found");

            }
            [HttpPatch]
            [Route("api/[controller]")]

            public IActionResult EditAlbum(int id, Album Album)
            {
                var existingSong = _albumdata.GetAlbum(id);
                if (existingSong != null)
                {
                    Album.UserId = existingSong.UserId;
                _albumdata.EditAlbum(Album);

                }
                return Ok(Album);
            }
        }
    }

