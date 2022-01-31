using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IUrgency: IGenericInterface<Urgency>
    {
        public IEnumerable GetUrgencyByPostId(long postid);

        public IEnumerable GetUrgencyByUserId(long userid);
    }
}
