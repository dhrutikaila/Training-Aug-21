using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Create a reference type called Person.Populate the Person class with the following properties to store the following information:
//First name
//Last name
//Email address
//Date of birth



namespace Day2
{
    class Person
    {
        string FirstName;
        string LastName;
        string Email;
        DateTime Date_Of_Birth;
        DateTime dt = DateTime.Now;
        float Age;

        //Add constructors that accept the following parameter lists:
        //1. All four parameters
        //2. First, Last, Email
        //3. First, Last, Date of birth


        public Person(string FirstName, string LastName, string Email, DateTime dob)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Email = Email;
            this.Date_Of_Birth = dob;
        }
        public Person(string FirstName, string LastName, string Email)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Email = Email;
        }
        public Person(string FirstName, string LastName, DateTime dob)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Date_Of_Birth = dob;
        }


        //Add read-only properties that return the following computed information:
        //1. Adult – whether or not the person is over 18
        //2. Sun sign – the traditional western sun sign of this person
        //3. Chinese sign – the chinese astrological sign (animal) of this person
        //4. Birthday – whether or not today is the person’s birthday
        //5. Screen name – a default screen name that you might see being offered to a first time user of AOL or Yahoo (e.g.John Doe born on Feburary 25th, 1980 might be jdoe225 or johndoe022580)

        public string Adult
        {
            get
            {
                TimeSpan Dts = dt - this.Date_Of_Birth;
                int Age = Dts.Days / 365;
                return (Age > 18 ? "You Are Adult" : " You are not Adult");
            }
        }
       

        //Sun sign & Chinese sign

        public string Sun_sign
        {
            get
            {
                if ((Date_Of_Birth.Month == 3 && (Date_Of_Birth.Day >= 21 || Date_Of_Birth.Day <= 31)) || (Date_Of_Birth.Month == 4 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 19)))
                {
                    return "Your Sun Sign is Aries & Your Chinese sign is Dragon";
                }
                else if ((Date_Of_Birth.Month == 4 && (Date_Of_Birth.Day >= 20 || Date_Of_Birth.Day <= 30)) || (Date_Of_Birth.Month == 5 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 20)))
                {
                    return "Your Sun Sign is Taurus & Your Chinese sign is Snake";
                }
                else if ((Date_Of_Birth.Month == 5 && (Date_Of_Birth.Day >= 21 || Date_Of_Birth.Day <= 31)) || (Date_Of_Birth.Month == 6 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 21)))
                {
                    return "Your Sun Sign is Gemini & Your Chinese sign is Horse";
                }
                else if ((Date_Of_Birth.Month == 6 && (Date_Of_Birth.Day >= 22 || Date_Of_Birth.Day <= 30)) || (Date_Of_Birth.Month == 7 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 22)))
                {
                    return "Your Sun Sign is Cancer & Your Chinese sign is Sheep";
                }
                else if ((Date_Of_Birth.Month == 7 && (Date_Of_Birth.Day >= 23 || Date_Of_Birth.Day <= 31)) || (Date_Of_Birth.Month == 8 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 22)))
                {
                    return "Your Sun Sign is Leo & Your Chinese sign is Monkey";
                }
                else if ((Date_Of_Birth.Month == 8 && (Date_Of_Birth.Day >= 23 || Date_Of_Birth.Day <= 30)) || (Date_Of_Birth.Month == 9 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 22)))
                {
                    return "Your Sun Sign is Virgo & Your Chinese sign is Rooster";
                }
                else if ((Date_Of_Birth.Month == 9 && (Date_Of_Birth.Day >= 23 || Date_Of_Birth.Day <= 31)) || (Date_Of_Birth.Month == 10 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 23)))
                {
                    return "Your Sun Sign is Libra & Your Chinese sign is Dog";
                }
                else if ((Date_Of_Birth.Month == 10 && (Date_Of_Birth.Day >= 24 || Date_Of_Birth.Day <= 30)) || (Date_Of_Birth.Month == 11 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 22)))
                {
                    return "Your Sun Sign is Scorpio & Your Chinese sign is Pig";
                }
                else if ((Date_Of_Birth.Month == 11 && (Date_Of_Birth.Day >= 23 || Date_Of_Birth.Day <= 31)) || (Date_Of_Birth.Month == 12 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 21)))
                {
                    return "Your Sun Sign is Sagittarius & Your Chinese sign is Rat";
                }
                else if ((Date_Of_Birth.Month == 12 && (Date_Of_Birth.Day >= 22 || Date_Of_Birth.Day <= 30)) || (Date_Of_Birth.Month == 1 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 19)))
                {
                    return "Your Sun Sign is Capricorn & Your Chinese sign is Ox";
                }
                else if ((Date_Of_Birth.Month == 1 && (Date_Of_Birth.Day >= 20 || Date_Of_Birth.Day <= 31)) || (Date_Of_Birth.Month == 2 && (Date_Of_Birth.Day >= 1 || Date_Of_Birth.Day <= 18)))
                {
                    return "Your Sun Sign is Aquarius & Your Chinese sign is Tiger";
                }
                else
                {
                    return "Your Sun Sign is Pisces & Your Chinese sign is Rabbit";
                }
            }
        }
        //Birthday
        public string Birthday
        {
            get
            {
                if ((dt.Month == this.Date_Of_Birth.Month) && (dt.Day == this.Date_Of_Birth.Day))
                {
                    return "Happy Birthday!";
                }
                else
                {
                    return "Today is not your Birthday";
                }

            }
        }

        //Screen Name
        public string Screen_name
        {
            get
            {
                string userName = this.FirstName.ToLower() + this.LastName.ToLower() + Date_Of_Birth.ToString("MMddyy");
                return userName;
            }
        }


        //Display
        public void display()
        {
            Console.WriteLine("\n--------------------------PersonDetails-------------------------------");
            Console.WriteLine("UserName : " + Screen_name + "\n" + "Email Id : " + Email + "\n" + "BirthDate : " + Date_Of_Birth + "\n" + Adult + "\n" + "Your Age Is : " + Age + "\n" + Birthday + "\n" + Sun_sign);
            Console.WriteLine("------------------------------------------------------------");
        }


    }


    //Access these things from Console Application in the Main Function. Accept this data for 5 person and display the same. 
    //Means create an object Array of 5 size and accept these details and display these details in tabular format.
    class Assignment
    {
        static void Main(string[] args)
        {
            string FirstName;
            string LastName;
            string Email;
            DateTime Date_Of_Birth;

            Person[] obj = new Person[5];

            for (int i = 0; i < obj.Length; i++)
            {
                Console.Write("Please Enter {0} Person FirstName : ", i + 1);
                FirstName = Console.ReadLine();
                Console.Write("Please Enter {0} Person LastName : ", i + 1);
                LastName = Console.ReadLine();
                Console.Write("Please Enter {0} Person Email : ", i + 1);
                Email = Console.ReadLine();
                Console.Write("Please Enter {0} Person Date_Of_Birth : ", i + 1);
                Date_Of_Birth = Convert.ToDateTime(Console.ReadLine());

                obj[i] = new Person(FirstName, LastName, Email, Date_Of_Birth);

            }

            for (int i = 0; i < obj.Length; i++)
            {
                obj[i].display();
            }

            Console.ReadLine();

        }
    }
}