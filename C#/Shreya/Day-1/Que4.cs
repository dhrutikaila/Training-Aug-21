using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Que4
{
    class Program
    {
        //Accept 10 student Name,Address,Hindi,English
        //,Maths Marks ,do the total and compute Grade. Note do it with Array and display the result in grid format
        static void Main(string[] args)
        {
            string name, address;
            int total, hindiMarks, englishMarks, mathsMarks;
            char grade;
            string[] student = new string[1];
            for(int i = 0; i < student.Length; i++)
            {
                Console.WriteLine("Enter "+(i+1)+" Name");
                name = Console.ReadLine();
                Console.WriteLine("Enter " + (i + 1) + " Address");
                address = Console.ReadLine();
                Console.WriteLine("Enter " + (i + 1) + " HindiMarks");
                hindiMarks = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter " + (i + 1) + " EnglishMarks");
                englishMarks = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter " + (i + 1) + " MathsMarks");
                mathsMarks = Convert.ToInt32(Console.ReadLine());

                total = hindiMarks + englishMarks + mathsMarks;
                Console.WriteLine("Total marks is "+total);
                
                if(total > 70)
                {
                    Console.WriteLine(grade = 'A');
                }
                else if (total > 50 || total < 70)
                {
                    Console.WriteLine(grade = 'B');
                }
                else if (total > 35 || total < 50)
                {
                    Console.WriteLine(grade = 'C');
                }
                else
                {
                    Console.WriteLine(grade = 'F');
                }

                student[i] = "|"+name +""+ "|" + address+ "    "+ "|" +hindiMarks+"\t" +"|"+englishMarks+ "\t\t" + "|" + mathsMarks + "\t   " + "|" + total+ "\t" + "|" +grade+ "|";
       }
            Console.WriteLine("=====================================================================");
            Console.WriteLine("Name |Address|Hindi Marks|English Marks|Maths Marks|Total|Grade");
            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine(student[i]);
            }
            Console.WriteLine("=====================================================================");

            Console.ReadKey();
        }
    }
}
