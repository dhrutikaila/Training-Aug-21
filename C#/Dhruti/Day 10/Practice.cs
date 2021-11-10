using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace Day10_11
{
    class Practice
    {
        static void Main(string[] args)
        {
            Console.BackgroundColor = ConsoleColor.DarkRed;

            var myfile = new FileInfo(@"D:\BACKEND\iodemo.txt");
            Console.WriteLine(myfile.Exists);
            Console.WriteLine(myfile.LastAccessTime);
            Console.WriteLine(myfile.Length);

            using (FileStream fileStream = new FileStream(@"D:\BACKEND\iodemo.txt", FileMode.Append, FileAccess.Write))
            {
                using (StreamWriter streamWriter = new StreamWriter(fileStream))
                {
                    streamWriter.WriteLine("Record updated successfully!");
                }
            }
            Console.WriteLine(myfile.Length);

            DbRecord record = new DbRecord();
            List<Student> students = record.getData();
            if (students.Count > 0)
            {
                foreach (var item in students)
                {
                    Console.WriteLine(item.ID + "  " + item.Name);
                }
            }
            else
            {
                Console.WriteLine("Record not available");
            }

            //Console.WriteLine("Enter Name");
            //Student student = new Student() { Name = Console.ReadLine() };
            //int result = record.executequery(student);
            //if (result > 0)
            //{
            //    Console.WriteLine("Record are inserted");
            //}
            Console.ReadKey();
        }
    }
}