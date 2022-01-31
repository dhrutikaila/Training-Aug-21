using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// Create a user defined Exception Class AgeException. If Age is less than 0 it should be thrown an exception. 
//And you need to handle that exception in student class.
//Note to create a user defined exception class you need to derive it from System.Exception class.
namespace Day4
{
    internal class AgeException : Exception
    {
        public AgeException()
        {
            Console.WriteLine("Age cannot be less than zero!!");
        }
    }

    internal class Student
    {
        private int age;

        private Student()
        {

        }
        public Student(int age)
        {
            this.age = age;
            try
            {
                if (age < 0)
                {
                    throw new AgeException();
                }
                else
                {
                    Console.WriteLine("Ok");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
        }
    }

    internal class Assignment1
    {
        private static void Main(string[] args)
        {
            Console.WriteLine("Enter your age:");
            int age = Convert.ToInt32(Console.ReadLine());
            Student s = new Student(age);
            Console.ReadKey();
        }
    }
}
