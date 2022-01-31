﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;
using ZomatoApp.DBContext;

namespace ZomatoApp.Repository
{
    public abstract class GenericRepository<T> : GenericInterface<T> where T : class
    {
        protected readonly ZomatoApp_ProjectContext context;
       

        public GenericRepository(ZomatoApp_ProjectContext _context)
        {
            context = _context;
        }

        public bool Any(Func<T, bool> predicate)
        {
            return context.Set<T>().Any(predicate);
        }

        public bool Any()
        {
            return context.Set<T>().Any();
        }

        public bool Any(int id)
        {
            throw new NotImplementedException();
        }
        public int Count(Func<T, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public  void Create(T entity)
        {
            context.Add(entity);
            
             context.SaveChanges();       
        }

        public void Delete(T entity)
        {
            context.Remove(entity);
            context.SaveChanges();
        }

        public IEnumerable<T> Find(Func<T, bool> predicate)
        {
            return context.Set<T>().Where(predicate);
        }

        public virtual IEnumerable<T> GetAll()
        {
            return context.Set<T>();
        }

        public virtual T GetById(int id)
        {
            return context.Set<T>().Find(id);
        }

        public void Update(T entity)
        {
            context.Entry(entity).State = EntityState.Modified;
            context.SaveChanges();
        }
        public T FirstOrDefault(Func<T, bool> predicate)
        {
            return context.Set<T>().FirstOrDefault(predicate);  
        }
    }
}
