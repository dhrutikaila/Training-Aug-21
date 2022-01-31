using Microsoft.AspNetCore.Mvc;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using ZomatoApp.DBContext;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ViewProductController : ControllerBase
    {
      
        private readonly IViewProduct View;
        public ViewProductController(IViewProduct view)
        {
            View = view;
           
        }

        //View all products
        [HttpGet]
        public IEnumerable<ViewProduct> AddNewDataMethod()
        {
            return View.GetAll();
        }

            }
}
