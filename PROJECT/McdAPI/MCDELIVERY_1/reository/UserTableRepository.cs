using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class UserTableRepository : IUserTable
    {
        private readonly MCDELIVERY1Context _context;

        public UserTableRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteUserTable(UserTable user_table)
        {
            _context.UserTables.Remove(user_table);
            _context.SaveChanges();
        }

        public UserTable GetUserTable(int id)
        {
            var user = _context.UserTables.Find(id);
            return user;
        }

        public List<UserTable> GetUserTables()
        {
            return _context.UserTables.ToList();
        }

        public UserTable PostUserTable(UserTable user_table)
        {
            _context.UserTables.Add(user_table);
            _context.SaveChanges();
            return user_table;
        }

        public UserTable PutUserTable(UserTable user_table)
        {
            var ExistUser = _context.UserTables.Find(user_table.UsersId);
            if (ExistUser != null)
            {
                ExistUser.Name = user_table.Name;
                _context.UserTables.Update(ExistUser);
                _context.SaveChanges();
            }
            return user_table;
        }
    }
}
