using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using WebApiExample1.Models;

namespace WebApiExample1.Persistence
{
    public class MyDbContext : DbContext
    {
        public DbSet<Make> Makes  { get; set; }
        public MyDbContext(DbContextOptions<MyDbContext> options)
            : base(options)
        {   
        }
    }
}
