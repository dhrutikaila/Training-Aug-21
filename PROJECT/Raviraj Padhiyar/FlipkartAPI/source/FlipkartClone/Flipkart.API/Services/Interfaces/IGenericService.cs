using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.Services.Interfaces
{
    public interface IGenericService<T> where T:class
    {
        void Create(T entity);
        IEnumerable<T> GetAll();
        Task<IEnumerable<T>> GetAllAsync();
        T GetById(int id);
        Task<T> GetByIdAsync(int id);

        void Update(T entity);

        void Delete(T entity);
        bool Save();
        Task<bool> SaveAsync();

        bool Exists(int id);
        IEnumerable<T> Find(Func<T, bool> predicate);

        int Count(Func<T, bool> predicate);
        bool Any(Func<T, bool> predicate);
        bool Any();
    }
}
