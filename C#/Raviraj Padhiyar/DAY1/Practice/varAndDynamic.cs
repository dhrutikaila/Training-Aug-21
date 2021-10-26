using System;

namespace DemoConsoleApp
{
    class Program
    {

        static dynamic Add(dynamic a, dynamic b)
        {
            return a + b;
        }
        static void Main(string[] args)
        {
            //var keyword
            var v = "value";

            //var can only be declared locally

            // var v; -> throw an error 
            //var need to intialized upon call
            //var also cannot used as return type
            //nor can used as parameter type

            //dynamic
            dynamic a = 10;


            Console.WriteLine(Add(2, 3));
            Console.WriteLine(Add(2.2, 3.3));


            Console.ReadKey();

        }
    }
}
