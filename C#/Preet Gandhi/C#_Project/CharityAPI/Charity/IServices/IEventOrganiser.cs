using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IEventOrganiser:IGenericInterface<CharityEventOrganiser>
    {
        public IEnumerable GetByEventId(long EeventId);
        public IEnumerable GetByOrganiserId(long orgId);
    }
}
