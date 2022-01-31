using System;
using System.Collections.Generic;
using System.Linq;

namespace DemoConsoleApp
{
    
    class Program
    {
        static void Main(string[] args)
        {
            var primes = new List<int> { 2, 3, 5, 7, 11, 13, 17, 19 };
            var query = from val in primes
                        where val < 13
                        select val;
            foreach(var val in query)
            {
                Console.WriteLine(val);
            }
            var query2 = primes.Where(x => x < 17);
            foreach (var val in query2)
            {
                Console.WriteLine(val);
            }

            //order by and group by

            var query3 = from method in typeof(double).GetMethods()
                         orderby method.Name
                         group method by method.Name into groups
                         select new { MethodName = groups.Key, MethodOfOverloads = groups.Count() };
            foreach (var val in query3)
            {
                Console.WriteLine(val);
            }

            //linq operators and cotains
            var listOne = Enumerable.Empty<int>();
            var listTwo = Enumerable.Range(1, 20);

            bool listOneEmpty = listOne.Any();
            bool listTwoEmpty = listTwo.Any();

            Console.WriteLine("list one has members?" + listOneEmpty + "\nList two has members?" + listTwoEmpty);

            //contains
            Console.WriteLine("List two has 12 ?" + listTwo.Contains(12));

            //take
            var listThree = listTwo.Take(5).Select(x => x * 10);

            foreach (var val in listThree)
            {
                Console.WriteLine(val);
            }

            Console.ReadKey();
        }


    }
}
