using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Assembly1;
namespace Assembly2
{
    //here we are trying to access internal members so first we need to add that namespace in this namesapce by using "using" keyword
    class Program : sum
    {
        static void Main(string[] args)
        {
            //try to access internal member
            sum a = new sum();
            //a.id = 10; not able to do this becase it is from another assembly
            //here trying to access protected internal for that we need to derived that class so that we are able to access it
            Console.WriteLine("Sum of two number is "+ a.display());
            Console.ReadLine();
        }
    }
}
