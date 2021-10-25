//Create a weekday enum and accept week day number and display week day.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1
{
    class Assignment3
    {
        class Assignment2
        {
            //enum declare
            enum WeekDay { Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday };
            static void Main(string[] args)
            {
                Console.WriteLine("Enter The WeekDay Number: \n 0.Sunday,\n 1.Monday,\n 2.Tuesday,\n 3. Wednesday,\n 4. Thursday,\n 5. Friday,\n 6. Saturday");
                int Num = int.Parse(Console.ReadLine());
                WeekDay WeekNum = (WeekDay)Num;
                Console.WriteLine("Week Day Is :{0}", WeekNum);

                //Another Way 
                //switch (WeekNum)
                //{
                //    case WeekDay.Sunday:
                //        Console.WriteLine("Week Day Is Sunday");
                //        break;
                //    case WeekDay.Monday:
                //        Console.WriteLine("Week Day Is Monday");
                //        break;
                //    case WeekDay.Tuesday:
                //        Console.WriteLine("Week Day Is Tuesday");
                //        break;
                //    case WeekDay.Wednesday:
                //        Console.WriteLine("Week Day Is Wednesday");
                //        break;
                //    case WeekDay.Thursday:
                //        Console.WriteLine("Week Day Is Thursday");
                //        break;
                //    case WeekDay.Friday:
                //        Console.WriteLine("Week Day Is Friday");
                //        break;
                //    case WeekDay.Saturday:
                //        Console.WriteLine("Week Day Is Saturday");
                //        break;
                //    default:
                //        break;
                //}
                Console.ReadLine();
            }
        }
    }
}
