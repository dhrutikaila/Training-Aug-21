using System;

namespace day6_prac4
{


    // C# program to illustrate the
    // Lambda Expression
    using System;
    using System.Collections.Generic;
    using System.Linq;

    namespace Lambda_Expressions
    {
        class Program
        {
            static void Main(string[] args)
            {

                List<int> numbers = new List<int>() { 1, 2, 3, 4, 5, 6, 7, 8 };

                var square1 = numbers.Select(x => x * x);
                foreach (var value in square1)
                {
                    Console.WriteLine("values in square is : {0}", value);
                }

                var divBy3 = numbers.FindAll(x => (x % 3) == 0);
                foreach (var value in divBy3)
                {
                    Console.Write("{0} ", value);
                }




                Console.WriteLine();
            }
        }
    }





}
