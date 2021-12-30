using System;
using System.Text;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {

            //StringBuilder str = new StringBuilder();
            StringBuilder sb = new StringBuilder("Hello", 20);
            sb.Append(" world");
            sb.AppendLine(" Welcome!");
            sb.Append("to");

            sb.Insert(2, "bye");
            sb.Remove(2, 3);

            sb.Replace("to", "To");

            Console.WriteLine(sb.ToString());

            Console.WriteLine(DateTime.Now);
            

            Console.ReadKey();
        }
    }
}
