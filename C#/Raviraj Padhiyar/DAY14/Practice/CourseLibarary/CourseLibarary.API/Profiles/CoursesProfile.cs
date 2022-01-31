using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;

namespace CourseLibarary.API.Profiles
{
    public class CoursesProfile : Profile
    {
        public CoursesProfile()
        {
            CreateMap<CourseLibrary.API.Entities.Course, Models.CourseDto>();
            CreateMap<Models.CourseForCreationDto, CourseLibrary.API.Entities.Course>();
            CreateMap<Models.CourseForUpdate, CourseLibrary.API.Entities.Course>()
        }
    }
}
