using System;
namespace day6_one
{

	class delex
	{

		public delegate void compute(int l, int b);

		public void sum(int l, int b)
		{
			int area;
			area = l * b;
			Console.WriteLine("area is  = " + area);
		}


		public static void Main(String[] args)
		{

			delex obj = new delex();


			compute del_obj1 = new compute(obj.sum);


			del_obj1(100, 40);


		}
	}
}
