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
            catch (DateException e)
            {
                Console.WriteLine("!error: User defined exception: {0}", e.Message);
            }
            Console.ReadKey();
        }
    }

    class DateException : Exception
    {
        public DateException(string message) : base(message) { }

    }

    class student
    {

         DateTime dt;
         DateTime cd = DateTime.Now;



        public void show()
        {
            Console.WriteLine("enter date to check..");
            dt = DateTime.Parse(Console.ReadLine());

            if (dt < cd)
            {
                throw (new DateException("Sorry, Date is not correct"));

            }

            else
            {

                Console.WriteLine($"hi \"{dt}\"  is valid.. congrats..!");
            }

        }

    }
}
