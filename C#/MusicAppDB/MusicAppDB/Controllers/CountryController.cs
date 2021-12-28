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
    public class CountryController : ControllerBase
    {
        private ICountry _country;
        public CountryController(ICountry songdata)
        {
            _country = songdata;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetSongs()
        {
            return Ok(_country.GetCountry());

        }

        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetCountry(int id)
        {
            var song = _country.GetCountry(id);

            if (song != null)
            {
                return Ok(song);
            }
            return NotFound($"songs with id :{id} was not found");
        }
    }
}
