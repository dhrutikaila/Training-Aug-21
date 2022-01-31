
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Day7
{
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
            //1. Get employee details from employees object whose employee name is “John” (note restrict operator)
            var johnEmp = employees.Where(x => x.FirstName== "John");
            foreach(var johns in johnEmp)
            {
                Console.WriteLine("Firstname is {0} , ID is {1}, Lastname is {2}, Salary is {3}, JoiningDate is {4}, Deparment is {5} ", johns.FirstName,johns.ID,johns.LastName,johns.Salary,johns.JoiningDate,johns.Deparment);
            }

            //2. Get FIRSTNAME,LASTNAMe from employees object(note project operator)
            var projOper = employees.Select(x => new { FirstName = x.FirstName,LastName=x.LastName});
            foreach (var item in projOper)
                Console.WriteLine("Student FirstName: {0}, LastName: {1}", item.FirstName, item.LastName);

            //3. Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)
            var JoinOp = from employee in employees
                         join incentive in incentives on employee.ID equals incentive.ID
                         select new { employee.FirstName, incentive.IncentiveAmount };
            foreach (var item in JoinOp)
            {
                Console.WriteLine($"{item.FirstName} - {item.IncentiveAmount}");
            }


            //4. Get department wise maximum salary from employee table order by salary ascending (note group by)
            var GroupBy = from employee in employees
                          group employee by employee.Deparment into empSal
                          let topSal = empSal.Max(x => x.Salary)
                          select new
                          {
                              dept = empSal.Key,
                              TopSal = empSal.First(y => y.Salary == topSal).ID,
                              MaxSal = topSal

                          };
            var resultSal = GroupBy.OrderByDescending(x => x.MaxSal);
            foreach (var item in resultSal)
                Console.WriteLine("Dept name : {0}, Highest Sal: {1}", item.dept, item.MaxSal);


            //5. Select department, total salary with respect to a department from employees object where total salary greater than 800000 order by TotalSalary descending(group by having)
            var GroupBy2 = from employee in employees
                          group employee by employee.Deparment into empSal
                          let topSal = empSal.Sum(x => x.Salary)
                          select new
                          {
                              dept = empSal.Key,
                              MaxSal = topSal

                          };
            var resultSal1 = GroupBy2.Where(x => x.MaxSal > 800000).OrderByDescending(x => x.MaxSal);
            foreach (var item in resultSal1)
                Console.WriteLine("Dept name : {0}, Total Sal: {1}", item.dept, item.MaxSal);

        }


    }

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


}
