using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Employee

    {

        public int ID { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public double Salary { get; set; }

        public DateTime JoiningDate { get; set; }

        public string Deparment { get; set; }

    }

    class Incentive

    {

        public int ID { get; set; }

        public double IncentiveAmount { get; set; }

        public DateTime IncentiveDate { get; set; }

    }

    class Program

    {

        static void Main(string[] args)

        {

            List<Employee> employees = new List<Employee>()

            {

                new Employee(){ ID=1,FirstName="John",LastName="Abraham",Salary=1000000,JoiningDate=new DateTime(2013,1,1),Deparment="Banking"},

                new Employee(){ID=2,FirstName="Michael",LastName="Clarke",Salary=800000,JoiningDate=new DateTime(),Deparment="Insurance" },

                new Employee(){ID=3,FirstName="oy",LastName="Thomas",Salary=700000,JoiningDate=new DateTime() ,Deparment="Insurance"},

                   new Employee(){ID=4,FirstName="Tom",LastName="Jose",Salary=600000,JoiningDate=new DateTime() ,Deparment="Banking"},

                      new Employee(){ID=4,FirstName="TestName2",LastName="Lname%",Salary=600000,JoiningDate=new DateTime(2013,1,1) ,Deparment="Services"}

            };

            List<Incentive> incentives = new List<Incentive>()

            {

                new Incentive(){ ID=1,IncentiveAmount=5000,IncentiveDate=new DateTime(2013,02,02)},

                new Incentive(){ID=2,IncentiveAmount=10000,IncentiveDate=new DateTime(2013,02,4)},

                new Incentive(){ID=1,IncentiveAmount=6000,IncentiveDate=new DateTime(2012,01,5)},

                new Incentive(){ID=2,IncentiveAmount=3000,IncentiveDate=new DateTime(2012,01,5)}

            };
            //Q1---Get employee details from employees object whose employee name is “John” (note restrict operator)
            var customerQuery2 =
                         from Employee in employees
                         where Employee.FirstName == "John"
                         select Employee;

            foreach (var customer in customerQuery2)
            {
                Console.WriteLine(customer.ID + ","+customer.LastName + ", " + customer.FirstName+","+customer.Salary+"," + customer.JoiningDate + "," + customer.Deparment + "");
                Console.ReadLine();
            }
            //Q2 Get FIRSTNAME,LASTNAMe from employees object(note project operator)
            var res = from Employee in employees
                      select Employee;
            foreach(var demo in employees)
            {
                Console.WriteLine(demo.FirstName+","+demo.LastName+"");
                Console.ReadLine();
            }
            //Q3 Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)
            var query = from Incentive  in incentives
                        join Employee in employees on Incentive.ID equals Employee.ID
                        select new { Incentive.IncentiveAmount, Employee.FirstName };

            foreach (var item in query)
            {
                Console.WriteLine($"{item.IncentiveAmount} - {item.FirstName}");
                Console.ReadLine();
            }

            //Q4 Get department wise maximum salary from employee table order by salary ascending (note group by)
            var res1 = from Employee in employees
                       group Employee by Employee.Deparment into newgroup
                       orderby newgroup.Key ascending
                       select newgroup;

            foreach (var nameGroup in res1)
            {
                Console.WriteLine($"Key: {nameGroup.Key}");
                foreach (var student in nameGroup)
                {
                    Console.WriteLine($"\t{student.Salary}, {student.FirstName}");
                    Console.ReadLine();
                }
            }
            //Q5 Select department, total salary with respect to a department from employees object where total salary greater than 800000 order by TotalSalary descending(group by having)
            //var res2 = from Employee in employees
            //           group Employee having            

            //foreach(var dept in res2)
            //{
            //    Console.WriteLine();
            //}
                       


        }

    }
}
