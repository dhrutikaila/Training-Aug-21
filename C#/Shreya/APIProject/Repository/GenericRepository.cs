using APIProject.Interface;
using APIProject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class GenericRepository<T> : IGenericInterface<T> where T : class
    {
        protected readonly MamaEarthDBContext _mamaEarthDBContext;
        public GenericRepository(MamaEarthDBContext mamaEarthDBContext)
        {
            _mamaEarthDBContext = mamaEarthDBContext;
        }
        public virtual void Create(T entity)
        {
            _mamaEarthDBContext.Add(entity);
            _mamaEarthDBContext.SaveChanges();
        }

        public void Delete(T entity)
        {
            _mamaEarthDBContext.Remove(entity);
            _mamaEarthDBContext.SaveChanges();
        }

        public IEnumerable<T> GetAll()
        {
            return _mamaEarthDBContext.Set<T>();
        }

        public T GetById(int id)
        {
            return _mamaEarthDBContext.Set<T>().Find(id);
        }

        public void Update(int id ,T enity)
        {
            _mamaEarthDBContext.Entry(enity).State = EntityState.Modified;
            _mamaEarthDBContext.SaveChanges();
        }
    }
}
