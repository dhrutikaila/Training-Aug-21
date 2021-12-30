using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using ToyCompany.API.Models;
using ToyCompany.API.Repository;

namespace ToyCompany.API.Controllers
{
    [ApiController]
    [Route("api/customers")]
    public class CustomerController : ControllerBase
    {
        private readonly IToyCompanyRepository _toyCompanyRepository;
        private readonly IMapper _mapper;

        public CustomerController(IToyCompanyRepository toyCompanyRepository, IMapper mapper)
        {
            _toyCompanyRepository = toyCompanyRepository ??
                throw new ArgumentNullException(nameof(toyCompanyRepository));
            _mapper = mapper ??
                throw new ArgumentNullException(nameof(mapper));
        }

        [HttpGet]
        public ActionResult<IEnumerable<Customers>> GetCustomer()
        {
            var customerFromRepo = _toyCompanyRepository.GetCustomers();

            return Ok(customerFromRepo);
        }


        [HttpGet("{customerId}", Name = "GetCustomer")]
        public ActionResult<Customers> GetCustomer(int customerId)
        {
            var customerFromRepo = _toyCompanyRepository.GetCustomer(customerId);

            if(customerFromRepo == null)
            {
                return NotFound();
            }

            return Ok(customerFromRepo);
        }

        [HttpPost]
        public ActionResult<Customers> AddCustomer(CustomerForCreation customer)
        {

            var customerEntity = _mapper.Map<Models.Customers>(customer);

            _toyCompanyRepository.AddCustomer(customerEntity);
            _toyCompanyRepository.Save();

            


            return CreatedAtRoute("GetCustomer", new { customerId = customerEntity.Id},
                customerEntity);
        }



    }
}
