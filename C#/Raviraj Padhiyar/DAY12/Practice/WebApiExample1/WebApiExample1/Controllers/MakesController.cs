using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApiExample1.Controllers.Resources;
using WebApiExample1.Models;
using WebApiExample1.Persistence;

namespace WebApiExample1.Controllers
{
    public class MakesController : Controller
    {
        private readonly MyDbContext _context;
        public readonly IMapper _mapper;

        public MakesController(MyDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        

        // GET: Makes
        [HttpGet("/api/makes")]
        public async Task<IEnumerable<MakeResource>> GetMakes()
        {
            var makes = await _context.Makes.Include(m => m.Models).ToListAsync();
            return _mapper.Map<List<Make>, List<MakeResource>>(makes);
        }


        
    }
}
