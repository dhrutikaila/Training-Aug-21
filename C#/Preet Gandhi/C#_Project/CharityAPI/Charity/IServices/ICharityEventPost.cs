using CharityAPI.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface ICharityEventPost : IGenericInterface<CharityEventPost>
    {
        public bool Create(CharityEventPost post, Image file, string fileName);
        public bool Update(long id, CharityEventPost post, Image file);
        public IEnumerable GetChEvPostByUserName(string name);
        public IEnumerable GetChEvPostByUserId(long id);
        public IEnumerable GetChEvPostByEventId(long id);
        public IEnumerable GetChEvPostByEventName(string name);
        public IEnumerable GetChEvPostByDate(DateTime date);

    }
}
