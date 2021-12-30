using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class CartDetailsRepository : ICartDetails
    {
        private readonly MCDELIVERY1Context _context;

        public CartDetailsRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteCartDetail(CartDetail cartdetail)
        {
            _context.CartDetails.Remove(cartdetail);
            _context.SaveChanges();
        }

        public CartDetail GetCartDetail(int id)
        {
            var cartdetail = _context.CartDetails.Find(id);
            return cartdetail;
        }

        public List<CartDetail> GetCartDetails()
        {
            return _context.CartDetails.ToList();
        }

        public CartDetail PostCartDetail(CartDetail cartdetail)
        {
            _context.CartDetails.Add(cartdetail);
            _context.SaveChanges();
            return cartdetail;
        }

        public CartDetail PutCartDetails(CartDetail cartdetail)
        {

            var ExistCartdetail = _context.CartDetails.Find(cartdetail.CartDetailId);
            if (ExistCartdetail != null)
            {
                ExistCartdetail.Product = cartdetail.Product;
                _context.CartDetails.Update(ExistCartdetail);
                _context.SaveChanges();
            }
            return cartdetail;
        }

    }
}

/*
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
 */
