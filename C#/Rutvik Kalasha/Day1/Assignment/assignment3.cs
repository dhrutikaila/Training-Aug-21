using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentsDay1
{
	class Assignment3
	{
		enum WeekDay
		{
			Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
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