using System;

namespace DemoConsoleApp
{
    class Student
    {
        //decaring a private member
        private static int studentCount;
        //studnet count is read only

        //declaring writable field
        private string name = "Raviraj Padhiyar";

        //constructor
        public Student()
        {
            studentCount++;
        }

        //coutner property - read only property
        public static int Counter
        {
            get
            {
                return studentCount;
            }
        }

        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }


    }
    class Program
    {
        

        static void Main(string[] args)
        {
            //creating three student instances
            Student s1 = new Student();
            Student s2 = new Student();
            Student s3 = new Student();

            Console.WriteLine("Total No of student " + Student.Counter);

            Console.WriteLine("s1 Studnet name is : " + s1.Name);

            s1.Name = "Rahul Parmar";

            Console.WriteLine("s1 student name is : " + s1.Name);



            Console.WriteLine("press any key to exit");
            Console.ReadKey();
        }
    }
}
