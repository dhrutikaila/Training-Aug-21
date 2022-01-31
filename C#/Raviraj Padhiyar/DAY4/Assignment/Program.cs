using System;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            //try
            //{
            //    var raviraj = new Student(-11);
            //    Console.WriteLine(raviraj.Age);
            //}
            //catch(AgeException e)
            //{
            //    Console.WriteLine(e.Message);
            //}

            try
            {
                var raviraj = new Student("Raviraj",21,new DateTime(2022,10,10));
                Console.WriteLine(raviraj.Age);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            Console.ReadKey();
        }
    }
}
