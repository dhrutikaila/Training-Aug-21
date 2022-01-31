using System;

namespace DemoConsoleApp
{

    class Person
    {
        public string FirstName { get; }
        public string LastName { get; }
        public string EmailAddress { get; }

        public DateTime DateOfBirth { get; }
        


        public Person(string firstName,string lastName, string email, DateTime dateOfBirth)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.EmailAddress = email;
            this.DateOfBirth = dateOfBirth;


        }

        public Person(string firstName, string lastName, string email)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.EmailAddress = email;

        }

        public Person(string firstName,string lastName,DateTime dateOfBirth)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.DateOfBirth = dateOfBirth;
        }


        public Boolean IsAdult
        {
            get
            {
                if(this.DateOfBirth.Year + 18 < DateTime.Now.Year)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public string SunSign
        {
            get
            {
                string sunSign =  "";
                if (this.DateOfBirth.Month == 12)
                {
                    
                    if (this.DateOfBirth.Day < 22)
                        sunSign = "Sagittarius";
                    else
                        sunSign = "capricorn";
                }

                else if (this.DateOfBirth.Month == 1)
                {
                    if (this.DateOfBirth.Day < 20)
                        sunSign = "Capricorn";
                    else
                        sunSign = "aquarius";
                }

                else if (this.DateOfBirth.Month == 2)
                {
                    if (this.DateOfBirth.Day < 19)
                        sunSign = "Aquarius";
                    else
                        sunSign = "pisces";
                }

                else if (this.DateOfBirth.Month == 3)
                {
                    if (this.DateOfBirth.Day < 21)
                        sunSign = "Pisces";
                    else
                        sunSign = "aries";
                }
                else if (this.DateOfBirth.Month == 4)
                {
                    if (this.DateOfBirth.Day < 20)
                        sunSign = "Aries";
                    else
                        sunSign = "taurus";
                }

                else if (this.DateOfBirth.Month == 5)
                {
                    if (this.DateOfBirth.Day < 21)
                        sunSign = "Taurus";
                    else
                        sunSign = "gemini";
                }

                else if (this.DateOfBirth.Month == 6)
                {
                    if (this.DateOfBirth.Day < 21)
                        sunSign = "Gemini";
                    else
                        sunSign = "cancer";
                }

                else if (this.DateOfBirth.Month == 7)
                {
                    if (this.DateOfBirth.Day < 23)
                        sunSign = "Cancer";
                    else
                        sunSign = "leo";
                }

                else if (this.DateOfBirth.Month == 8)
                {
                    if (this.DateOfBirth.Day < 23)
                        sunSign = "Leo";
                    else
                        sunSign = "virgo";
                }

                else if (this.DateOfBirth.Month == 9)
                {
                    if (this.DateOfBirth.Day < 23)
                        sunSign = "Virgo";
                    else
                        sunSign = "libra";
                }

                else if (this.DateOfBirth.Month == 10)
                {
                    if (this.DateOfBirth.Day < 23)
                        sunSign = "Libra";
                    else
                        sunSign = "scorpio";
                }

                else if (this.DateOfBirth.Month == 11)
                {
                    if (this.DateOfBirth.Day < 22)
                        sunSign = "scorpio";
                    else
                        sunSign = "sagittarius";
                }
                return sunSign;
            }
        }

        public string ChineseZodiacSign
        {
            get
            {
                string chSign = "";
                switch ((this.DateOfBirth.Year - 4) % 12) {
                    case  0: chSign = "Rat"; break;
                    case  1: chSign = "Ox"; break;
                    case  2: chSign = "Tiger"; break;
                    case  3: chSign = "Rabbit"; break;
                    case  4: chSign = "Dragon"; break;
                    case  5: chSign = "Snake"; break;
                    case  6: chSign = "Horse"; break;
                    case  7: chSign = "Goat"; break;
                    case  8: chSign = "Monkey"; break;
                    case  9: chSign = "Rooster"; break;
                    case 10: chSign = "Dog"; break;
                    case 11: chSign = "Pig"; break;
                }
                return chSign;
            }
        }

        public Boolean IsBirthDay
        {
            get
            {
                if (this.DateOfBirth.Equals(DateTime.Today))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public string ScreenName
        {
            get
            {
                return this.FirstName + DateOfBirth.Day.ToString() + DateOfBirth.Month.ToString(); 
            }
        }


    }
    
    class Program
    {
        static void Main(string[] args)
        {
            var p1 = new Person("Raviraj", "Padhiyar", "rvrjpdhr@gmail.com", new DateTime(2000, 01, 30));

            Console.WriteLine($"{p1.FirstName}\t{p1.LastName}\t{p1.EmailAddress}\t{p1.DateOfBirth}\t{p1.IsAdult}\t{p1.SunSign}\t{p1.ChineseZodiacSign}\t{p1.IsBirthDay}\t{p1.ScreenName}");
            Console.ReadKey();
        }
    }   
}
    