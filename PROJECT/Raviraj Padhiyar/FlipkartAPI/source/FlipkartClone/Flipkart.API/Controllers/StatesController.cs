using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;
using Flipkart.API.DTOs;
using AutoMapper;
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Authorization;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StatesController : ControllerBase
    {
        private readonly IStateService _context;
        private readonly IMapper _mapper;

        public StatesController(IStateService context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/States
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StateDto>>> GetStates()
        {
            var states = await _context.GetAllAsync();

            return Ok(_mapper.Map<IEnumerable<StateDto>>(states));
        }

        // GET: api/States/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StateDto>> GetState(int id)
        {
            var state = await _context.GetByIdAsync(id);

            if (state == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<StateDto>(state));
        }

        // PUT: api/States/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutState(int id,[FromBody] StateDto state)
        {
            if (id != state.StateId)
            {
                return BadRequest();
            }

            var stateEntity = _mapper.Map<State>(state);

            _context.Update(stateEntity);

            try
            {
                await _context.SaveAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!_context.Exists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/States
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<ActionResult<StateDto>> PostState([FromBody] StateDto state)
        {
            var stateEntity = _mapper.Map<State>(state);
            
            _context.Create(stateEntity);
            await _context.SaveAsync();

            var stateToReturn = _mapper.Map<StateDto>(stateEntity);

            return CreatedAtAction("GetState", new { id = stateToReturn.StateId }, stateToReturn);
        }

        // DELETE: api/States/5
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteState(int id)
        {
            var state = await _context.GetByIdAsync(id);
            if (state == null)
            {
                return NotFound();
            }

            state.IsActive = false;
            _context.Delete(state);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
