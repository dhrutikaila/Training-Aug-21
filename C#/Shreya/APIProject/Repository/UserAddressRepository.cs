using APIProject.Interface;
using APIProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Repository
{
    public class UserAddressRepository :GenericRepository<UserAddress>,IUserAddress
    {
        public UserAddressRepository(MamaEarthDBContext context):base(context)
        {

        }
    }
}
