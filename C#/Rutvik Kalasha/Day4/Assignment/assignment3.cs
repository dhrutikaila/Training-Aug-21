using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay4
{

    public class DateException : Exception
    {
        public DateException(String message)
            : base(message)
        {

        }
    }
    public class Assignment3Day4
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