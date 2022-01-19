using System;
using System.Collections.Generic;

namespace MusicAppDB.IRepository
{
    public interface IGenericInterface<T>
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        void Create(T entity);
        void Update(int id, T entity);
        void Delete(int id);
        IEnumerable<T> Find(Func<T, bool> predicate);
        int Count(Func<T, bool> predicate);
        bool Any(Func<T, bool> predicate);
        bool Any();
    }
}