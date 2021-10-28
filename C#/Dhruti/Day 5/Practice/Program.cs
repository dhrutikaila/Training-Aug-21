using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollectionPractice
{
    class Program
    {
       //list of 5 students 

            public static void Main()
            {
                List<string> Student = new List<string>();

                Student.Add("Dhruti");
                Student.Add("kashyap");
                Student.Add("ravi");
                Student.Add("meet");
                Student.Add("hari");
               

                Console.WriteLine();
                foreach (string List in Student)
                {
                    Console.WriteLine(List);
                }

                Console.WriteLine("\nIndexOf(\"hari\"): {0}",
                    Student.IndexOf("hari"));

                Console.WriteLine("\nIndexOf(\"hari\", 3): {0}",
                    Student.IndexOf("hari", 3));

                Console.WriteLine("\nIndexOf(\"hari\", 2, 2): {0}",
                    Student.IndexOf("hari", 2, 2));
                Console.ReadLine();
            }
     }

       
 }


