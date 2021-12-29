﻿using Microsoft.AspNetCore.Authorization;
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
    
    [ApiController]
    public class SONGController : ControllerBase
    {
        private ISongdata _songdata;
     public SONGController(ISongdata songdata)
        {
            _songdata = songdata;
        }
        [Authorize(Roles = UserRoles.Admin)]
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetSongs()
        {
            return Ok(_songdata.GetSongs());

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
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + song.SongID,
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
                song.SongID = existingSong.SongID;
                _songdata.EditSong(song);
                
            }
            return Ok(song);
        }
    }
}
