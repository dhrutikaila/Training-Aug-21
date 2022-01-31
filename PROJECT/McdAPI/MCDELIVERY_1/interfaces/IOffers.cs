using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface IOffers
    {
        List<Offer> GetOffers();

        Offer GetOffer(int id);

        Offer PostOffer(Offer offer);

        Offer PutOffer(Offer offer);

        void DeleteOffer(Offer offer);
    }
}
