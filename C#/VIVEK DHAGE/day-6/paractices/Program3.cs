using System;

namespace day6_prac3
{
	
	class GFG
	{

		// Method
		public static int mymethod(int s, int d, int f, int g)
		{
			return s * d * f * g;
		}

		public static string fun(string name, string name1)
		{
			return name+name1;
		}

		static string GetMessage()
		{
			return "Hello there!";
		}


		// Main method
		static public void Main()
		{

			// Using Func delegate
			// Here, Func delegate contains
			// the four parameters of int type
			// one result parameter of int type

			Func<string> sayHello = GetMessage;
			Console.WriteLine(sayHello());

			Func<string,string,string> ff= fun;
			Console.WriteLine(ff("ddd","sss"));

			Func<int, int, int, int, int> val = mymethod;
			Console.WriteLine(val(10, 100, 1000, 1));


		}
	}

}
