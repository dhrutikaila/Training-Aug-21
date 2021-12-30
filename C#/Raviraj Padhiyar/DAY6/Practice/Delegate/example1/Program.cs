using System;
using System.Collections;
using System.Collections.Generic;

namespace DemoConsoleApp
{
    class Program
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

            Console.ReadKey();
        }
    }
}
