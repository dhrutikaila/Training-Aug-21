using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Accept 10 student Name,Address,Hindi,English,Maths Marks ,do the total and compute Grade. Note do it with Array and display the result in grid format//
namespace Day1
{
    class Assignment4
    {
        static void Main(string[] args)
        {
            string name, address, grade;
            int hindi, english, maths, total;
            float p;

            string[] student = new string[10];
            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine("Enter Name of student{0}", i + 1);
                name = Console.ReadLine();
                Console.WriteLine("Enter Address of student{0}", i + 1);
                address = Console.ReadLine();
                Console.WriteLine("Enter Hindi, English, Maths marks of student{0}", i + 1);
                hindi = Convert.ToInt32(Console.ReadLine());
                english = Convert.ToInt32(Console.ReadLine());
                maths = Convert.ToInt32(Console.ReadLine());
                total = hindi + english + maths;
                p = total / 3;
                if (p > 90)
                {
                    grade = "A+";
                }
                else if (p > 80 && p <= 90)
                {
                    grade = "A";
                }
                else if (p > 70 && p <= 80)
                {
                    grade = "B+";
                }
                else if (p > 60 && p <= 70)
                {
                    grade = "B";
                }
                else if (p > 33 && p <= 60)
                {
                    grade = "C";
                }
                else
                {
                    grade = "F";
                }
                student[i] = " | " + name + " | " + address + " | " + hindi + " | " + english + " | " + maths + " | " + total + " | " + grade + " | ";
            }

            Console.WriteLine("Student Data are given below:");
            Console.WriteLine("| NAME | ADDRESS | HINDI | ENGLISH | MATHS | TOTAL | GRADE |");
            Console.WriteLine("------------------------------------------------------------");

            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine(student[i]);
            }
            Console.ReadKey();
        }
    }
}
