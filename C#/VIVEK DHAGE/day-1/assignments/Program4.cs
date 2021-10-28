using System;

namespace weekday
{

	enum weekday { 
		sunday ,
		monday,
		tuesday,
		wednesday,
		thirsday,
		friday,
		saturday
	}
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Hello World!");

			
// 			int num = 0;
// 			Console.WriteLine("enter weekday");
// 			num = Console.Read();

	                int myNum1 = (int)weekday.sunday;
					Console.WriteLine("sunday is"+myNum1);
	                int myNum2 = (int)weekday.monday;
					Console.WriteLine("monday is"+myNum2);
					int myNum3 = (int)weekday.tuesday;
					Console.WriteLine("tuesday is"+myNum3);
					
					int myNum4 = (int)weekday.wednesday;
					Console.WriteLine("wednesday is"+myNum4);
					
					
					int myNum5 = (int)weekday.thirsday;
					Console.WriteLine("thirsday is"+myNum5);
					
					int myNum6 = (int)weekday.friday;
					Console.WriteLine("friday is"+myNum6);
					
					
					int myNum7 = (int)weekday.saturday;
					Console.WriteLine("saturday is"+myNum7);



		
}
	}
}
