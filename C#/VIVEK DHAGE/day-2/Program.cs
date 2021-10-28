using System;
using System.Data;
using System.Threading;


namespace Person_1
{
    class Person
   {
        //        Add read-only properties that return the following computed information:


        //1. Adult – whether or not the person is over 18

        //2. Sun sign – the traditional western sun sign of this person

        //3. Chinese sign – the chinese astrological sign(animal) of this person

        //4. Birthday – whether or not today is the person’s birthday

        //5. Screen name – a default screen name that you might see being offered to a first time user of AOL or Yahoo (e.g.John Doe born on Feburary 25th, 1980 might be jdoe225 or johndoe022580)



        String first, last, email;
        int dob;

         
        public Person(string a, string b , string c, int d)
        {
            first = a;
            last = b;
            email = c;
            dob = d;
            Console.WriteLine(first+  last + email + dob);

            Console.WriteLine("enter firstname");
            first = Console.ReadLine();

            Console.WriteLine("enter lastname");
            last = Console.ReadLine();

            Console.WriteLine("enter email");
            email = Console.ReadLine();

            Console.WriteLine("enter dob");
            dob = Convert.ToInt32(Console.ReadLine());
        }

        //-----second constructor

        public Person(string a, string b, string c)
        {
            first = a;
            last = b;
            email = c;

            Console.WriteLine(first, last,email,dob);

           // Console.WriteLine("enter firstname");
           //first = Console.ReadLine();

            // Console.WriteLine("enter lastname");
            //last = Console.ReadLine();

            //Console.WriteLine("enter email");
            //email = Console.ReadLine();
        }

        //----third constructor
        public Person(string a, string b, DateTime d)
        {
            first = a;
            last = b;
            DateTime dddd = new DateTime();

            Console.WriteLine("enter firstname");
            first = Console.ReadLine();

            Console.WriteLine("enter lastname");
            last = Console.ReadLine();

            Console.WriteLine("enter dob");
            dddd = DateTime.Parse(Console.ReadLine());
        }

        DateTime dd = DateTime.Parse(d);

        if(dddd){
            
            }


        private readonly string adult=;
        private readonly string sunsign;
        private readonly string chinesesign;
        private readonly string bday;
        private readonly string screename;
         public string read {
            get
            {
                return ($"{adult},{sunsign},{chinesesign},{bday},{screename}");
            }
        }

  








    }

    class Mainclass { 
        static void Main()
        {

            DataTable st = new DataTable();
            st.Columns.Add("first");
            st.Columns.Add("Last");
            st.Columns.Add("Email");
            st.Columns.Add("Dob");
            st.Columns.Add("Maths");
            st.Columns.Add("Grades");

            //            Console.WriteLine("enter NAME , ADDRESS, HINDI, ENGLISH, MATHS separated by comma ");
            //    Person p = new Person("vivek", "dhage", "eme@jjj.com", 33);
            //      Person p1 = new Person("vivek", "dhage", "abottt@ccc.com");
            //        Person p2 = new Person("vivek", "dhage", 33);


            Person p = new Person("vivek", "dhage", "eme@jjj.com", 33);
            Person p1 = new Person("vivek", "dhage", "abottt@ccc.com");
            Person p2 = new Person("vivek", "dhage", 33);

        }
    }
}






//-----------------------------------
//using System;
//using System.Data;

//namespace day_one_four
//{
//    class Program
//    {


//        static void Main(string[] args)
//        {
//            Console.WriteLine("Hello there!");

//            DataTable st = new DataTable();
//            st.Columns.Add("name");
//            st.Columns.Add("Address");
//            st.Columns.Add("Hindi");
//            st.Columns.Add("English");
//            st.Columns.Add("Maths");
//            st.Columns.Add("Grades");

//            Console.WriteLine("enter NAME , ADDRESS, HINDI, ENGLISH, MATHS separated by comma ");





//            for (int i = 0; i < 5; i++)
//            {

//                DataRow row = st.NewRow();

//                string data = Console.ReadLine();
//                string[] value = data.Split(",");


//                row["Name"] = Convert.ToString(value[0]);
//                row["Address"] = Convert.ToString(value[1]);
//                row["Hindi"] = Convert.ToInt32(value[2]);
//                row["English"] = Convert.ToInt32(value[3]);
//                row["Maths"] = Convert.ToInt32(value[4]);
//                row["Grades"] = Convert.ToInt32(Convert.ToInt32(value[2]) + Convert.ToInt32(value[3]) + Convert.ToInt32(value[4])) / 3;
//                st.Rows.Add(row);




//            }
//          

//            Console.WriteLine();
//            Console.WriteLine("fetched.....");
//            Console.WriteLine();
//            foreach (DataRow r in st.Rows)
//            {
//                foreach (DataColumn c in st.Columns)
//                    Console.WriteLine(r[c] + " ");

//                Console.WriteLine();
//            }







//        }
//    }
//}

