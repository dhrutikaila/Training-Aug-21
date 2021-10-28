using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExceptionAss
{
    class DateException:Exception
    {
        public DateException()
        {
            Console.WriteLine("validate date should not be less than the current date");
        }
    }
    class Date
    {
        public void Validatedate(string name)
        {
            DateTime date = DateTime.UtcNow;
            DateTime CurrentDate = DateTime.Now;
            int result = DateTime.Compare(date, CurrentDate);
            

            if (date > CurrentDate)
            {
                throw new DateException();
            }

            Console.WriteLine("", date);

            
            // Create a user defined Exception DateException class which will validate date should not be less than the current date.
            // If date is less than current date it should throw an exception.
        }
    }
}
