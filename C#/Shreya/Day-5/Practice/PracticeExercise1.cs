using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollectionPractice
{
    class PracticeExercise1
    {
        static void Main(string[] args)
        {

            List<string> students = new List<string>();
            students.Add("Shreya");
            students.Add("Diya");
            students.Add("Dharal");
            students.Add("Bhavya");
            students.Add("Dhyanvi");
            Console.WriteLine("Students name are display here ...");
            foreach (var s in students)
            {
                Console.WriteLine(s);
            }
            students.Insert(1, "Riya");//insert data at 1st index
            Console.WriteLine("After inserting new student...");
            foreach (var s in students)
            {
                Console.WriteLine(s);
            }
            Console.WriteLine("Total number of students are :"+students.Count);
            Console.WriteLine("Index number of shreya is " + students.IndexOf("Shreya"));
            Console.ReadLine();
        }
    }
}
