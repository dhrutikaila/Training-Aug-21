using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface IUserTable
    {
        List<UserTable> GetUserTables();

        UserTable GetUserTable(int id);

        UserTable PostUserTable(UserTable user_table);

        UserTable PutUserTable(UserTable user_table);

        void DeleteUserTable(UserTable user_table);
    }
}
