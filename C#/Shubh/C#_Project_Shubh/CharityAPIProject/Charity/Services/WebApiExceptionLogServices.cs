using CharityAPI.IServices;
using CharityAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class WebApiExceptionLogServices : GenericRepository<WebApiExceptionLog>, IWebApiExceptionLog
    {

        public WebApiExceptionLogServices(CharityAPIContext context) : base(context)
        {

        }
    }
}
