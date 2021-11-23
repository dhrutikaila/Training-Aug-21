using System.Collections.Generic;
using System.Linq;
using ToyShop.Models;

namespace WebApi1.ToyData
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