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

namespace Flipkart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly ICustomerService _context;
        private readonly IMapper _mapper;

        public CustomersController(ICustomerService context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Customers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomerDto>>> GetCustomers()
        {
            var customers = await _context.GetAllAsync();

            return Ok(_mapper.Map<IEnumerable<CustomerDto>>(customers));
        }

        // GET: api/Customers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Customer>> GetCustomer(int id)
        {
            var customer = await _context.GetByIdAsync(id);

            if (customer == null)
            {
                return NotFound();
            }

            return Ok(_mapper.Map<CustomerDto>(customer));
        }

        //GET : api/customer/2/customerAddresses
        [HttpGet("{id}/customerAddresses")]
        public IActionResult GetCustomerAddresses(int id)
            => Ok(_context.GetCustomerAddresses(id));


        //GET : api/customer/2/customerAddresses/1
        [HttpGet("{id}/customerAddresses/{customerAddressId}")]
        public IActionResult GetCustomerAddressesById(int id, int customerAddressId)
            => Ok(_context.GetCustomerAddressesById(id,customerAddressId));


        //GET : api/customer/2/paymentDetails
        [HttpGet("{id}/paymentDetails")]
        public IActionResult GetCustomerPaymentDetials(int id)
            => Ok(_context.GetCustomerPaymentDetails(id));


        //GET : api/customer/2/paymentDetails/1
        [HttpGet("{id}/paymentDetails/{payementDetailId}")]
        public IActionResult GetCustomerPaymentDetialsById(int id,int paymentDetailId )
            => Ok(_context.GetCustomerPaymentDetailsById(id,paymentDetailId));

        //GET : api/customer/2/orderHeader
        [HttpGet("{id}/orderHeaders")]
        public ActionResult<IEnumerable<OrderHeader>> GetCustomerOrderHeaders(int id)
            => Ok(_context.GetCustomerOrderHeaders(id));

        //GET : api/customer/2/orderHeader/1/orderDetails
        [HttpGet("{id}/orderHeaders/{orderHeaderId}/orderDetails")]
        public ActionResult<IEnumerable<OrderDetailDto>> GetCustomerOrderHeadersById(int id,int orderHeaderId)
            => Ok(_context.GetCustomerOrderHeadersById(orderHeaderId));

        // PUT: api/Customers/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCustomer(int id,[FromBody] CustomerDto customer)
        {
            if (id != customer.CustomerId)
            {
                return BadRequest();
            }

            var customerEntity = _mapper.Map<Customer>(customer);
            _context.Update(customerEntity);

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

        // POST: api/Customers
        [HttpPost]
        public async Task<ActionResult<Customer>> PostCustomer(Customer customer)
        {
            _context.Create(customer);
            await _context.SaveAsync();

            var customerToReturn = _mapper.Map<CustomerDto>(customer);

            return CreatedAtAction("GetCustomer", new { id = customerToReturn.CustomerId }, customerToReturn);
        }

        // DELETE: api/Customers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            var customer = await _context.GetByIdAsync(id);
            if (customer == null)
            {
                return NotFound();
            }

            customer.IsActive = false;
            _context.Delete(customer);
            await _context.SaveAsync();

            return NoContent();
        }

    }
}
