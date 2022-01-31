using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_14_Assignment.Models;

namespace Day_14_Assignment.ToyData
{
    public class SqlToyData : IToyData
    {
        private readonly ToyCompanyContext _toyCompanyContext;
        public SqlToyData(ToyCompanyContext toyContext)
        {
            _toyCompanyContext = toyContext;
        }
        public Toy GetToy(int id)
        {
            var toy = _toyCompanyContext.Toys.Find(id);
            return toy;
        }

        public List<Toy> GetToys()
        {
            return _toyCompanyContext.Toys.ToList();
        }
    }
}
