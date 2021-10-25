//Accept 10 student Name, Address, Hindi, English, Maths Marks ,do the total and compute Grade. Note do it with Array and display the result in grid format
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1
{
    class Assignment4
    {
        static void Main(string[] args)
        {
            //Declare variable
            string Name, Address;
            string Grade = "", str = "-------------------------------------------------------";
            int Hindi, English, Maths, Total;

            Console.WriteLine("How Many Students Result You want to Make..?");
            int Student_Number = int.Parse(Console.ReadLine());

            Console.WriteLine("Student is {0}", Student_Number);

            //student array to store students_Result
            string[] student = new string[Student_Number];
            Console.WriteLine("Please Enter student Details");

            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine("Enter {0} Student Name", i + 1);
                Name = Console.ReadLine();
                Console.WriteLine("Enter {0} Student Address", i + 1);
                Address = Console.ReadLine();
                Console.WriteLine("Enter {0} Student Hindi Marks", i + 1);
                Hindi = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter {0} Student English Marks", i + 1);
                English = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter {0} Student Maths Marks", i + 1);
                Maths = int.Parse(Console.ReadLine());
                Total = (Hindi + English + Maths) / 3;
                if (Total > 90)
                {
                    Grade = "A";
                }
                else if (Total > 75 && Total <= 90)
                {
                    Grade = "B";
                }
                else if (Total > 50 && Total <= 75)
                {
                    Grade = "C";
                }
                else if (Total > 33 && Total <= 50)
                {
                    Grade = "D";
                }
                else if (Total <= 33)
                {
                    Grade = "F";
                }
                student[i] = " | " + Name + " | " + Address + " | " + Hindi + " | " + English + " | " + Total + " | " + Grade + " | ";
            }
            Console.WriteLine("Student list is :\n");
            Console.WriteLine(str + "\n" + " | Name | Address | Hindi | English | Total | Grade | \n" + str);
            for (int i = 0; i < student.Length; i++)
            {
                Console.WriteLine("-------------------------------------------------------");
                Console.WriteLine(student[i]);
                Console.WriteLine("-------------------------------------------------------");
            }
            Console.ReadLine();

        }
    }
}
