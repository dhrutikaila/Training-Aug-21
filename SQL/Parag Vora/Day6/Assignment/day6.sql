
-- From tutorial site

-- 1)Select employee details from employee table if data exists in incentive table ?
    select * from Employee
    where EMPLOYEE_ID IN(select EMPLOYEE_REF_ID from Incentives)

-- 2)Find Salary of the employee whose salary is more than Roy Salary
    select salary from Employee
    where salary > (select SALARY from Employee where FIRST_NAME = 'Roy')

-- 3)Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
    create View emp as
    select E.FIRST_NAME,E.LAST_NAME,E.SALARY,E.JOINING_DATE,I.INCENTIVE_DATE,I.INCENTIVE_AMOUNT
    from Employee as E 
    join Incentives as I
    on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID

-- 4)Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
    create view incamount as
    select E.FIRST_NAME,I.INCENTIVE_AMOUNT 
    FROM Employee AS E 
    JOIN Incentives AS I
    ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
    AND I.INCENTIVE_AMOUNT > 3000

-- 5)Create a View to Find the names (first_name, last_name), department number, and department name of the employees who work in London
    create view view1 as
    select concat(e.FirstName,' ',E.LastName) as name,d.DepartmentID,d.DepartmentName
    from Employees as e 
    join Departments as d
    on E.DepartmentID = d.DepartmentID
    join Locations as l
    on l.LocationID = d.LocationID and l.City = 'London'

-- 6)Create a View to get the department name and number of employees in the department.
    Create view View2
    as select distinct(d.DepartmentName),count(e.EmployeeID) as number_of_employees
    from Departments as d 
    join Employees as e
    on d.DepartmentID = e.DepartmentID
    group by DepartmentName

-- 7)Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
    create view view3 as
    select e.EmployeeID,datediff(day,j.StartDate,j.EndDate) as no_of_days
    from Employees as e
    join  Departments as d
    on  d.DepartmentID = 90
    join JobHistory as j
    on j.DepartmentID = d.DepartmentID

-- 8)Write a View to display the department name, manager name, and city.
    create view view4
    as select d.DepartmentName, concat(e.FirstName,' ',e.LastName) as Name ,l.City
    from Departments as d
    join Employees as e
    on d.ManagerID = e.EmployeeID
    join Locations as l
    on d.LocationID = l.LocationID

-- 9)Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
    
    create view view5
    as select d.DepartmentName,concat(e.FirstName,' ',e.LastName) as Name, e.HireDate ,e.Salary,DATEDIFF(year,e.HireDate,getdate()) as experience
    from Employees as e
    join Departments as d
    on d.ManagerID = e.EmployeeID and DATEDIFF(year,e.HireDate,getdate()) > 15


-- From subqueries supported files

-- 1)Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
    select FirstName,LastName,Salary from Employees
    where Salary > (select salary from Employees where LastName = 'bull' )

-- 2)Find the names (first_name, last_name) of all employees who works in the IT department.
    select FirstName,LastName from Employees
    where DepartmentID in (select DepartmentID from Departments where DepartmentName like 'it%' )

-- 3)Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States.
    select FirstName,LastName from Employees
    where ManagerID > 0 and DepartmentID in 
    (select DepartmentID from Departments where LocationID in
    (select LocationID from Locations where CountryID ='us' ) )

-- 4)Find the names (first_name, last_name) of the employees who are managers.
    select FirstName,LastName from Employees
    where EmployeeID in (select ManagerID from Employees )

-- 5)Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
    select FirstName,LastName,Salary from Employees
    where Salary > (select avg(Salary) from Employees )

-- 6)Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.
    SELECT FirstName, LastName, Salary 
    FROM employees 
    WHERE employees.salary = (SELECT MinSalary
    FROM jobs
    WHERE employees.JobId = jobs.JobID);

-- 7)Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.
    SELECT FirstName, LastName, Salary 
    FROM employees 
    WHERE Salary >(select avg(Salary) from Employees where DepartmentID in
    ( select DepartmentID from Departments where  DepartmentName like '%it%' ) )

-- 8)Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.
    SELECT FirstName, LastName, Salary 
    FROM employees 
    WHERE Salary > (select Salary from Employees where LastName = 'bell')

-- 9)Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments.
    SELECT FirstName, LastName, Salary 
    FROM employees 
    WHERE Salary = (select min(Salary) from Employees)

-- 10)Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
    select FirstName,LastName,Salary from Employees
    where Salary >all (select avg(Salary) from Employees group by DepartmentID )

-- 11)Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
    select FirstName,LastName,Salary from Employees
    where Salary >all (select Salary from Employees where JobId ='SH_CLERK' )
    order by Salary asc

-- 12) Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
    SELECT b.FirstName,b.LastName 
    FROM employees b 
    WHERE NOT EXISTS (SELECT 1 FROM employees a WHERE a.ManagerID = b.EmployeeID);

-- 13)Write a query to display the employee ID, first name, last names, and department names of all employees.
    SELECT e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName 
    FROM employees as e,Departments as d
    WHERE e.DepartmentID = d.DepartmentID

-- 14)Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
    
    select EmployeeID,FirstName,LastName,Salary from Employees as a
    where Salary >(select avg(Salary) from Employees where DepartmentID = a.DepartmentID)

-- 15)Write a query to fetch even numbered records from employees table. 
    select * from Employees where (EmployeeID)%2 = 0

-- 16)Write a query to find the 5th maximum salary in the employees table. 
    select distinct(Salary) from (select DENSE_RANK() over(order by Salary desc) as 'rank',* from Employees) tbl where rank ='5'

-- 17)Write a query to find the 4th minimum salary in the employees table. 
    select distinct(Salary) from (select DENSE_RANK() over(order by Salary asc) as 'rank',* from Employees) tbl where rank ='4'

-- 18)Write a query to select last 10 records from a table. 
    select  * from (select top 10 * from Employees order by EmployeeID  desc) sub order by EmployeeID asc

-- 19)Write a query to list department number, name for all the departments in which there are no employees in the department. 
    select * from Employees
    where DepartmentID not in (select DepartmentID  from Departments)

-- 20)Write a query to get 3 maximum salaries.    
    select distinct(Salary) 
    from (select DENSE_RANK() over(order by Salary desc) as 'rank',* 
    from Employees) tbl where rank <=3 

-- 21)Write a query to get 3 minimum salaries.
    select distinct(Salary) 
    from (select DENSE_RANK() over(order by Salary asc) as 'rank',* 
    from Employees) tbl where rank <=3 

-- 22)Write a query to get nth max salaries of employees.
    select distinct(Salary) 
    from (select DENSE_RANK() over(order by Salary desc) as 'rank',* 
    from Employees) tbl where rank <= N 


    
-- From View supported files

-- 1)Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
    select l.LocationID,l.StreetAddress,l.City,l.StateProvince,c.CountryName
    from Locations as l
    join Countries as c
    on c.CountryID = l.CountryID

-- 2)Write a query to find the names (first_name, last name), department ID and name of all the employees.
    select concat(e.FirstName,' ',e.LastName) as Name,d.DepartmentID,d.DepartmentName
    from Employees as e
    join Departments as d
    on e.DepartmentID = d.DepartmentID

-- 3)Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.
    select concat(e.FirstName,' ',E.LastName) as name,j.JobID,d.DepartmentID,d.DepartmentName
    from Employees as e 
    join Departments as d
    on E.DepartmentID = d.DepartmentID
    join Locations as l
    on l.LocationID = d.LocationID and l.City = 'London'
	join JobHistory as j
	on j.EmployeeID = e.EmployeeID

-- 4) Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
    select e.EmployeeID as 'Emp_Id',e.LastName  as 'emp name',em.ManagerID as 'Mgr_Id',em.LastName as 'Mgr Name'
    from Employees as e
    join Employees as em
    on  e.ManagerID =em.EmployeeID

-- 5)Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.    
    select concat(e.FirstName,' ',e.LastName) as Name,e.HireDate
    from Employees as e
    where HireDate > (select HireDate from Employees where LastName = 'Jones')

-- 6)Write a query to get the department name and number of employees in the department. 
    select distinct(d.DepartmentName),count(e.EmployeeID) as number_of_employees
    from Departments as d 
    join Employees as e
    on d.DepartmentID = e.DepartmentID
    group by DepartmentName
      
    --OR
    select * from View2

-- 7)Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
    select e.EmployeeID,datediff(day,j.StartDate,j.EndDate) as no_of_days
    from Employees as e
    join  Departments as d
    on  d.DepartmentID = 90
    join JobHistory as j
    on j.DepartmentID = d.DepartmentID
         --OR
    select * from view3

-- 8)Write a query to display the department ID, department name and manager first name.
    select d.DepartmentID,d.DepartmentName,e.FirstName as Mgr_name
    from Employees as e
    join Departments as d
    on e.EmployeeID = d.ManagerID

-- 9)Write a query to display the department name, manager name, and city.
    select d.DepartmentName, concat(e.FirstName,' ',e.LastName) as Name ,l.City
    from Departments as d
    join Employees as e
    on d.ManagerID = e.EmployeeID
    join Locations as l
    on d.LocationID = l.LocationID
           --OR
    select * from view4

-- 10)Write a query to display the job title and average salary of employees. 
    select j.JobTitle,avg(Salary)
    from Employees as e
    join Jobs as j
    on e.JobId = j.JobID
    group by j.JobTitle

-- 11)Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.    
    select j.JobTitle,e.FirstName,e.Salary - j.MinSalary as salarydiff
    from Employees as e
    join Jobs as j
    on e.JobId = j.JobID

-- 12)Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
    select j.* 
    from Employees as e
    join JobHistory as j
    on e.EmployeeID  =j.EmployeeID and e.Salary >10000

-- 13)Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
    select d.DepartmentName,concat(e.FirstName,' ',e.LastName) as Name, e.HireDate ,e.Salary,DATEDIFF(year,e.HireDate,getdate()) as experience
    from Employees as e
    join Departments as d
    on d.ManagerID = e.EmployeeID and DATEDIFF(year,e.HireDate,getdate()) > 15

          --OR

    select * from view5
