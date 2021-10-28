using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
   public class EventArg
    {
        public EventArg(string text) { Text = text; }
        public string Text { get; }//readonly
    }
    public class Publicer
    {
        public delegate void SampleEventHandler(object sender, EventArg e);
        public event SampleEventHandler SampleEvent;
        protected virtual void RaiseEvnt()
        {
            {
                // Raise the event in a thread-safe manner using the ?. operator.
                SampleEvent?.Invoke(this, new EventArg("Hello"));
            }
        }
    }
}
