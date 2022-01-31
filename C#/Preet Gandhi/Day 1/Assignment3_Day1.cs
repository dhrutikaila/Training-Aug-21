//Create a weekday enum and accept week day number and display week day.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignments
{
	class Assignment3_Day1
	{
		enum WeekDay
		{
			Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
		};
		static void Main(string[] args)
		{
			Console.WriteLine("Enter The WeekDay Number (0 = Sunday): ");
			int userInput = Convert.ToInt32(Console.ReadLine());
			WeekDay value = (WeekDay)userInput;
			Console.WriteLine("Week Day Is :{0}", value);
		}
	}
}
