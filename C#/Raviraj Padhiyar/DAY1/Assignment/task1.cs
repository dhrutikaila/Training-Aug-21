using System;

namespace DemoConsoleApp
{
    class Program
    {

        
        static void Main(string[] args)
        {
            long evenSum = 0;

            for(int i = 0; i < 900000 + 1;i += 2)
            {
                evenSum += i;
            }


            Console.WriteLine(evenSum);
            Console.ReadKey();
        }
    }
}
