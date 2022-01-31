// Print sum of all the even numbers
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentsDay1
{
	class Assignment1
	{
		static void Main(string[] args)
		{
			int num, end = 100, sum = 0;
			for (num = 0; num <= end; num += 2)
			{
				sum += num;
			}
			Console.WriteLine($"Sum of all even numbers between 0 to 100 is: " + sum);
		}
	}
}