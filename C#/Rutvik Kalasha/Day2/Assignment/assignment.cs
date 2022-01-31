using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay2

{
    class Assignment
    {


        static void Main(string[] args)
        {
                       
            Day2.Person[] person = new Day2.Person[5];
            string firstname, lastname, email;
            //DateTime dateofbirth;
            

            for (int i = 0; i < person.Length; i++) 
            {
                Console.WriteLine("Enter FirstName : ");
                firstname = Console.ReadLine();
                Console.WriteLine("Enter LastName : ");
                lastname = Console.ReadLine();
                Console.WriteLine("Enter Email Address : ");
                email = Console.ReadLine();

                Console.Write("Enter a month: ");
                int month = int.Parse(Console.ReadLine());
                Console.Write("Enter a day: ");
                int day = int.Parse(Console.ReadLine());
                Console.Write("Enter a year: ");
                int year = int.Parse(Console.ReadLine());

                DateTime dateofbirth = new DateTime(year, month, day);

                person[i] = new Day2.Person(firstname, lastname, email, dateofbirth);

                person[i].calculate();


            }
            

            Console.WriteLine("FirstName|\tLastName\tEmail\tDateOfBirth\tAdult\tsunsign\tchinisesign\tbirthDayOrNot\tusername\n");
            Console.WriteLine("\n");
            for (int i = 0; i < person.Length; i++)
            {
                Console.WriteLine($"{person[i].FirstName}\t{person[i].LastName}\t{person[i].EmailAddress}\t{person[i].DateOfBirth}\t{person[i].Adult}\t{person[i].Sunsign}\t{person[i].Chinisesign}\t{person[i].BirthDayOrNot}\t{person[i].Username}\n");
            }
            Console.ReadLine();



        }
    }
}