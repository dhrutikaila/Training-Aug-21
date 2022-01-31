using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class GenericRepository<T> : IGenericInterface<T> where T : class
    {
        protected readonly CharityAPIContext context;
        public GenericRepository(CharityAPIContext _context)
        {
            context = _context;
        }
        public virtual bool Create(T entity)
        {
            context.Add(entity);
            context.SaveChanges();
            return true;
        }

        public virtual bool Delete(long id)
        {
            var a = context.Remove(id);
            context.SaveChanges();
            return true;
        }

        public T GetById(long id)
        {
            return context.Set<T>().Find(id);
        }

        public virtual IEnumerable<T> GetAll()
        {
            return context.Set<T>();
        }
        public virtual bool Update(long id, T entity)
        {
            context.Entry(entity).State = EntityState.Modified;
            context.SaveChanges();
            return true;
        }

        public IEnumerable<T> Find(Func<T, bool> predicate)
        {
            return context.Set<T>().Where(predicate);
        }

        public bool Any(Func<T, bool> predicate)
        {
            return context.Set<T>().Any(predicate);
        }

        public bool Any()
        {
            return context.Set<T>().Any();
        }

        public int Count(Func<T, bool> predicate)
        {
            throw new NotImplementedException();
        }
    }
}
