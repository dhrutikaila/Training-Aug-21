using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface ISpam: IGenericInterface<Spam>
    {
        public IEnumerable GetSpamByUserId(long userid);

        public IEnumerable GetSpamByPostId(long postid);
    }
}
