using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace AssignmentDay4
{
    class Student
    {
        public string Name { get; set; }
    }
    public class NameException : Exception
    {
        public NameException(String name)
            : base(String.Format("Invalid Student Name: {0}", name))
        {

        }
    }
    class Assignment2Day4
    {
        private static void ValidateName(Student std)
        {
            Regex regex= new Regex("([a-zA-Z]{3,30})");

            if (!regex.IsMatch(std.Name))
                throw new NameException(std.Name);

        }
        static void Main(string[] args)
        {
            try
            {
                Student s1 = new Student();
                Console.WriteLine("Enter Student's Name:");
                s1.Name = Console.ReadLine();
                ValidateName(s1);
                Console.WriteLine("You have entered correct name");
            }
            catch (NameException e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}