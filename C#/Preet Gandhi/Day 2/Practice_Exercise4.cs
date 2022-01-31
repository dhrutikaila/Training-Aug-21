//Constructor

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice_Exercise4
{
    public class Taxi
    {
        public bool IsInitialized;

        public Taxi()
        {
            IsInitialized = true;
        }
    }

    class TestTaxi
    {
        static void Main()
        {
            Taxi t = new Taxi();
            Console.WriteLine(t.IsInitialized);
        }
    }
}
