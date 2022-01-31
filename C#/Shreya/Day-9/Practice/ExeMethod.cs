using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_9
{
    public class ExeMethod
    {
        public int Sum(int a,int b)
        {
            return a + b;
        }
        public int multiplication(int a,int b)
        {
            return a * b;
        }
    }
    public static class Callerclass
    {
        public static void NewMethod(this ExeMethod e)
        {
            Console.WriteLine("Hello");
        }
        static void Main(string[] args)
        {
            ExeMethod e = new ExeMethod();
            e.Sum(10, 20);
            e.multiplication(10, 20);
            e.NewMethod();
            Console.ReadLine();
        }

    }

}
