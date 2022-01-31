using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;

namespace Flipkart.API.Profiles
{
    public class CityProfile : Profile
    {
        public CityProfile()
        {
            CreateMap<Models.City, DTOs.CityDto>();
            CreateMap<DTOs.CityDto, Models.City>();
        }
    }
}
