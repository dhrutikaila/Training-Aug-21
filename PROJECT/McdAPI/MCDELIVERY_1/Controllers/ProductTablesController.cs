using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MCDELIVERY_1.Models;
using MCDELIVERY_1.interfaces;

namespace MCDELIVERY_1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductTablesController : ControllerBase
    {
        private IProductTable _context;

        public ProductTablesController(IProductTable context)
        {
            _context = context;
        }

        // GET: api/ProductTables
        [HttpGet]
        public IActionResult GetProductTables()
        {
            return Ok(_context.GetProductTables());
        }

        // GET: api/ProductTables/5
        [HttpGet("{id}")]
        public IActionResult GetProductTable(int id)
        {
            var product = _context.GetProductTable(id);

            if (product != null)
            {
                return Ok(product);
            }

            return NotFound("product is not found");
        }

        // PUT: api/ProductTables/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutProductTable(int id, ProductTable productTable)
        {

            var EditProduct = _context.GetProductTable(id);
            if (EditProduct != null)
            {
                productTable.ProductId = EditProduct.ProductId;
                _context.PutProductTable(productTable);
            }
            return Ok(productTable);
        }

        // POST: api/ProductTables
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostProductTable(ProductTable productTable)
        {
            _context.PostProductTable(productTable);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + productTable.ProductId, productTable);
        }

        // DELETE: api/ProductTables/5
        [HttpDelete("{id}")]
        public IActionResult DeleteProductTable(int id)
        {

            var product = _context.GetProductTable(id);
            if (product != null)
            {
                _context.DeleteProductTable(product);
                return Ok();
            }
            return NotFound($"product with id: {id} is not found");
        }

        //private bool ProductTableExists(int id)
        //{
        //    return _context.ProductTables.Any(e => e.ProductId == id);
        //}
    }
}
