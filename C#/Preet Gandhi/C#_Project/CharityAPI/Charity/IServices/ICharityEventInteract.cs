using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Models;

namespace CharityAPI.IServices
{
    public interface ICharityEventInteract : IGenericInterface<CharityEventInteract>
    {
        public IEnumerable GetByEventId(long id);
        public IEnumerable GetByUserId(long id);
        public IEnumerable GetInterestedByEventId(long id);
        public IEnumerable GetInterestedByUserId(long id);
        public IEnumerable GetGoingByEventId(long id);
        public IEnumerable GetGoingByUserId(long id);
    }
}
