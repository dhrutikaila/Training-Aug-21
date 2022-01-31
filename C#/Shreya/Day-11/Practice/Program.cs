using EFCoreExample.Models;
using System.Linq;
using System.Collections.Generic;
using System;
using Microsoft.EntityFrameworkCore;

namespace EFCoreExample
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new SchoolContext())
            {
                //var grade=new Grade()
                //{
                //   GradeName="A"
                //};
                var std = new Student()
                {
                    Name = "Shreya",
                    GradeID = 1
                };
                var course = new Course()
                {
                    CourseName = "CBA"
                };
                context.Students.Add(std);
                context.Courses.Add(course);
                //context.Grades.Add(grade);
                context.SaveChanges();
                Console.WriteLine("Added successfully!");
                }
            //var context1 = new SchoolContext();
            //var StudentGrade = context1.Students.Where(s => s.Name == "Shreya")
            //                                        .Include(s => s.grade).FirstOrDefault();
            //foreach (var stu in StudentGrade)
            //{

            //}
            Console.ReadLine();
        }
    }
}
