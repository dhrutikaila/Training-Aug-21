using System;
using System.Collections.Generic;
using System.Linq;

namespace Day7
{
    class Practice
    {
        public enum GradeLevel { FirstYear = 1, SecondYear, ThirdYear, FourthYear };

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Id { get; set; }
        public GradeLevel Year;
        public List<int> ExamScores;

        protected static List<Practice> Practices = new List<Practice>
    {
        new Practice {FirstName = "Terry", LastName = "Adams", Id = 120,
            Year = GradeLevel.SecondYear,
            ExamScores = new List<int> { 99, 82, 81, 79}},
        new Practice {FirstName = "Fadi", LastName = "Fakhouri", Id = 116,
            Year = GradeLevel.ThirdYear,
            ExamScores = new List<int> { 99, 86, 90, 94}},
        new Practice {FirstName = "Hanying", LastName = "Feng", Id = 117,
            Year = GradeLevel.FirstYear,
            ExamScores = new List<int> { 93, 92, 80, 87}},
        new Practice {FirstName = "Cesar", LastName = "Garcia", Id = 114,
            Year = GradeLevel.FourthYear,
            ExamScores = new List<int> { 97, 89, 85, 82}},
        new Practice {FirstName = "Debra", LastName = "Garcia", Id = 115,
            Year = GradeLevel.ThirdYear,
            ExamScores = new List<int> { 35, 72, 91, 70}},
        new Practice {FirstName = "Hugo", LastName = "Garcia", Id = 118,
            Year = GradeLevel.SecondYear,
            ExamScores = new List<int> { 92, 90, 83, 78}},
        new Practice {FirstName = "Sven", LastName = "Mortensen", Id = 113,
            Year = GradeLevel.FirstYear,
            ExamScores = new List<int> { 88, 94, 65, 91}},
        new Practice {FirstName = "Claire", LastName = "O'Donnell", Id = 112,
            Year = GradeLevel.FourthYear,
            ExamScores = new List<int> { 75, 84, 91, 39}},
        new Practice {FirstName = "Svetlana", LastName = "Omelchenko", Id = 111,
            Year = GradeLevel.SecondYear,
            ExamScores = new List<int> { 97, 92, 81, 60}},
        new Practice {FirstName = "Lance", LastName = "Tucker", Id = 119,
            Year = GradeLevel.ThirdYear,
            ExamScores = new List<int> { 68, 79, 88, 92}},
        new Practice {FirstName = "Michael", LastName = "Tucker", Id = 122,
            Year = GradeLevel.FirstYear,
            ExamScores = new List<int> { 94, 92, 91, 91}},
        new Practice {FirstName = "Eugene", LastName = "Zabokritski", Id = 121,
            Year = GradeLevel.FourthYear,
            ExamScores = new List<int> { 96, 85, 91, 60}}
    };
        protected static int GetPercentile(Practice s)
        {
            double avg = s.ExamScores.Average();
            return avg > 0 ? (int)avg / 10 : 0;
        }

        public static void QueryHighScores(int exam, int score)
        {
            var highScores = from Practice in Practices
                             where Practice.ExamScores[exam] > score
                             select new { Name = Practice.FirstName, Score = Practice.ExamScores[exam] };

            foreach (var item in highScores)
            {
                Console.WriteLine($"{item.Name,-15}{item.Score}");
            }
        }

        //static void Main(string[] args)
        //{
        //    //LINQ
        //    int[] nums = new int[] { 0, 1, 2 };
        //    var res = from a in nums where a < 3 orderby a select a;
        //    foreach (int i in res)
        //        Console.WriteLine(i);

        //    List<int> numbers1 = new List<int>() { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
        //    List<int> numbers2 = new List<int>() { 15, 14, 11, 13, 19, 18, 16, 17, 12, 10 };
        //    IEnumerable<int> filteringQuery =  from num in numbers1 where num < 3 || num > 7 select num;
        //    foreach (int i in filteringQuery)
        //        Console.WriteLine(i);


        //    //average
        //    double average = numbers1.Average();
        //    Console.WriteLine("average");
        //    Console.WriteLine(average);

        //    //concat
        //    IEnumerable<int> concatenationQuery = numbers1.Concat(numbers2);
        //    Console.WriteLine("concat");
        //    foreach (int i in concatenationQuery)
        //        Console.WriteLine(i);

        //    IEnumerable<int> largeNumbersQuery = numbers2.Where(c => c > 15);
        //    Console.WriteLine("query");
        //    foreach (int i in largeNumbersQuery)
        //        Console.WriteLine(i);

        //    //count
        //    int numCount1 = (from num in numbers1 where num < 3 || num > 7 select num).Count();
        //    Console.WriteLine("count");
        //    Console.WriteLine(numCount1);


        //    //object
        //    Practice.QueryHighScores(1, 90);

        //    //orderby
        //    var orderByDescendingResult = from s in Practices
        //                                  orderby s.FirstName descending
        //                                  select s;
        //    foreach (var i in orderByDescendingResult)
        //        Console.WriteLine(i.FirstName);

        //    //thenby
        //    Console.WriteLine("thenby");
        //    var thenByResult = Practices.OrderBy(s => s.FirstName).ThenBy(s => s.Id);
        //    foreach (var i in thenByResult)
        //        Console.WriteLine(i.FirstName);


        //    //join
        //    Console.WriteLine("join");
        //    IList<string> strList1 = new List<string>() {
        //        "One",
        //        "Two",
        //        "Three",
        //        "Four"
        //        };

        //    IList<string> strList2 = new List<string>() {
        //        "One",
        //        "Two",
        //        "Five",
        //        "Six"
        //        };

        //    var innerJoinResult = strList1.Join(// outer sequence 
        //                  strList2,  // inner sequence 
        //                  str1 => str1,    // outerKeySelector
        //                  str2 => str2,  // innerKeySelector
        //                  (str1, str2) => str1);

        //    foreach (var str in innerJoinResult)
        //    {
        //        Console.WriteLine("{0} ", str);
        //    }


        //    //outer join
        //    IList<Student> studentList = new List<Student>() {
        //        new Student() { StudentID = 1, StudentName = "John", Age = 18, StandardID = 1 } ,
        //        new Student() { StudentID = 2, StudentName = "Steve",  Age = 21, StandardID = 1 } ,
        //        new Student() { StudentID = 3, StudentName = "Bill",  Age = 18, StandardID = 2 } ,
        //        new Student() { StudentID = 4, StudentName = "Ram" , Age = 20, StandardID = 2 } ,
        //        new Student() { StudentID = 5, StudentName = "Ron" , Age = 21 }
        //    };

        //    IList<Standard> standardList = new List<Standard>() {
        //        new Standard(){ StandardID = 1, StandardName="Standard 1"},
        //        new Standard(){ StandardID = 2, StandardName="Standard 2"},
        //        new Standard(){ StandardID = 3, StandardName="Standard 3"}
        //    };

        //    var innerJoinResult1 = studentList.Join(// outer sequence 
        //                  standardList,  // inner sequence 
        //                  student => student.StandardID,    // outerKeySelector
        //                  standard => standard.StandardID,  // innerKeySelector
        //                  (student, standard) => new  // result selector
        //              {
        //                      StudentName = student.StudentName,
        //                      StandardName = standard.StandardName
        //                  });

        //    foreach (var obj in innerJoinResult1)
        //    {

        //        Console.WriteLine("{0} - {1}", obj.StudentName, obj.StandardName);
        //    }

        //    //select
        //    Console.WriteLine("select");
        //    var selectResult = studentList.Select(s => new {
        //        Name = s.StudentName,
        //        Age = s.Age
        //    });
        //    foreach (var item in selectResult)
        //        Console.WriteLine("Student Name: {0}, Age: {1}", item.Name, item.Age);


        //    //all/any
        //    Console.WriteLine("all/any");
        //    bool areAllStudentsTeenAger = studentList.All(s => s.Age > 12 && s.Age < 20);
        //    Console.WriteLine(areAllStudentsTeenAger);


        //    //contains
        //    Student std = new Student() { StudentID = 3, StudentName = "Bill" };
        //    bool result = studentList.Contains(std); //returns false
        //    Console.WriteLine(result);


        //    //aggregate
        //    IList<String> strList = new List<String>() { "One", "Two", "Three", "Four", "Five" };

        //    var commaSeperatedString = strList.Aggregate((s1, s2) => s1 + ", " + s2);

        //    Console.WriteLine(commaSeperatedString);

        //    //sum
        //    Console.WriteLine("sum");
        //    var sumOfAge = studentList.Sum(s => s.Age);
        //    Console.WriteLine(sumOfAge);

        //    //first
        //    IList<int> intList = new List<int>() { 7, 10, 21, 30, 45, 50, 87 };
        //    IList<string> strList3 = new List<string>() { null, "Two", "Three", "Four", "Five" };
        //    IList<string> emptyList = new List<string>();

        //    Console.WriteLine("1st Element in intList: {0}", intList.First());
        //    Console.WriteLine("1st Even Element in intList: {0}", intList.First(i => i % 2 == 0));

        //    Console.WriteLine("1st Element in strList: {0}", strList3.First());

        //    Console.WriteLine("emptyList.First() throws an InvalidOperationException");
        //    Console.WriteLine("-------------------------------------------------------------");
        //    //Console.WriteLine(emptyList.First());

        //    //last
        //    Console.WriteLine("Last Element in intList: {0}", intList.Last());

        //    Console.WriteLine("Last Even Element in intList: {0}", intList.Last(i => i % 2 == 0));

        //    Console.WriteLine("Last Element in strList: {0}", strList3.Last());

        //    Console.WriteLine("emptyList.Last() throws an InvalidOperationException");
        //    Console.WriteLine("-------------------------------------------------------------");
        //    //Console.WriteLine(emptyList.Last());

        //    //intersect
        //    Console.WriteLine("intersect");
        //    var result1 = strList1.Intersect(strList2);

        //    foreach (string str in result1)
        //        Console.WriteLine(str);

        //    //Union
        //    Console.WriteLine("Union");
        //    var resultu = strList1.Union(strList2);

        //    foreach (string str in resultu)
        //        Console.WriteLine(str);
            
        //    //take
        //    Console.WriteLine("take");
        //    var resultt = strList1.Take(2);

        //    foreach (string str in resultt)
        //        Console.WriteLine(str);
            
        //    //takeWhile
        //    Console.WriteLine("takeWhile");
        //    var resulttw = strList1.TakeWhile(s => s.Length > 4);

        //    foreach (string str in resulttw)
        //        Console.WriteLine(str);

        //    //  Deferred Execution
        //    var teenAgerStudents = from s in studentList.GetTeenAgerStudents()
        //                           select s;


        //    foreach (Student teenStudent in teenAgerStudents)
        //        Console.WriteLine("Student Name: {0}", teenStudent.StudentName);


        //    //Immediate Execution
        //    IList<Student> teenAgerStudents1 =
        //                    studentList.Where(s => s.Age > 12 && s.Age < 20).ToList();


        //    //let keyword
        //    var lowercaseStudentNames = from s in studentList
        //                                let lowercaseStudentName = s.StudentName.ToLower()
        //                                where lowercaseStudentName.StartsWith("r")
        //                                select lowercaseStudentName;

        //    foreach (var name in lowercaseStudentNames)
        //        Console.WriteLine(name);


        //    //into
        //    var teenAgerStudents2 = from s in studentList
        //                           where s.Age > 12 && s.Age < 20
        //                           select s into teenStudents
        //                           where teenStudents.StudentName.StartsWith("B")
        //                           select teenStudents;
        //    foreach (var name in teenAgerStudents2)
        //        Console.WriteLine(name);


        //}
    }
    public class Student
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
    public static class EnumerableExtensionMethods
    {
        public static IEnumerable<Student> GetTeenAgerStudents(this IEnumerable<Student> source)
        {

            foreach (Student std in source)
            {
                Console.WriteLine("Accessing student {0}", std.StudentName);

                if (std.Age > 12 && std.Age < 20)
                    yield return std;
            }
        }
    }

}
