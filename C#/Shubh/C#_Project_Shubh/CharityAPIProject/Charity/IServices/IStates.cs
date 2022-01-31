using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IStates : IGenericInterface<States>
    {
        public IEnumerable GetStateByStateName(string sname);
     
    }
}
