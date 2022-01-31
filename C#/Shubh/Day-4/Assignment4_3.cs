using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment4_3
{

    public class DateException : Exception
    {
        public DateException(String message)
            : base(message)
        {

        }
    }
    public class Assignment4_3
    {
        static void validateDate(DateTime dtAdd)
        {
            if (dtAdd.Day < DateTime.Now.Day || dtAdd.Month < DateTime.Now.Month || dtAdd.Year < DateTime.Now.Year)
            {
                throw new DateException("The entered date is not current date");
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