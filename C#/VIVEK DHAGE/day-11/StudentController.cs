using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Db_First_Eframework1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Db_First_Eframework1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StudentController : ControllerBase
    {
        
        [HttpGet]
        public IEnumerable<Student> Get()
        {
            using (var context = new schoolContext()) {

                //1. return all students :->
                //return context.Students.ToList();

                //2  return students by roll number
                //return context.Students.Where(a => a.RollNum == 12).ToList();
                //return context.Students.Where(a => a.Id== "12").ToList();
                //return context.Students.ToList();


                //3. to add
                //Student st = new Student();
                //st.Name = "Gattu";
                //st.Id = "10";
                //st.RollNum = 20;
                //return context.Students.ToList();


                //context.Students.Add(st);
                //context.SaveChanges();
                //return context.Students.ToList();

                //4. to update the data
                //Student st = context.Students.Where(a => a.Name == "vivek").FirstOrDefault();
                //st.Name ="virat";
                //return context.Students.ToList();


                //context.SaveChanges();

                //5. to delete the data
                //Student student = context.Students.Where(a => a.Id == "4").FirstOrDefault();
                //context.Students.Remove(student);
                //context.SaveChanges();
                //return context.Students.ToList();
                return context.Students.ToList();

                var st = context.Students
                    .Include(a => a.Name)
                    .ToList();
            }
            
        }
    }
}
