using System;
using System.Linq;
using System.Collections.Generic;

namespace day7_asg
{
    class Employee

    {

        public int ID { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public double Salary { get; set; }

        public DateTime JoiningDate { get; set; }

        public string Deparment { get; set; }

        //--------------------------------


        //public int EmployeeID { get; set; }
        //public string EmpName { get; set; }
        //public int Age { get; set; }

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

        //    List<Employee> empList = new List<Employee>()
        //{
        //new Employee() { EmployeeID = 1, EmpName = "Raj", Age = 28 } ,
        //new Employee() { EmployeeID = 2, EmpName = "Rajesh",  Age = 16 } ,
        //new Employee() { EmployeeID = 3, EmpName = "Sunder",  Age = 35 } ,
        //new Employee() { EmployeeID = 4, EmpName = "Ram" , Age = 20 } ,
        //new Employee() { EmployeeID = 5, EmpName = "Ronit" , Age = 38 }
        //};

            //------------------------------------------------------------------------------------------------

            List<Employee> employees = new List<Employee>()

            {

                new Employee(){ ID=1, FirstName= "John", LastName="Abraham",Salary=1000000,JoiningDate=new DateTime(2013,1,1),Deparment="Banking"},

                new Employee(){ID=2,FirstName="Michael",LastName="Clarke",Salary=800000,JoiningDate=new DateTime(),Deparment="Insurance"},

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

            foreach(var i in incentives)
            {
               var res = (i.ID, i.IncentiveAmount ,  i.IncentiveDate);
                Console.WriteLine(res);
            }
            Console.WriteLine("\n\n");


            //-----------(1)restiction op

            Console.WriteLine("(1)  first task\n");
            var v1 = from em in employees
                     where em.FirstName == "John"
                     select new{ em.ID, em.FirstName, em.LastName,em.Salary, em.JoiningDate};
            //IEnumerable<int> v1 = employees.Where(x => x=="John");

            foreach (var i in v1)
            {
                Console.WriteLine(i);
            }

            Console.WriteLine("\n\n");


            //-----------(2) projection

            Console.WriteLine("(2)  Second task\n");
            var v2 = from e in employees
                     select new { e.FirstName, e.LastName};
            //var v2 = employees.Select(s => new { Name = s.FirstName, Lname = s.LastName });
            foreach (var i in v2)
            {
                Console.WriteLine(i);
            }

            Console.WriteLine("\n\n");


            //-------------(3)

            Console.WriteLine("(3)  third task\n");
            var v3 = from e1 in employees
                     join e2 in incentives
                     on e1.ID equals e2.ID
                     select new
                     {
                         e2.ID,
                         ename = e1.FirstName,
                         elname = e1.LastName,
                         e2.IncentiveAmount,
                         e2.IncentiveDate
                     };
            foreach (var i in v3)
            {
                Console.WriteLine(i);
            }

            Console.WriteLine("\n\n");


            //----------------(4)

            Console.WriteLine("(4)  Fourth task\n");
            var v4 = employees.GroupBy(s =>s.Salary);
            foreach (var i in v4)
            {

                foreach (var e in i)
                {
                    var con = (Convert.ToString(e.Salary), e.FirstName);
                    Console.WriteLine(con);
                }
            }

            //5.Select department, total salary with respect to a department
            //from employees object where total salary greater than 800000
            //order by TotalSalary descending(group by having)

            //----------------(5)
            Console.WriteLine("\n\n");

            Console.WriteLine("(5)  Fifth task\n");
            var v5 = employees.OrderByDescending(s => s.Salary)
                              .Where(w => w.Salary > 800000)
                              .GroupBy(x => x.Deparment);

            foreach (var p in v5)
            {
                foreach (var r in p)
                {
                    var con1 = (Convert.ToString(r.Salary) , r.Deparment);
                    Console.WriteLine(con1);
                }
            }
        }

    }
}
