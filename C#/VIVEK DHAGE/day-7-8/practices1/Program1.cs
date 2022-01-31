

// C# program to write user input
// to a file using StreamWriter Class
using System;
using System.IO;

namespace day8_prac1
{

	class File_one_p
	{

		class WriteToFile
		{

			public void Data()
			{
				// This will create a file named sample.txt
				// at the specified location
				StreamWriter sw = new StreamWriter("F://geeksforgeeks.txt"); //C: \Users\om\Desktop\temporary practices

				// To write on the console screen
				Console.WriteLine("Enter the Text that you want to write on File");

				// To read the input from the user
				string str = Console.ReadLine();

				// To write a line in buffer
				sw.WriteLine(str);

				// To write in output stream
				sw.Flush();

				// To close the stream
				sw.Close();
			}

			//---------------------------------------------------------
			public void DataReading() { 
				// Takinga a new input stream i.e.
				// geeksforgeeks.txt and opens it
				StreamReader sr = new StreamReader("F://geeksforgeeks.txt");

				Console.WriteLine("Content of the File");

				// This is use to specify from where
				// to start reading input stream
				sr.BaseStream.Seek(0, SeekOrigin.Begin);

				// To read line from input stream
				string str = sr.ReadLine();

				// To read the whole file line by line
				while (str != null)
				{
					Console.WriteLine(str);
					str = sr.ReadLine();
				}
				Console.ReadLine();

				// to close the stream
				sr.Close();
			}
		}

		// Main Method
		static void Main(string[] args)
		{
			WriteToFile wr = new WriteToFile();
			wr.Data();
			wr.DataReading();
			Console.ReadKey();

			file_2_p p = new file_2_p();
			p.basic();
		}
	}
}

