using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_7_8
{
    class Student
    {
        public int StudentID { get; set; }
        public string StudentName { get; set; }
        public int Age { get; set; }
        public int StandardID { get; set; }
    }
    public class Standard
    {
        public int StandardID { get; set; }
        public string StandardName { get; set; }
    }
    class Practice_Exercise2
    {
        static void Main(string[] args)
        {
            ///////////////////////Query Syntax Practice-1 ////////////////////////////
            //List
            IList<string> stringList = new List<string>()
            {
                "c# Totorials", "VB.NET Tutorials", "Learn C++", "MVC Tutorials", "Java"
            };

            //LINQ Query syntax
            var result = from res in stringList
                         where res.Contains("Tutorials")
                         select res;

            foreach (var i in result)
            {
                Console.WriteLine(i);
            }

            ///////////////////////////Query Syntax Practice-2 /////////////////////////

            //Student collection
            IList<Student> studentList = new List<Student>()
            {
                new Student() { StudentID = 1, StudentName = "Hiren", Age = 25, StandardID =1 },
                new Student() { StudentID = 2, StudentName = "Jay", Age = 22, StandardID =1 },
                new Student() { StudentID = 3, StudentName = "Yash", Age = 21, StandardID =2 },
                new Student() { StudentID = 4, StudentName = "Dhaval", Age = 18, StandardID =2 },
                new Student() { StudentID = 5, StudentName = "Rahul", Age = 30}
            };
            //Standard Collection
            IList<Standard> standardList = new List<Standard>() {
            new Standard(){ StandardID = 1, StandardName="Standard 1"},
            new Standard(){ StandardID = 2, StandardName="Standard 2"},
            new Standard(){ StandardID = 3, StandardName="Standard 3"}
            };

            //LINQ Query Syntax
            var teenagerStudents = from res2 in studentList
                                   where res2.Age > 20 && res2.Age < 28
                                   select res2;

            foreach (Student r in teenagerStudents)
            {
                Console.WriteLine($"{r.StudentID} - {r.StudentName} - {r.Age}");
            }

            ///////////////////////////Method Syntax Practice-1 /////////////////////////

            IList<string> stringList2 = new List<string>()
            {
                "C", "C++", "C#", "Python", "Java"
            };

            var result2 = stringList2.Where(s => s.Contains("C"));

            foreach (var i in result2)
            {
                Console.WriteLine(i);
            }


            ///////////////////////////Method Syntax Practice-2 /////////////////////////

            IList<Student> studentList2 = new List<Student>()
            {
                new Student() { StudentID = 1, StudentName = "Hiren", Age = 25 },
                new Student() { StudentID = 2, StudentName = "Jay", Age = 22 },
                new Student() { StudentID = 3, StudentName = "Yash", Age = 21 },
                new Student() { StudentID = 4, StudentName = "Dhaval", Age = 18 },
                new Student() { StudentID = 5, StudentName = "Rahul", Age = 30}
            };

            var teenagerStudents2 = studentList2.Where(s => s.Age > 15 && s.Age < 25).ToList<Student>();

            foreach (Student r in teenagerStudents2)
            {
                Console.WriteLine($"{r.StudentID} - {r.StudentName} - {r.Age}");
            }

            /////////////////////////// WHERE /////////////////////////
            //WHERE - Query syntax
            var whereQuery = from r1 in studentList
                             where r1.Age > 12 && r1.Age < 20
                             select r1;
            foreach (var std in whereQuery)
                Console.WriteLine(std.StudentName);
            //WHERE - method syntax
            var whereMethod = studentList.Where((s, i) => {
                if (i % 2 == 0) // if it is even element
                    return true;

                return false;
            });
            foreach (var std in whereMethod)
                Console.WriteLine(std.StudentName);

            /////////////////////////// OfType /////////////////////////
            IList mixedList = new ArrayList();
            mixedList.Add(0);
            mixedList.Add("One");
            mixedList.Add("Two");
            mixedList.Add(3);
            mixedList.Add(new Student() { StudentID = 1, StudentName = "Bill" });

            //OfType - Query syntax
           var stringResult = from s in mixedList.OfType<string>()
                              select s;
            //OfType - method syntax
            var stringResult2 = mixedList.OfType<string>();

            /////////////////////////// orderby /////////////////////////

            //orderby - Query syntax
            var orderByResult = from res3 in studentList
                                orderby res3.StudentName descending
                                select res3;
            //orderby - method syntax
            var studentsInDescOrder = studentList.OrderByDescending(s => s.StudentName);

            /////////////////////////// groupby /////////////////////////

            //groupby - Query syntax
            var groupedResult = from s in studentList
                                group s by s.Age;

            //groupby - method syntax
            var groupedResult2 = studentList.GroupBy(s => s.Age);

            /////////////////////////// Join /////////////////////////
            //Join - Query syntax
            var innerJoin = from s in studentList
                            join st in standardList
                            on s.StudentID equals st.StandardID
                            select new
                            {
                                StudentName = s.StudentName,
                                StandardName = st.StandardName
                            };

            foreach(var res in innerJoin)
            {
                Console.WriteLine($"StudentName: {res.StudentName} & StandardName: {res.StandardName}");
            }
            //Join - Method syntax
            var innerJoin2 = studentList.Join
                             (standardList,
                             student => student.StandardID,
                             standard => standard.StandardID,
                             (student, standard) => new
                             { 
                                 StudentName = student.StudentName,
                                 StandardName = standard.StandardName
                             });


        }
    }
}
