using System;
using System.Collections;
using System.Collections.Generic;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            //Create a list which will store 5 student names and then display it search it index number

            List<string> studentNames = new List<string>(5);

            for(int i = 0;i < studentNames.Capacity; i++)
            {
                studentNames.Add(Console.ReadLine());
            }

            studentNames.ForEach(ele => Console.Write(ele + "\t"));
            Console.WriteLine();


            //Create a stack which will store Age of person and display it last in first out order.
            Stack<short> age = new Stack<short>();

            age.Push(21);
            age.Push(44);
            age.Push(25);

            
            Console.WriteLine(age.Pop());
            Console.WriteLine(age.Pop());
            Console.WriteLine(age.Pop());


            // Store a product information in map object. Key will be a product item and value will be the price of that product. Search the product by product name.

            Dictionary<string, int> products = new Dictionary<string, int>();

            products.Add("Pen", 20);
            products.Add("NoteBook", 40);
            products.Add("Pencil", 5);

            string searchKey = "NoteBook";

            foreach (var product in products)
            {
                if(product.Key == searchKey)
                {
                    Console.WriteLine($"product name is {product.Key} and cost is {product.Value}");
                }
            }




            Console.ReadKey();
        }
    }
}
