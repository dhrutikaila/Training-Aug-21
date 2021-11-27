using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ToyShop.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ToyShopAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerRepository _customer;
        public CustomerController(ICustomerRepository customerRepository)
        {
            _customer = customerRepository;
        }

        [HttpGet]
        public IActionResult GetCustomers()
        {
            var Customer = _customer.GetCustomers();
            return Ok(Customer);
        }

        [HttpGet("{Id}")]
        public IActionResult GetCustomer(int Id)
        {
            var Customer = _customer.GetCustomer(Id);
            if (Customer != null)
            {
                return Ok(Customer);
            }
            return NotFound($"Customer Id : {Id} Is Not Available");
        }

        [HttpPost]
        public IActionResult AddCustomer(Customer customer)
        {
            _customer.AddCustomer(customer);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + customer.CustomerId, customer);
        }

        [HttpDelete("{Id}")]
        public IActionResult DeleteCustomer(int Id)
        {
            var Customer = _customer.GetCustomer(Id);
            if (Customer != null)
            {
                _customer.DeleteCustomer(Customer);
                return Ok();
            }
            return NotFound($"Customer Id : {Id} Is Not Available");

        }

        [HttpPatch("{Id}")]
        public IActionResult EditCustomer(int Id, Customer customer)
        {
            var existingCustomer = _customer.GetCustomer(Id);
            if (existingCustomer != null)
            {
                customer.CustomerId = existingCustomer.CustomerId;
                _customer.EditCustomer(customer);
                return Ok(customer);
            }
            return NotFound($"Customer Id : {Id} Is Not Available");
        }
    }
}
