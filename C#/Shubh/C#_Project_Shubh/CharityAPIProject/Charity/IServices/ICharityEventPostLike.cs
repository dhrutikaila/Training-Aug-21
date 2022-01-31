using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface ICharityEventPostLike : IGenericInterface<CharityEventPostLike>
    {
        public IEnumerable GetPostLikeDetailsByPostLikeID(long postlikeid);

        public IEnumerable GetPostLikeDetailsByUserID(long userid);

        public long GetNumberOfLikesByPostId(long postid);

        public long GetNumberOfDisLikesByPostId(long postid);
    }
}
