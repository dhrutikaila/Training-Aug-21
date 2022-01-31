//Print sum of all the even numbers

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignments
{
	class Assignment1_Day1
	{
		static void Main(string[] args)
		{
			int start, end = 100, sum = 0;
			for (start = 0; start <= end; start += 2)
			{
				sum += start;
			}
			Console.WriteLine($"Sum of all even numbers between 0 and {end} is: " + sum);
		}
	}
}
