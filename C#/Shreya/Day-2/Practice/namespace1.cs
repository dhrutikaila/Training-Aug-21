using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assembly1
{
    //internal can be access in same assembly if we are trying to access from another assembly it will give an compile timeerror
   public class assemblyOne
    {
        internal int Id = 101;
    }
    //protected internal is combination of protected and internal here we can access the internal member any of the assembly with its derived 

    public class sum
    {
        protected internal int num1 = 10;
        protected internal int num2 = 20;
        public int display()
        {
            return num1 + num2;
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            assemblyOne a = new assemblyOne();
            Console.WriteLine("Id is "+a.Id);
            Console.ReadLine();
        }
    }
}
