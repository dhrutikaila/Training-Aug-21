using Day_14_Assignment.Models;
using Day_14_Assignment.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Controllers
{ 
    [ApiController]
    public class CustomerDataController : ControllerBase
    {
        private ICustomerData _Customer;
        public CustomerDataController(ICustomerData customer)
        {
            _Customer = customer;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetCustomers()
        {
            return Ok(_Customer.GetCustomers());
        }
        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetCustomer(int id)
        {
            var Customer = _Customer.GetCustomer(id);
            if (Customer != null)
            {
                return Ok(Customer);
            }
            return NotFound($"Customer with this id {id} is not found");
        }
        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult GetCustomer(Customer customer)
        {
            _Customer.AddCustomer(customer);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + customer.CustomerId
                           , customer);
        }
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteEmployee(int id)
        {
            var customer = _Customer.GetCustomer(id);
            if (customer != null)
            {
                _Customer.DeleteCustomer(customer);
                return Ok();
            }
            return NotFound($"Employee with this id {id} was not found");
        }
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditCustomer(int id, Customer customer)
        {
            var ExistingCustomer = _Customer.GetCustomer(id);
            if (ExistingCustomer != null)
            {
                customer.CustomerId = ExistingCustomer.CustomerId;
                _Customer.EditCustomer(customer);
            }
            return Ok(customer);
        }
    }
}
