using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication1.Models;

namespace WebApplication1
{
    public class Program
    {

    public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
            using (var context = new HOSPITALContext())
            {
            //insert data
                var std = new Doctor()
                {
                    DoctorName = "Bill"
                };

                context.Doctors.Add(std);
                context.SaveChanges();
                Console.ReadLine();
            }
            //update data
            using (var context = new HOSPITALContext())
            {
                var std = context.Doctors.First<Doctor>();
                std.DoctorName = "Steve";
                context.SaveChanges();
            }

            //delete data
            using (var context = new HOSPITALContext())
            {
                var std = context.Doctors.First<Doctor>();
                context.Doctors.Remove(std);

                // or
                // context.Remove<docotor>(std);

                context.SaveChanges();
            }
            //Display summary report of Doctor and patient (use Include method)

            var context = new HOSPITALContext();

            var studentWithGrade = context.Doctors
                                    .=("Select * from doctor where FirstName ='Bill'")
                                    .Include(s => s.Grade)
                                    .FirstOrDefault();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
