using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class OffersRepository : IOffers
    {
        private readonly MCDELIVERY1Context _context;

        public OffersRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteOffer(Offer offer)
        {
            _context.Offers.Remove(offer);
            _context.SaveChanges();
        }

        public Offer GetOffer(int id)
        {
            var offer = _context.Offers.Find(id);
            return offer;
        }

        public List<Offer> GetOffers()
        {
            return _context.Offers.ToList();
        }


        public Offer PostOffer(Offer offer)
        {
            _context.Offers.Add(offer);
            _context.SaveChanges();
            return offer;
        }

        public Offer PutOffer(Offer offer)
        {
            var ExistOffer = _context.Offers.Find(offer.OfferId);
            if (ExistOffer != null)
            {
                ExistOffer.Name= offer.Name;
                _context.Offers.Update(ExistOffer);
                _context.SaveChanges();
            }
            return offer;
        }

    }
}
