using System;
using System.Collections.Generic;

namespace day5_three
{
    class stak
    {
        int products;
        Dictionary<int, string> dict = new Dictionary<int, string>() { 
            
            { 2121, "product-1" },
            { 12342, "product-2" },
            { 32322, "product-3"}
        };


        public void display()
        {
            foreach (KeyValuePair<int, string> elem in dict)
            {
                Console.WriteLine("{0} and {1}",elem.Key, elem.Value);
            }
        }

        public void search()
        {
            foreach (KeyValuePair<int, string> elem in dict)
            {
                string ent = Console.ReadLine();
                if (ent== "product-1")
                {
                    Console.WriteLine("{0} and {1}", elem.Key, elem.Value);
                }
                 if (ent == "product-2")
                {
                    Console.WriteLine("{1} and {2}", elem.Key, elem.Value);
                }
                 if(ent== "product-3")
                {
                    Console.WriteLine("{2} and {3}", elem.Key, elem.Value);
                }
            

            }
            
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello there!");

            stak s1 = new stak();

            Console.WriteLine("your Dictionary data as : -");
            s1.display();
            s1.search();

            Console.ReadKey();
        }
    }
}
