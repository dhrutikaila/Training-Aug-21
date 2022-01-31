using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day15_2.Models
{
    public class MainDBContext:DbContext
    {
        public MainDBContext(DbContextOptions<MainDBContext> dbContextOptions)
        : base(dbContextOptions)
        {
        }
        public DbSet<employee> employees { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {
            //optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-R8JIN40;Initial Catalog=RestDB15;Integrated Security=True");
        }
    }
}
