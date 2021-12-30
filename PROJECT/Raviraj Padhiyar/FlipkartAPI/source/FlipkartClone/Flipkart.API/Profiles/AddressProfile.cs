using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;

namespace Flipkart.API.Profiles
{
    public class AddressProfile : Profile
    {
        public AddressProfile()
        {
            CreateMap<Models.Address, DTOs.AddressDto>();
            CreateMap<DTOs.AddressDto, Models.Address>();
        }
    }
}
