using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PracticeDay2
{
    class Program
    {
        //parameter-less method 
        //protected methode we can not access outside the class it can be accessible only in class
        public void Message()
        {
            Console.WriteLine("Hello Good morning");
        }
        //parameterized method 
        public void ExPrameter(string name)
        {
            Console.WriteLine("Name is " + name);
        }
        //void does not return any value 
       public void callbyvalue(int no)
        {
            no = no * no;
            Console.WriteLine("value is "+no);
        }
        //constructor
       public Program()
        {
            Console.WriteLine("Hello World :::: constructor called ");
        }
        public Program(int a , int b)
        {
            int c = a + b;
            Console.WriteLine("sum of two number is " + c);
        }
    }
    class example
    {
        static void Main(string[] args)
        {
            var a = new Program();
            a.Message();
            //give a parameter value 
            a.ExPrameter("Shreya");
           
            int no = 10;
            Console.WriteLine("before calling the method" + no);
            a.callbyvalue(no);
            Program p = new Program();
            Program p1 = new Program(3,4);

            Console.ReadKey();

        }
    }
}
