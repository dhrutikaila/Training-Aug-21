using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/* Create a user defined Exception DateException class which will 
 validate date should not be less than the current date. If date is less than current date it should throw an exception.*/
namespace Assignment_2_Day4
{
    class DateValidation : Exception
    {
        public DateValidation()
        {
            Console.WriteLine("Date is not Less than the current Date");
        }
    }
    class dateValidate
    {
        public void validateDate(DateTime date)
        {
            int res = DateTime.Compare(date, DateTime.Today);
            if (res < 0)
            {
                throw new DateValidation();
            }
            else if (res == 0)
                Console.WriteLine("Today's date and this date both are equal ");
            else
                Console.WriteLine("Valid Date");
        }
    }
       
    class Assignment_3
    {
        static void Main(string[] args)
        {

            DateTime d;
            Console.WriteLine("Enter date");
            d = Convert.ToDateTime(Console.ReadLine());
            dateValidate date = new dateValidate();
            try
            {
                date.validateDate(d);
            }
            catch(DateValidation ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadLine();
        }
    }
}
