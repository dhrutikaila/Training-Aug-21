using Day_14_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Repository
{
    public class SqlCustomerData : ICustomerData
    {
        private ToyCompanyContext _toyCompanyContext;
        public SqlCustomerData(ToyCompanyContext toyCompanyContext)
        {
            _toyCompanyContext = toyCompanyContext;
        }
        public Customer AddCustomer(Customer customer)
        {
            //customer.CustomerId = Guid.NewGuid();
            _toyCompanyContext.Customer.Add(customer);
            _toyCompanyContext.SaveChanges();
            return customer;
        }

        public void DeleteCustomer(Customer customer)
        {
            _toyCompanyContext.Customer.Remove(customer);
            _toyCompanyContext.SaveChanges();
        }

        public Customer EditCustomer(Customer customer)
        {
            var ExistingCustomer = _toyCompanyContext.Customer.Find(customer.CustomerId);
            if (ExistingCustomer != null)
            {
                ExistingCustomer.CustomerName = customer.CustomerName;
                _toyCompanyContext.Customer.Update(ExistingCustomer);
                _toyCompanyContext.SaveChanges();
            }
            return customer;
        }

        public Customer GetCustomer(int id)
        {
            var customer = _toyCompanyContext.Customer.Find(id);
            return customer;
        }

       
        public List<Customer> GetCustomers()
        {
            return _toyCompanyContext.Customer.ToList();
        }

    
    }
}
