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
using AutoMapper;
using Flipkart.API.DTOs;
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Authorization;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubCatgoriesController : ControllerBase
    {
        private readonly ISubCategoryService _context;
        private readonly IMapper _mapper;

        public SubCatgoriesController(ISubCategoryService context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/SubCatgories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SubCatgoryDto>>> GetSubCatgories()
        {
            var subCategories = await _context.GetAllAsync();

            return Ok(_mapper.Map<IEnumerable<SubCatgoryDto>>(subCategories));
        }

        // GET: api/SubCatgories/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SubCatgoryDto>> GetSubCatgory(int id)
        {
            var subCatgory = await _context.GetByIdAsync(id);

            if (subCatgory == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<SubCatgoryDto>(subCatgory));
        }

        // PUT: api/SubCatgories/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSubCatgory(int id,[FromBody] SubCatgory subCatgory)
        {
            if (id != subCatgory.SubCategoryId)
            {
                return BadRequest();
            }

            _context.Update(subCatgory);

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

        // POST: api/SubCatgories
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<ActionResult<SubCatgory>> PostSubCatgory(SubCatgory subCatgory)
        {
            _context.Create(subCatgory);
            await _context.SaveAsync();

            return CreatedAtAction("GetSubCatgory", new { id = subCatgory.SubCategoryId }, subCatgory);
        }

        // DELETE: api/SubCatgories/5
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSubCatgory(int id)
        {
            var subCatgory = await _context.GetByIdAsync(id);
            if (subCatgory == null)
            {
                return NotFound();
            }

            subCatgory.IsActive = false;
            _context.Delete(subCatgory);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
