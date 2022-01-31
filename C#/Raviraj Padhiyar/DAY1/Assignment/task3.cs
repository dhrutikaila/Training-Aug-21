using System;

namespace DemoConsoleApp
{
    class Program
    {
        enum weekDay
        {
            monday,
            tuesday,
            wednesday,
            thursday,
            friday,
            saturday,
            sunday
        }

        static void Main(string[] args)
        {
            //ask week day num from user
            Console.WriteLine("Enter a week day number\n(range between 1 to 7)");
            int weekDayNum = Convert.ToInt32(Console.ReadLine());

            while(weekDayNum > 7)
            {
                Console.WriteLine("Please provide number between 1 to 7");
                weekDayNum = Convert.ToInt32(Console.ReadLine());
            }

            if(weekDayNum == (int)weekDay.sunday)
            {
                Console.WriteLine("Sunday");
            } else if (weekDayNum == (int)weekDay.monday)
            {
                Console.WriteLine("Monday");
            } else if (weekDayNum == (int)weekDay.tuesday)
            {
                Console.WriteLine("Tuesday");
            }else if (weekDayNum == (int)weekDay.wednesday)
            {
                Console.WriteLine("WednesDay");
            }else if (weekDayNum == (int)weekDay.thursday)
            {
                Console.WriteLine("Thursday");
            }else if (weekDayNum == (int)weekDay.friday)
            {
                Console.WriteLine("Friday");
            }
            else
            {
                Console.WriteLine("Saturday");
            }
            Console.ReadKey();
        }
    }
}
