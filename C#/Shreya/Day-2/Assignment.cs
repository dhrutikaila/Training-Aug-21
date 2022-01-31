using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay_2
{

    class Person
    {
        //field
        private string fname;
        private string lname;
        private string email;
        private DateTime DOB;
        public int age;
       
        //property
        public string FName
        {
            get
            {
                return fname;
            }
            set
            {
                fname = value;
            }
        }
        public string LName
        {
            get
            {
                return lname;
            }
            set
            {
                lname = value;
            }
        }
        public string Email
        {
            get
            {
                return email;
            }
            set
            {
                email = value;
            }
        }
        public DateTime DateOfBirth
        {
            get
            {
                return DOB;
            }
            set
            {
                DOB = value;
            }
        }
        //constructor
        public Person(string FirstName, string LastName, string EmailId, DateTime dob)
        {
            this.fname = FirstName;
            this.lname = LastName;
            this.email = EmailId;
            this.DOB = dob;
        }
        public Person(string FirstName, string LastName, string EmailId)
        {
            this.fname = FirstName;
            this.lname = LastName;
            this.email = EmailId;

        }
        public Person(string FirstName, string LastName, DateTime dob)
        {
            this.fname = FirstName;
            this.lname = LastName;
            this.DOB = dob;
        }
        //adult property 
        public string Adult
        {
            get
            {
                TimeSpan ts = DateTime.Now - this.DOB;
                age = ts.Days / 365;
                if (age > 18)
                {
                    return "You are adult";
                }
                else
                {
                    return "You are not adult";
                }

            }
        }
        //wether today birthday or not 
        public string Birthday
        {
            get
            {
                if ((DateTime.Now.Month == this.DOB.Month) && (DateTime.Now.Day == this.DOB.Day))
                {
                    //Console.WriteLine("Today is your birthday");
                    return "Today is your birthday";
                }
                else
                {
                    //Console.WriteLine("Today is not your birthday");
                    return "Today is not your birthday";
                }

            }
        }
        public string Sun_sign
        {
            get
            {
                if ((DOB.Month == 3 && (DOB.Day >= 21 || DOB.Day <= 31)) || (DOB.Month == 4 && (DOB.Day >= 1 || DOB.Day <= 19)))
                {
                    return "Your Western Astrology Sign Aries & Chinese zodiac Dragon";
                }
                else if ((DOB.Month == 4 && (DOB.Day >= 20 || DOB.Day <= 30)) || (DOB.Month == 5 && (DOB.Day >= 1 || DOB.Day <= 20)))
                {
                    return "Your Western Astrology Sign Taurus & Chinese zodiac Snake";
                }
                else if ((DOB.Month == 5 && (DOB.Day >= 21 || DOB.Day <= 31)) || (DOB.Month == 6 && (DOB.Day >= 1 || DOB.Day <= 21)))
                {
                    return "Your Western Astrology Sign Gemini & Chinese zodiac Horse";
                }
                else if ((DOB.Month == 6 && (DOB.Day >= 22 || DOB.Day <= 30)) || (DOB.Month == 7 && (DOB.Day >= 1 || DOB.Day <= 22)))
                {
                    return "Your Western Astrology Sign Cancer & Chinese zodiac  Sheep";
                }
                else if ((DOB.Month == 7 && (DOB.Day >= 23 || DOB.Day <= 31)) || (DOB.Month == 8 && (DOB.Day >= 1 || DOB.Day <= 22)))
                {
                    return "Your Western Astrology Sign Leo & Chinese zodiac Monkey";
                }
                else if ((DOB.Month == 8 && (DOB.Day >= 23 || DOB.Day <= 30)) || (DOB.Month == 9 && (DOB.Day >= 1 || DOB.Day <= 22)))
                {
                    return "Your Western Astrology Sign Virgo & Chinese zodiac Rooster";
                }
                else if ((DOB.Month == 9 && (DOB.Day >= 23 || DOB.Day <= 31)) || (DOB.Month == 10 && (DOB.Day >= 1 || DOB.Day <= 23)))
                {
                    return "Your Western Astrology Sign Libra & Chinese zodiac Dog";
                }
                else if ((DOB.Month == 10 && (DOB.Day >= 24 || DOB.Day <= 30)) || (DOB.Month == 11 && (DOB.Day >= 1 || DOB.Day <= 22)))
                {
                    return "Your Western Astrology Sign Scorpio & Chinese zodiac Pig";
                }
                else if ((DOB.Month == 11 && (DOB.Day >= 23 || DOB.Day <= 31)) || (DOB.Month == 12 && (DOB.Day >= 1 || DOB.Day <= 21)))
                {
                    return "Your Western Astrology Sign Sagittarius & Chinese zodiac Rat";
                }
                else if ((DOB.Month == 12 && (DOB.Day >= 22 || DOB.Day <= 30)) || (DOB.Month == 1 && (DOB.Day >= 1 || DOB.Day <= 19)))
                {
                    return "Your Western Astrology Sign Capricorn & Chinese zodiac Ox";
                }
                else if ((DOB.Month == 1 && (DOB.Day >= 20 || DOB.Day <= 31)) || (DOB.Month == 2 && (DOB.Day >= 1 || DOB.Day <= 18)))
                {
                    return "Your Western Astrology Sign Aquarius & Chinese zodiac Tiger";
                }
                else
                {
                    return "Your Western Astrology Sign Pisces & Chinese zodiac Rabbit";
                }
            }


        }
        public void display()
        {
            Console.WriteLine("\n");
            Console.WriteLine("UserName : " + fname+" "+lname + "\n" + "Email Id : " + email + "\n" + "BirthDate : " + DOB + "\n" + Adult + "\n" + "Your Age Is : " + age + "\n" + Birthday + "\n" + Sun_sign);
            Console.WriteLine("----------------------------------------------------------------");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            string Fname;
            string Lname;
            string Email;
            DateTime DOB;
            //int age = Convert.ToInt32(Console.ReadLine());
            Person[] p = new Person[2];
            for(int i = 0; i < p.Length; i++)
            {
                Console.Write("Please Enter FirstName : ");
                Fname = Console.ReadLine();
                Console.Write("Please Enter LastName : ");
                Lname = Console.ReadLine();
                Console.Write("Please Enter Email : ");
                Email = Console.ReadLine();
                Console.Write("Please Enter DOB : ");
                DOB = Convert.ToDateTime(Console.ReadLine());

                //Call Constructor
                p[i] = new Person(Fname, Lname, Email, DOB);
                Console.WriteLine("----------------------------------------------------------------");

            }
            for (int i = 0; i < p.Length; i++)
            {
                p[i].display();
            }

            Console.ReadLine();

        }
    }
}

