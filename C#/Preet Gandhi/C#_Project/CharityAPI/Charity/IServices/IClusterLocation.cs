using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Authentication;
using CharityAPI.Models;

namespace CharityAPI.IServices
{
    public interface IClusterLocation: IGenericInterface<ClusterLocations>
    {
        public IEnumerable GetByPincodeId(long id);
        public IEnumerable GetByPincode(long pincode);
        public IEnumerable GetByCityId(long id);
        public IEnumerable GetByCityName(string name);
        public IEnumerable GetByStateId(long id);
        public IEnumerable GetByLocationName(string name);
        public IEnumerable GetByRequirementId(long id);
    }
}
