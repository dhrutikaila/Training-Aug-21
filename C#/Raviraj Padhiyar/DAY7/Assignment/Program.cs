using System;
using System.Collections.Generic;
using System.Linq;

namespace DemoConsoleApp
{
    
    class Program
    {
        static void Main(string[] args)
        {
            List<Employee> employees = new List<Employee>()

            {
                new Employee(){ ID=1,FirstName="John",LastName="Abraham",Salary=1000000,JoiningDate=new DateTime(2013,1,1),Deparment="Banking"},
                new Employee(){ ID=2,FirstName="Michael",LastName="Clarke",Salary=800000,JoiningDate=new DateTime(),Deparment="Insurance" },
                new Employee(){ ID=3,FirstName="oy",LastName="Thomas",Salary=700000,JoiningDate=new DateTime() ,Deparment="Insurance"},
                new Employee(){ ID=4,FirstName="Tom",LastName="Jose",Salary=600000,JoiningDate=new DateTime() ,Deparment="Banking"},
                new Employee(){ ID=4,FirstName="TestName2",LastName="Lname%",Salary=600000,JoiningDate=new DateTime(2013,1,1) ,Deparment="Services"}

            };

            List<Incentive> incentives = new List<Incentive>()

            {

                new Incentive(){ ID=1,IncentiveAmount=5000,IncentiveDate=new DateTime(2013,02,02)},

                new Incentive(){ ID=2,IncentiveAmount=10000,IncentiveDate=new DateTime(2013,02,4)},

                new Incentive(){ ID=1,IncentiveAmount=6000,IncentiveDate=new DateTime(2012,01,5)},

                new Incentive(){ ID=2,IncentiveAmount=3000,IncentiveDate=new DateTime(2012,01,5)}

            };

            //Get employee details from employees object whose employee name is “John” (note restrict operator)
            //var employee1 = from emp in employees
            //                where emp.FirstName == "John"
            //                select emp;

            var employee1 = employees.First(x => x.FirstName == "John");

            Console.WriteLine(employee1.FirstName);

            // Get FIRSTNAME,LASTNAMe from employees object(note project operator)
            var names = from emp in employees
                        select new { FirstName = emp.FirstName , LastName = emp.LastName };

            foreach (var name in names)
            {
                Console.WriteLine(name);
            }

            //Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives
            var query3 = from emp in employees
                         join inc in incentives on emp.ID equals inc.ID
                         select new { FirstName = emp.FirstName, Incentive = inc.IncentiveAmount };
            foreach (var item in query3)
            {
                Console.WriteLine(item);
            }

            //Get department wise maximum salary from employee table order by salary ascending (note group by)
            //var query4 = from emp in employees
            //             group emp by emp.Deparment into empGp
            //             select new { Department = empGp.Key, MaxSalary = empGp.Max(e => e.Salary) };
            
  
            var query4 = employees.GroupBy(emp => emp.Deparment)
                .Select(gp => new { Department = gp.Key, MaxSalary = gp.Max(e => e.Salary)});

            foreach (var item in query4)
            {
                Console.WriteLine(item);
            }


            //Select department, total salary with respect to a department from employees object where total salary greater than 800000 order by TotalSalary descending(group by having)
            //var query5 = from emp in employees
            //             group emp by emp.Deparment into Dep
            //             orderby Dep.Sum(e => e.Salary) descending
            //             where Dep.Sum(e => e.Salary) > 800_000
            //             select new { Department = Dep.Key, TotalSalary = Dep.Sum(e => e.Salary) };

            var query5 = employees.GroupBy(e => e.Deparment)
                .OrderByDescending(dep => dep.Sum(e => e.Salary))
                .Where(dep => dep.Sum(e => e.Salary) > 800_000)
                .Select(Dep => new { Department = Dep.Key, TotalSalary = Dep.Sum(e => e.Salary) });

            foreach (var item in query5)
            {
                Console.WriteLine(item);
            }
            Console.ReadKey();
        }


    }
}
