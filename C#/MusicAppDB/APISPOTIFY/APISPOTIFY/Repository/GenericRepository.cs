﻿using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using Microsoft.EntityFrameworkCore;
using MusicAppDB.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Repository
{

    public class GenericRepository<T> : IGenericInterface<T> where T : class
    {
        protected readonly MusicAppDBContext context;
        

        public GenericRepository(MusicAppDBContext _context)
        {
            context = _context;
        }

       
        public virtual void Create(T entity)
        {
            context.Add(entity);
            context.SaveChanges();
        }

        public virtual void Delete(int id)
        {
            context.Remove(id);
            context.SaveChanges();
        }

        public T GetById(int id)
        {
            return context.Set<T>().Find(id);
        }

        public virtual IEnumerable<T> GetAll()
        {
            return context.Set<T>();
        }

        public virtual void Update(int id, T entity)
        {
            context.Entry(entity).State = EntityState.Modified;
            context.SaveChanges();
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