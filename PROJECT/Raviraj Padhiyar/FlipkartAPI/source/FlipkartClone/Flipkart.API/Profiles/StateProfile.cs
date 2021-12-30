using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;

namespace Flipkart.API.Profiles
{
    public class StateProfile : Profile
    {

        public StateProfile()
        {
            CreateMap<Models.State, DTOs.StateDto>();
            CreateMap<DTOs.StateDto, Models.State>();
        }
    }
}
