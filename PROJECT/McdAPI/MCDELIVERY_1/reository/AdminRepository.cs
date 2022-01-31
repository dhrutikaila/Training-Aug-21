using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class AdminRepository : IAdmin
    {
        private readonly MCDELIVERY1Context _context;

        public AdminRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public Admin GetAdmin(int id)
        {
            var admin = _context.Admins.Find(id);
            return admin;
        }

        public List<Admin> GetAdmins()
        {
            return _context.Admins.ToList();
        }

        public void DeleteAdmin(Admin admin)
        { 
            _context.Admins.Remove(admin);
            _context.SaveChanges();
        }


        public Admin PostAdmin(Admin admin)
        {
            _context.Admins.Add(admin);
            _context.SaveChanges();
            return admin;
        }

        public Admin PutAdmin(Admin admin)
        {
            var ExistAdmin = _context.Admins.Find(admin.Id);
            if (ExistAdmin != null)
            {
                ExistAdmin.Name = admin.Name;
                _context.Admins.Update(ExistAdmin);
                _context.SaveChanges();
            }
            return admin;

        }
    }
}



