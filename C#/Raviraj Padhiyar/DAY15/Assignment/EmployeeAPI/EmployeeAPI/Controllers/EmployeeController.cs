using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using EmployeeAPI.Models;
using EmployeeAPI.Repository;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeAPI.Controllers
{
    [ApiController]
    [Route("api/emps")]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeAPIRepostiory _employeeAPIRepository;
        private readonly IMapper _mapper;

        public EmployeeController (IEmployeeAPIRepostiory employeeAPIRepository,IMapper mapper)
        {
            _employeeAPIRepository = employeeAPIRepository ??
                throw new ArgumentNullException(nameof(employeeAPIRepository));
            _mapper = mapper ??
                throw new ArgumentNullException(nameof(mapper));
        }

        //get employee
        [HttpGet()]
        public ActionResult<IEnumerable<Employee>> GetEmployees()
        {
            var Employees = _employeeAPIRepository.GetEmployees();

            return Ok(Employees);
        }

        //post employee

        public ActionResult<Employee> CreateEmployee(EmployeeForCreationDto employee)
        {
            var employeeEntity = _mapper.Map<Models.Employee>(employee);

            _employeeAPIRepository.AddEmployee(employeeEntity);
            _employeeAPIRepository.Save();

            return Ok();

        }
    }
}
