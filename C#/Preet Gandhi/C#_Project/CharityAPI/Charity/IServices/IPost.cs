using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IPost : IGenericInterface<Post>
    {
        public bool Create(Post post, Image file, string fileName);
        public bool Update(long id, Post post, Image file);
        public IEnumerable GetPostByUserName(string name);
        public IEnumerable GetPostByUserId(long id);
        public IEnumerable GetPostByPincode(long id);
        public IEnumerable GetPostByPincodeId(long id);
        public IEnumerable GetPostByCity(long id);
        public IEnumerable GetPostByState(long id);
        public IEnumerable GetPostByLocation(string name);
        public IEnumerable GetPostByRequirement(long id);

        public IEnumerable GetPostByDate(DateTime date);


    }
}
