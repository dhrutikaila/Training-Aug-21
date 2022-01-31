//Create a user defined Exception DateException class which will validate date should not be less than the current date. If date is less than current date it should throw an exception.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_4
{

    public class DateException : Exception
    {
        public DateException(String message)
            : base(message)
        {

        }
    }
    public class Assignment3_Day4
    {
        static void validateDate(DateTime dtAdd)
        {
            if (dtAdd.Day < DateTime.Now.Day || dtAdd.Month < DateTime.Now.Month || dtAdd.Year < DateTime.Now.Year)
            {
                throw new DateException("Date should be current date or more than current date");
            }
        }
        static void Main(string[] args)
        {
            try
            {
                DateTime dtAdd;
                Console.WriteLine("Enter Date");
                dtAdd = Convert.ToDateTime(Console.ReadLine());
                validateDate(dtAdd);
                Console.WriteLine("You have entered correct Date");
            }
            catch (DateException e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
