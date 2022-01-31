using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface ICartDetails
    {
        List<CartDetail> GetCartDetails();

        CartDetail GetCartDetail(int id);

        CartDetail PostCartDetail(CartDetail cartdetail);

        CartDetail PutCartDetails(CartDetail cartdetail);

        void DeleteCartDetail(CartDetail cartdetail);
    }
}
