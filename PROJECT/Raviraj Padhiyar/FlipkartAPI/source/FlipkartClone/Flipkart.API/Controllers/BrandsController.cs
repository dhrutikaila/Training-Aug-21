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
    public class BrandsController : ControllerBase
    {
        private readonly IBrandService _context;
        private readonly IMapper _mapper;

        public BrandsController(IBrandService context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Brands
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Brand>>> GetBrands()
        {
            var brands = await _context.GetAllAsync();

            return Ok(_mapper.Map<IEnumerable<BrandDto>>(brands));
        }

        // GET: api/Brands/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Brand>> GetBrand(int id)
        {
            var brand = await _context.GetByIdAsync(id);

            if (brand == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<BrandDto>(brand));
        }

        // PUT: api/Brands/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBrand(int id,[FromBody] Brand brand)
        {
            if (id != brand.BrandId)
            {
                return BadRequest();
            }

            _context.Update(brand);

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

        // POST: api/Brands
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<ActionResult<Brand>> PostBrand(Brand brand)
        {
            _context.Create(brand);
            await _context.SaveAsync();

            return CreatedAtAction("GetBrand", new { id = brand.BrandId }, brand);
        }

        // DELETE: api/Brands/5
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBrand(int id)
        {
            var brand = await _context.GetByIdAsync(id);
            if (brand == null)
            {
                return NotFound();
            }
            brand.IsActive = false;
            _context.Delete(brand);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
