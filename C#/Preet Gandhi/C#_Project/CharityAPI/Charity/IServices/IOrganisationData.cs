using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Models;

namespace CharityAPI.IServices
{
    public interface IOrganisationData : IGenericInterface<OrganisationData>
    {
        public bool Create(OrganisationData user, Image file, string fileName);
        public bool Update(long id, OrganisationData user, Image file);
        public OrganisationData GetByUserId(long id);
        public OrganisationData GetByOrganisationName(string name);
        //public IEnumerable GetByCity(long id);
    }
}
