using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_5
{
    class Practice_Exercise3
    {
        static void Main(string[] args)
        {
            Dictionary<string, int> myDict = new Dictionary<string, int>();

            myDict.Add("Laptop", 12345);
            myDict.Add("Mobile", 23456);
            myDict.Add("Tablet", 34567);
            myDict.Add("ipad", 45678);
            myDict.Add("MacBook", 56789);

            Console.WriteLine("Enter product name: (Laptop,Mobile,Tablet,ipad,MacBook)");
            var productName = Console.ReadLine();
            if (myDict.ContainsKey(productName))
            {
                int price = myDict[productName];
                Console.WriteLine($"Price of {productName} is {price}.");
            }
            else
            {
                Console.WriteLine("Invalid Input");
            }
        }
    }
}