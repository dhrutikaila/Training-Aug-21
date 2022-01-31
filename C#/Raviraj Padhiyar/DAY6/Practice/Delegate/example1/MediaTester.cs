using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoConsoleApp
{
    class MediaTester
    {
        public delegate int TestMedia();

        public void RunTest(TestMedia testDelegate)
        {
            int result = testDelegate();

            if(result == 0)
            {
                Console.WriteLine("Works!");
            }
            else
            {
                Console.WriteLine("Failuare.");
            }
        }

    }
}
