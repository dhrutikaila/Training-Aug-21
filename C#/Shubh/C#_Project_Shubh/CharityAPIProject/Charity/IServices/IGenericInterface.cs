using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IGenericInterface<T> where T : class
    {
        IEnumerable<T> GetAll();
        T GetById(long id);
        bool Create(T entity);
        bool Update(long id, T entity);
        bool Delete(long id);
        IEnumerable<T> Find(Func<T, bool> predicate);
        int Count(Func<T, bool> predicate);
        bool Any(Func<T, bool> predicate);
        bool Any();
    }

}
