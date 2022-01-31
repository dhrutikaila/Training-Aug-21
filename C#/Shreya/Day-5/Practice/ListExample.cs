using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollectionPractice
{
    class customer
    {
        public int id { get; set; }
        public string name { get; set; }
        public int salary { get; set; }
    }
    class ListExample
    {
        static void Main(string[] args)
        {
            customer c1 = new customer()
            {
                id = 1,
                name = "Shreya",
                salary = 10000
            };
            customer c2 = new customer()
            {
                id = 2,
                name = "Diya",
                salary = 20000
            };
            customer c3 = new customer()
            {
                id = 3,
                name = "Divyesh",
                salary = 30000
            };
            List<customer> customers = new List<customer>(2);
            customers.Add(c1);
            customers.Add(c2);
            customers.Add(c3);
            customers.Insert(0, c3); // specify the index number where we need to store data 
            Console.WriteLine(customers.IndexOf(c3,1)); // if we not give 2nd parameter it will return 0th index 
            foreach(customer cus in customers)
            {
                Console.WriteLine("ID = {0} , Name = {1} , salary = {2}", cus.id, cus.name, cus.salary);
                
            }
            Console.WriteLine("Total items are "+customers.Count);
            Console.ReadLine();
        }
    }
}
