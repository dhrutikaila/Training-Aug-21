using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ToyCompany.API.Models;

namespace ToyCompany.API.Repository
{
    public class ToyCompanyRepository : IToyCompanyRepository
    {
        private readonly ToyCompanyDbContext _context;

        public ToyCompanyRepository(ToyCompanyDbContext context)
        {
            _context = context ??
                throw new ArgumentNullException(nameof(context));
        }

        public IEnumerable<Customers> GetCustomers()
        {
            return _context.Customers.ToList<Customers>();
        }

        public Customers GetCustomer(int customerId)
        {
            if(customerId < 1)
            {
                throw new ArgumentNullException(nameof(customerId));
            }

            return _context.Customers.FirstOrDefault(a => a.Id == customerId);
        }

        public void AddCustomer(Customers customer)
        {
            if(customer == null)
            {
                throw new ArgumentNullException(nameof(customer));
            }

            //customer.Id = _context.Customers.Count() + 1;

            //foreach (var order in customer.OrderHeaders)
            //{
            //    order.Id = _context.OrderHeaders.Last().Id + 1;
            //}

            _context.Customers.Add(customer);
        }

        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }

        public IEnumerable<OrderHeaders> GetOrders(int customerId)
        {
            return _context.OrderHeaders.Where(o => o.CustomerId == customerId).ToList<OrderHeaders>();
        }
    }
}
