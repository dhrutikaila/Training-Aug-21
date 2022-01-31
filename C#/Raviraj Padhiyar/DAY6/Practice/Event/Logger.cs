﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoConsoleApp
{
    public class Logger
    {
        public void Subscribe(Clock theClock)
        {
            theClock.TimeChanged += new Clock.TimeChangeHandler(NewTime);
        }

        private void NewTime(object clock, TimeEventArgs e)
        {
            Console.WriteLine("Logging event at {0}:{1}:{2}",
               e.Hour.ToString(),
               e.Minute.ToString(),
               e.Second.ToString()
               );
        }
    }
}
