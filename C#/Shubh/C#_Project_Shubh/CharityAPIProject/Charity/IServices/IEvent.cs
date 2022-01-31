using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.IServices
{
    public interface IEvent: IGenericInterface<CharityEvent>
    {
        public bool Create(CharityEvent events, Image file, string fileName);
        public bool Update(long id, CharityEvent entity, Image file);
        public IEnumerable GetByName(string name);
        public IEnumerable GetByType(string type);
        public IEnumerable GetByCity(long cityId);
        public IEnumerable GetByPincode(long pincode);
        public IEnumerable GetByOrganisation(long orgId);
        public IEnumerable GetByDate(DateTime date);
        public IEnumerable GetCurrent();
    }
}
