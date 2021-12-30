using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;

namespace Flipkart.API.Profiles
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile()
        {
            CreateMap<Models.Customer, DTOs.CustomerDto>();
            CreateMap<Models.CustomerAddress, DTOs.CustomerAddressDto>();
            CreateMap<Models.PaymentDetail, DTOs.PaymentDetailDto>();

            CreateMap<DTOs.CustomerDto,Models.Customer>();
            CreateMap<DTOs.CustomerAddressDto, Models.CustomerAddress>();
            CreateMap<DTOs.PaymentDetailDto,Models.PaymentDetail>();
        }
    }
}
