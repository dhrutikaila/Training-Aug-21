using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbtractPractice
{
    class Class1
    {
        static void Main(string[] args)
        {
            Func<int, int> add = x => x + x;
            Console.WriteLine(5 + 2);
            Console.ReadLine();
        }
        
    }
}