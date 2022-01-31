using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;


namespace DemoConsoleApp
{
    class Program
    {
        
        static string ReadContent(string dir)
        {
            FileInfo logFile = new FileInfo(@dir);

            FileStream fs = logFile.Open(FileMode.OpenOrCreate, FileAccess.Read, FileShare.Read);

            StreamReader sr = new StreamReader(fs);

            string fileContent = sr.ReadToEnd();

            sr.Close();
            fs.Close();

            return fileContent;
        }

        static void WriteContent(string dir,string content)
        {
            FileInfo logFile = new FileInfo(@dir);

            FileStream fs = logFile.Open(FileMode.Append, FileAccess.Write, FileShare.Read);

            StreamWriter sw = new StreamWriter(fs);

            sw.WriteLine("\nhello world.");

            sw.Close();
            fs.Close();
        }

        static void Main(string[] args)
        {
            string content = "hello world!";

            WriteContent("D:/LogFile/log.txt",content);

            Console.WriteLine(ReadContent("D:/LogFile/log.txt"));


            Console.ReadKey();
        }
    }
}