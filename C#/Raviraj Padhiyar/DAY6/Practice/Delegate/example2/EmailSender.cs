using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoConsoleApp
{
    public class EmailSender
    {
        private int sendResult;
        public int SendEmail()
        {
            Console.WriteLine("simulating sending email...");
            sendResult = 0;
            return sendResult;
        }
    }
}
