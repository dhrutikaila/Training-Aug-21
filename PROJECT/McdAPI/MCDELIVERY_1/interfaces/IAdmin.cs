using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
     public interface IAdmin
    {
        List<Admin> GetAdmins();

        Admin GetAdmin(int id);

        Admin PostAdmin(Admin admin);

        Admin PutAdmin(Admin admin);

        void DeleteAdmin(Admin admin);

    }
}