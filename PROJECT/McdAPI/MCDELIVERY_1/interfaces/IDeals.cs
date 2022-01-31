using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface IDeals
    {
        List<Deal> GetDeals();

        Deal GetDeal(int id);

        Deal PostDeal(Deal deal);

        Deal PutDeal(Deal deal);

        void DeleteDeal(Deal deal);
    }
}
