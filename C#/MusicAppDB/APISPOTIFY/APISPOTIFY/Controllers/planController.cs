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
    public class planController : ControllerBase
    {
        // GET: api/<planController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "Plan1", "Plan2","Plan3" };
        }

        // GET api/<planController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "1";
        }

        // POST api/<planController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<planController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<planController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
