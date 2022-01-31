using System;
using System.Text.RegularExpressions;

namespace day_4
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello there!");

            student s = new student();
            try
            {
                s.show();
            }
            catch (NameException e)
            {
                Console.WriteLine("!error: User defined exception: {0}", e.Message);
            }
            Console.ReadKey();
        }
    }

    class NameException : Exception
    {
        public NameException(string message) : base(message) { }

    }

    class student
    {

        string name;



        public void show()
        {
            Console.WriteLine("enter age to check..");
            name = Console.ReadLine();

            bool status = Regex.IsMatch(name, @"^[a-zA-Z]+$");

            if (status != true)
            {
                throw (new NameException("Sorry, name is not valid  make sure to enter only chaharcters"));
               
            }

            else
            {

                Console.WriteLine($"hi \"{name}\" name is valid.. congrats..!");
            }
            
        }

    }
}
