using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class DealsRepository : IDeals
    {
        private readonly MCDELIVERY1Context _context;

        public DealsRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

 
        public void DeleteDeal(Deal deal)
        {
            _context.Deals.Remove(deal);
            _context.SaveChanges();
        }

        public Deal GetDeal(int id)
        {
            var deal = _context.Deals.Find(id);
            return deal;
        }

        public List<Deal> GetDeals()
        {
            return _context.Deals.ToList();
        }


        public Deal PostDeal(Deal deal)
        {
            _context.Deals.Add(deal);
            _context.SaveChanges();
            return deal;
        }

        public Deal PutDeal(Deal deal)
        {
            var ExistDeal = _context.Deals.Find(deal.DealsId);
            if (ExistDeal != null)
            {
                ExistDeal.Name = deal.Name;
                _context.Deals.Update(ExistDeal);
                _context.SaveChanges();
            }
            return deal;
        }
    }
}

