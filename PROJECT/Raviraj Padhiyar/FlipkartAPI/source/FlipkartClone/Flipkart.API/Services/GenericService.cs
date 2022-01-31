using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.DbContexts;
using Flipkart.API.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Flipkart.API.Services
{
    public class GenericService<T> : IGenericService<T> where T : class
    {
        protected FlipkartAPIDBContext _context;
        protected DbSet<T> table;

        public GenericService(FlipkartAPIDBContext context)
        {
            this._context = context;
            table = _context.Set<T>();
        }

        public bool Any(Func<T, bool> predicate)
        {
            return table.Any(predicate);
        }

        public bool Any()
        {
            return table.Any();
        }

        public int Count(Func<T, bool> predicate)
        {
            return table.Count(predicate);
        }

        public void Create(T entity)
        {
            if(entity == null)
            {
                throw new ArgumentNullException(nameof(entity));
            }

            table.Add(entity);
            
        }

        public void Delete(T entity)
        {
            //table.Remove(entity);
            Update(entity);
        }

        public bool Exists(int id)
        {
            if(table.Find(id) != null)
            {
                return true;
            }
            return false;
        }

        public IEnumerable<T> Find(Func<T, bool> predicate)
        {
            return table.Where(predicate);
        }


        public IEnumerable<T> GetAll()
        {
            return table.ToList();
        }

        public async Task<IEnumerable<T>> GetAllAsync()
        {
            var entities = await table.ToListAsync();
            return entities;
        }

        public T GetById(int id)
        {
            return table.Find(id);
        }

        public async Task<T> GetByIdAsync(int id)
        {
            var entity =  await table.FindAsync(id);

            return entity;
        }

        public bool Save()
        {
           return  (_context.SaveChanges() >= 0);
        }

        public async Task<bool> SaveAsync()
        {
            return ( await _context.SaveChangesAsync() >= 0);
        }

        public void Update(T entity)    
        {
            table.Attach(entity);
            _context.Entry(entity).State = EntityState.Modified;
        }
    }
}
