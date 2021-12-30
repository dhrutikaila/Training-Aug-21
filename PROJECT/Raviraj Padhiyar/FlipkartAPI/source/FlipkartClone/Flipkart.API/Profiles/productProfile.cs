using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;

namespace Flipkart.API.Profiles
{
    public class productProfile : Profile
    {
        public productProfile()
        {
            CreateMap<Models.Brand, DTOs.BrandDto>();
            CreateMap<DTOs.BrandDto, Models.Brand>();
            CreateMap<Models.Product, DTOs.ProductDto>();

            CreateMap<DTOs.ProductDto, Models.Product>();
            CreateMap<Models.Category, DTOs.CategoryDto>();
            CreateMap<DTOs.CategoryDto, Models.Category>();
            CreateMap<Models.SubCatgory, DTOs.SubCatgoryDto>();
            CreateMap<DTOs.SubCatgoryDto, Models.SubCatgory>();
            CreateMap<Models.Discount, DTOs.DiscountDto>();
            CreateMap<DTOs.DiscountDto, Models.Discount>();
            CreateMap<Models.Inventory, DTOs.InventoryDto>();
            CreateMap<DTOs.InventoryDto, Models.Inventory>();
            CreateMap<Models.Seller, DTOs.SellerDto>();
            CreateMap<DTOs.SellerDto, Models.Seller>();
            CreateMap<Models.ProductImage, DTOs.ProductImageDto>();
            CreateMap<DTOs.ProductImageDto, Models.ProductImage>();

        }

    }
}
