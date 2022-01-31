using AutoMapper;
using ZomatoApp.Models;
using ZomatoApp.DBContext;

namespace ZomatoApp.Helpers
{
    public class AppMapper : Profile
    {
        public AppMapper()
        {
            CreateMap<ZomatoApp_ProjectContext, Cart>().ReverseMap();
        }


    }
}
