using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentsDay1
{
    class Assignment4
    {
        static void Main(string[] args)
        {
            string name, address, grade;
            int hindi, english, maths, total;
            float per;

            string[] student = new string[10];
            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine("Enter Name, Address, Hindi, English, Maths marks of student{0}", i + 1);
                name = Console.ReadLine();
                address = Console.ReadLine();
                hindi = Convert.ToInt32(Console.ReadLine());
                english = Convert.ToInt32(Console.ReadLine());
                maths = Convert.ToInt32(Console.ReadLine());
                total = hindi + english + maths;
                per = total / 3;
                if (per > 90)
                {
                    grade = "A+";
                }
                else if (per > 80 && per <= 90)
                {
                    grade = "A";
                }
                else if (per > 70 && per <= 80)
                {
                    grade = "B+";
                }
                else if (per > 60 && per <= 70)
                {
                    grade = "B";
                }
                else if (per > 33 && per <= 60)
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
            Console.WriteLine("| Name | Address | Hindi | English | Maths | Total | Grade |");
            
            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine(student[i]);
            }
        }
    }
}