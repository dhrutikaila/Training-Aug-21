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
using Flipkart.API.ResourceParameters;
using Flipkart.API.DTOs;
using Flipkart.API.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc.NewtonsoftJson;

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProductService _context;
        private readonly IMapper _mapper;

        public ProductsController(IProductService context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vproduct>>> GetProducts([FromQuery] ProductResoruceParameters productResoruceParameters)
        {
            var products =  await _context.GetAllAsync(productResoruceParameters);

            return Ok(_mapper.Map<IEnumerable<Vproduct>>(products));
        }




        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            var product = await _context.GetByIdAsync(id);

            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        // GET : api/Products/1/Invetories
        [HttpGet("{id}/Inventories")]
        public async Task<ActionResult<IEnumerable<Inventory>>> GetProductInventories(int id)
            => Ok(await _context.GetProductInventories(id));

        // GET : api/Products/1/ProductImages
        [HttpGet("{id}/ProductImages")]
        public async Task<ActionResult<IEnumerable<ProductImage>>> GetProductProductImages(int id)
            => Ok(await _context.GetProductProductProductImages(id));


        // GET : api/Products/1/Invetories/1
        [HttpGet("{ProductID}/Inventories/{id}")]
        public async Task<ActionResult<Inventory>> GetProductInventoriesById(int id)
            => Ok(await _context.GetProductInventoriesById(id));

        // GET : api/Products/1/ProductImages/1
        [HttpGet("{ProductID}/ProductImages/{id}")]
        public async Task<ActionResult<ProductImage>> GetProductProductImageId(int id)
            => Ok(await _context.GetProductProductProductImagesById(id));


        // PUT: api/Products/5
       
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduct(int id,[FromBody] Product product)
        {
            if (id != product.ProductId)
            {
                return BadRequest();
            }

            _context.Update(product);

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

        // POST: api/Products
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<ActionResult<Product>> PostProduct([FromBody] Product product)
        {
            _context.Create(product);
            await _context.SaveAsync();

            return CreatedAtAction("GetProduct", new { id = product.ProductId }, product);
        }

        //[HttpPatch("{id}")]
        //public ActionResult<Product> PatchProduct(int id, [FromBody] JsonPatchDocument productPatch)
        //{
        //    if(productPatch != null)
        //    {
        //        var product = new Product();

        //        productPatch.ApplyTo(product, (Microsoft.AspNetCore.JsonPatch.Adapters.IObjectAdapter)ModelState);

        //        if(!ModelState.IsValid)
        //        {
        //            return BadRequest(ModelState);
        //        }

        //        return Ok(product);
        //    }
        //    else
        //    {
        //        return BadRequest();
        //    }
        //}

        // DELETE: api/Products/5
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            var product = await _context.GetByIdAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            product.IsActive = false;
            _context.Delete(product);
            await _context.SaveAsync();

            return NoContent();
        }
    }
}
