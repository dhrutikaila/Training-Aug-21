using AuthExampleFinal.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AuthExampleFinal.Data
{
    public class DataContext : IdentityDbContext<ApplicationUser>
    {
        public DataContext(DbContextOptions <DataContext> options)
            :base(options)        
        {

        }
        public DbSet<ApplicationUser> applicationUsers { get; set; }

    }
}
