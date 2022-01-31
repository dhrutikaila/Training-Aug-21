using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_6
{
    //Delegation
    class MediaTester
    {
        //delegate
        public delegate int TestMedia();
        public void RunTest(TestMedia testDelegate)
        {
            int result = testDelegate();
            if(result == 0)
            {
                Console.WriteLine("Works");
            }
            else
            {
                Console.WriteLine("Failed");
            }
        }
    }

    class MP3Player
    {
        public int PlayMP3File()
        {
            Console.WriteLine("Playing MP3 file...");
            return 0;
        }
    }
    class MP4Player
    {
        public int PlayMP4File()
        {
            Console.WriteLine("Playing MP4 file...");
            return 1;
        }
    }
    class Practice_Exercise1
    {
        static void Main(string[] args)
        {
            var tester = new MediaTester();
            var mp3 = new MP3Player();
            var mp4 = new MP4Player();

            var mp3Delegate = new MediaTester.TestMedia(mp3.PlayMP3File);
            var mp4Delegate = new MediaTester.TestMedia(mp4.PlayMP4File);

            tester.RunTest(mp3Delegate);
            tester.RunTest(mp4Delegate);
        }
    }
}
