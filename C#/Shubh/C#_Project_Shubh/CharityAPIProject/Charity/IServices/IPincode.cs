using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IPincode: IGenericInterface<Pincode>
    {
        public IEnumerable GetPincodeByPincode(long pincode);

        public IEnumerable GetPincodeByCityId(long cityid);

        public IEnumerable GetPincodeByStateId(long sid);

        public IEnumerable GetPincodeByPostOfficeName(string pofficename);
    }
}
