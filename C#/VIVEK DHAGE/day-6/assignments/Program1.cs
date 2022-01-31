
using System;

namespace day6_two
{

	class delex
	{

		public delegate int compute(int l, int b);



		public static void Main(String[] args)
		{

			compute add = (x, y) => x + y;

			int result = add(3, 6);

			Console.WriteLine("Addition  is : " + result);

		}
	}
}
