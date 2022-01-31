//Create a list which will store 5 student names and then display it search it index number

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_5
{
    class Practice_Exercise1
    {
        static void Main(string[] args)
        {
            List<string> student = new List<string>();

            Console.WriteLine("Enter names of 5 students:");
            for (int i = 0; i < 5; i++)
            {
                string studentName = Console.ReadLine();
                student.Add(studentName);
            }

            Console.WriteLine("Enter index number");
            int num = Convert.ToInt32(Console.ReadLine());
            if (num <= student.Count)
            {
                Console.WriteLine($"Name is: {student[num]}");
            }
            else 
            {
                Console.WriteLine("Invalid input");
            }
            
        }
    }
}
