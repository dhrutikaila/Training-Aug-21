using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TOY_API_DAY14_1.Models;

namespace TOY_API_DAY14_1.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CustomersController : ControllerBase
    {
        private readonly TOY_APIContext _context;

        public CustomersController(TOY_APIContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("all")]
        public IActionResult GetCustomers()
        {
            var all_customers = _context.Customers.ToList();
            return Ok(all_customers);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Customer>> GetCustomers(int id)
        {
            var customer = await _context.Customers.FindAsync(id);
            if (customer == null) {
                return NotFound();
            }
            return customer;
        }

        [HttpPut]
        [Route("update")]
        public IActionResult UpdateCustomer(Customer customer) {
            _context.Update(customer);
            _context.SaveChanges();
            return NoContent();
        }

        [HttpPost]
        [Route("add")]
        public IActionResult CreateCustomer(Customer customer)
        {

            _context.Customers.Add(customer);
            _context.SaveChanges();
            return Ok(customer.CustomerId);
        }

        [HttpDelete]
        [Route("delete/{id}")]
        public IActionResult DeleteCustomer(int id)
        {
            var cus_delete = _context.Customers.Where(a => a.CustomerId == id).FirstOrDefault();
            if (cus_delete==null) {
                return NotFound();
            }
            _context.Customers.Remove(cus_delete);
            _context.SaveChanges();
            return NoContent();
        }





    }
}














        // Define Relationship and do crud operation customer, customer can view all the products and search the record and place an order.

        //[HttpGet]
        //public IEnumerable<Customer> Get()
        //{
        //    using (var context = new TOY_APIContext())
        //    {

                //Customer customer = new Customer();
                //customer.Name = "bharat";
                //customer.MobileNumber = "9383847273";

                //context.Customers.Add(customer);
                //context.SaveChanges();


                //removing customer
                //var rem = context.Customers.Where(a => a.Name.Contains("bharat"));
                
                //context.Customers.RemoveRange(rem);
                //context.SaveChanges();

                ////updating customer
                //var customer = context.Customers.First<Customer>();
                
                //customer.Name = "virat";
                //context.SaveChanges();


                //return context.Customers.ToList();

//            }


//        }
//    }
//}


/* using (var context = new ToysDbContext()) {


           // adding customer
           List<Customer> customers = new List<Customer>() {
           new Customer(){Name="bhavesh", MobileNumber =63785973}
           };


           //context.Customers.AddRange(customers);
           //context.SaveChanges();


           ////removing customer
           //var rem = context.Customers.Where(a => a.Name.Contains("bhavesh"));
           //context.Customers.RemoveRange(rem);
           //context.SaveChanges();


           ////updating customer
           //var customer = context.Customers.First<Customer>();
           //customer.Name = "virat";
           //context.SaveChanges();



           //getting the customer
           // Find a report of patient assigned to a particular doctor


           //var products = context.Toys.Include(a => a.Orders).ToList();
           //foreach (var i in products)
           //{
           //    Console.WriteLine($"toy name:  {i.ToyName}, Price: {i.ToyPrice} , type{i.ToyType}");

           //}

           //;
           //                var summ1 = context.Doctors.Include(Pre => Pre.Prescribes)
           //                                   .ThenInclude(doc => doc.Patient).Where(doc => doc.FirstName == "Ritesh")
           //                                   .ToList();

           //                foreach (var i in summ1)
           //                {
           //                    Console.WriteLine($"Doctors {i.FirstName}: has patients as follow:- ");

           //                    foreach (var j in i.Prescribes)
           //                    {
           //                        Console.WriteLine("Patients name: " + j.Patient.FirstName);
           //                    }
           //                }



           Console.WriteLine("enter your id to see records");
           int cus_id = Convert.ToInt32(Console.ReadLine());


               var entity = context.Customers.FirstOrDefault(item => item.CustomerId == cus_id);

               if (cus_id != entity.CustomerId)
               {
                   Console.WriteLine("id is not matching");
               }
               else
               {

               if (entity != null)

               Console.WriteLine("{0} {1} ", entity.Name, entity.MobileNumber);
               Console.ReadKey();
           }*/
