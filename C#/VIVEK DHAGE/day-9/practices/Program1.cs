
using System;
using System.Threading.Tasks;

namespace day9_p1
{ 
class Program
{
	static void Main(string[] args)
	{
		first_meth();
		Console.ReadKey();
			Task t1 = new Task(task2);
			t1.Start();
	}
	public static async Task first_meth()
	{
		await Task.Run(() => {
			for (int a = 0; a < 5; a++)
			{
				Console.WriteLine(" Simple demonstration of await keyword.");
			}
		});
	}

		public static void task2()
        {

            Console.WriteLine("task is running");
        }
}
}
