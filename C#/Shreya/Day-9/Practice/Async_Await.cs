using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Day_9
{
    class Program
    {
        static void Main(string[] args)
        {
            Method1();
            Method2();
            Console.ReadLine();
        }
        public static async Task Method1()
        {
            await Task.Run(() =>
            {
                for (int i = 0; i < 10; i++)
                {
                    Console.WriteLine("Method 1");
                    Task.Delay(100).Wait();
                }
            });
        }
        public static void Method2()
        {
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine("Method 2");
                Task.Delay(100).Wait();
            }
        }
    }
}
