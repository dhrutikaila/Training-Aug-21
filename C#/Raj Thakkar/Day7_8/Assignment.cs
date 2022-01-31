//Create a Two Classes Employees and Incentives
//Solve below queries:
//1.Get employee details from employees object whose employee name is “John” (note restrict operator)
//2.Get FIRSTNAME, LASTNAMe from employees object(note project operator)
//3.Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)
//4.Get department wise maximum salary from employee table order by salary ascending (note group by)
//5.Select department, total salary with respect to a department from employees object where total salary greater than 800000 order by TotalSalary descending(group by having)

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day7_8
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

    class Assignment

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

            //1.Get employee details from employees object whose employee name is “John” (note restrict operator)
            var EmpName = employees.Where(emp => emp.FirstName == "John");

            var EmpNameQuery = from emp in employees
                               where emp.FirstName == "John"
                               select emp;

            //foreach (var Emp in EmpName)
            foreach (var Emp in EmpNameQuery)
            {
                Console.WriteLine("Id= " + Emp.ID + ", FirstName= " + Emp.FirstName + ", LastName= " + Emp.LastName + ", Salary= " + Emp.Salary + ", JoiningDate= " + Emp.JoiningDate + ", Department= " + Emp.Deparment);
            }


            Console.WriteLine("--------------------------------------------");


            //2.Get FIRSTNAME, LASTNAMe from employees object(note project operator)

            //var Empname = employees.Select(emp => emp.FirstName +" - "+emp.LastName);
            //var Empname = employees.Select(emp => new {FirstName=emp.FirstName,LastName=emp.LastName});
            var EmpnameQuery = from emp in employees
                               select new { FirstName = emp.FirstName, LastName = emp.LastName };


            //foreach (var emp in Empname)
            foreach (var emp in EmpnameQuery)
            {
                Console.WriteLine($"FirstName = {emp.FirstName} , LastName = {emp.LastName}");
            }

            Console.WriteLine("--------------------------------------------");

            //3.Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)
            //var JoinMehod = employees.Join(incentives,
            // emp => emp.ID,
            // inc => inc.ID,
            // (emp, inc) => new { FirstName = emp.FirstName, IncentiveAmount = inc.IncentiveAmount });

            var joinquery = from emp in employees
                            join inc in incentives
                            on emp.ID equals inc.ID
                            select new { FirstName = emp.FirstName, IncentiveAmount = inc.IncentiveAmount };

            //foreach (var Result in JoinMehod)
            foreach (var Result in joinquery)
            {
                Console.WriteLine($"FirstName = {Result.FirstName} , IncentiveAmount = {Result.IncentiveAmount}");
            }

            Console.WriteLine("--------------------------------------------");

            //4.Get department wise maximum salary from employee table order by salary ascending (note group by)
            var groupbyQuery = from emp in employees
                               group emp by emp.Deparment into deptSalary
                               let MaxSalary = (from sal in deptSalary select sal.Salary).Max()
                               orderby MaxSalary
                               select new { deptSalary.Key, MaxSalary };

            foreach (var Emp in groupbyQuery)
            {
                Console.WriteLine("Department = {0} ,Maximum salary = {1}", Emp.Key, Emp.MaxSalary);
            }

            //var maxSalary_ms = employees.GroupBy(emp => emp.Deparment).ToDictionary(emp => emp.Key, emp => emp.Max(Emp => Emp.Salary));

            //foreach (var Emp in maxSalary_ms)
            //{
            // Console.WriteLine("Department = {0} ,Maximum salary = {1}", Emp.Key, Emp.Value);
            //}



            Console.WriteLine("--------------------------------------------");

            //5.Select department, total salary with respect to a department from employees object where total salary greater than 800000 order by TotalSalary descending(group by having)

            var totalSalary = from emp in employees
                              group emp by emp.Deparment into empData
                              let TotalSalary = (from emp1 in empData select emp1.Salary).Sum()
                              where TotalSalary > 800000
                              orderby TotalSalary descending
                              select new { empData.Key, TotalSalary };

            foreach (var emp in totalSalary)
            {
                Console.WriteLine($"Department = {emp.Key} ,Total Salary = {emp.TotalSalary}");
            }

            Console.ReadLine();
        }

    }

}
