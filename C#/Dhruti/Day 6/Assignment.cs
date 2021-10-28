using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
	public delegate double Rectngal(double a, double b);
	class Assignment
    {
			public static double Mul(double width, double hight)
			{
			return (width * hight);
			}
			public static void Main(String[] args)
			{

			Rectngal area = new Rectngal(Assignment.Mul);
			// OR  
			//Step-3: Binding method to delegate instance  
			Rectngal area1 = Assignment.Mul;
		
			Console.WriteLine("Area of Rectangle is {0} ", area1(10, 20));
			Console.ReadLine();

		}
		}
	}


