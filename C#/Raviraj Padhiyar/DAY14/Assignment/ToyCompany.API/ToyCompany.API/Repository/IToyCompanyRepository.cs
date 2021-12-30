using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ToyCompany.API.Models;

namespace ToyCompany.API.Repository
{
    public interface IToyCompanyRepository
    {
        IEnumerable<Customers> GetCustomers();

        Customers GetCustomer(int customerId);

        void AddCustomer(Customers customers);

        bool Save();
        IEnumerable<OrderHeaders> GetOrders(int customerId);
    }
}
