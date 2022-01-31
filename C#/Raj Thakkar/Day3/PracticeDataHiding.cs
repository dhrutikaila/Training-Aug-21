using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3
{
    public class PracticeDataHiding
    {
        public string FirstName;
        public string LastName;
        
        public void FullName()
        {
            Console.WriteLine(FirstName+" "+LastName);
        }
    }

    public class Child1 : PracticeDataHiding
    {
        public new void FullName()
        {
            Console.WriteLine("Child name is "+FirstName+" "+LastName);
        }
    }
    public class MainClass
    {
        public static void Main(String[] args)
        {
            Child1 name = new Child1();
            name.FirstName = "Raj";
            name.LastName = "Thakkar";
            name.FullName();

            Console.ReadKey();
        }
    }
}
