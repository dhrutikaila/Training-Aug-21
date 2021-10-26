using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Weekday
{
    class Program
    {
        enum Weekdays
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
            Console.WriteLine(Weekdays.friday);
            int day = (int)Weekdays.friday;
            Console.WriteLine(day);

            var wd = (Weekdays)5;
            Console.WriteLine(wd);
            Console.ReadLine();
        }
    }
}

