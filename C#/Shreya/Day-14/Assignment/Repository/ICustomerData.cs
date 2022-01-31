using Day_14_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Repository
{
    public interface ICustomerData
    {
        List<Customer> GetCustomers();
        Customer GetCustomer(int id);
        Customer AddCustomer(Customer customer);
        void DeleteCustomer(Customer customer);
        Customer EditCustomer(Customer customer);
    }
}
