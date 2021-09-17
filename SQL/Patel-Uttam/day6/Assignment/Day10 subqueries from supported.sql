USE [Day10 (Subquery)]


-- Supported file queries

-- Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.
   
   select FirstName,LastName,Salary from Employees
    where Salary > (select salary from Employees where LastName = 'bull' )


-- Find the names (first_name, last_name) of all employees who works in the IT department.
   
   select FirstName,LastName from Employees
    where DepartmentID in (select DepartmentID from Departments where DepartmentName = 'IT' )


-- Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States.
   
   select EmployeeID, FirstName,LastName , ManagerID from Employees
    where ManagerID IN  
    (select ManagerID  from Departments where LocationID in
    (select LocationID from Locations where CountryID ='us' ) )


-- Find the names (first_name, last_name) of the employees who are managers.
   
   select FirstName,LastName from Employees
    where EmployeeID in (select ManagerID from Employees )


-- Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
   
   select FirstName,LastName,Salary from Employees
    where Salary > (select avg(Salary) from Employees )

-- Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.
   
--	SELECT FirstName , LastName , JobId FROM Employees WHERE Salary IN (SELECT MIN(Salary)  
--   FROM Employees GROUP BY JobId HAVING MIN(Salary) IN  (SELECT MIN(Salary) FROm Employees GROUP BY JobId )
--)

	


   SELECT MIN(Salary),JobId FROM Employees GROUP BY JobId

-- Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.
    
	SELECT FirstName, LastName, Salary , DepartmentID 
    FROM employees 
    WHERE Salary >(select avg(Salary) from Employees) AND DepartmentID in
    ( select DepartmentID  from Departments where  DepartmentName like 'IT%' )


-- Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.
   
   SELECT FirstName, LastName, Salary 
    FROM employees 
    WHERE Salary > (select Salary from Employees where LastName = 'bell')


-- Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments.
   
	SELECT FirstName, LastName, Salary
    FROM employees 
    WHERE Salary = (select min(Salary) from Employees)



-- Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
    
	select (FirstName + ' ' +LastName) AS 'Full Name',Salary from Employees
    where Salary > (select avg(Salary) from Employees  ) ORDER BY Salary DESC



-- Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest.
   
	select FirstName,LastName,Salary from Employees
    where Salary > (select MAX(Salary) from Employees where JobId ='SH_CLERK' )
    order by Salary asc

	SELECT * FROM Departments
-- Write a query to find the names (first_name, last_name) of the employees who are not supervisors. (Manager)

	SELECT EmployeeID, FirstName , LastName FROM  Employees
	WHERE EmployeeID NOT IN (SELECT DISTINCT ManagerID FROM Employees)

-- Write a query to display the employee ID, first name, last names, and department names of all employees.
    
	SELECT e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName 
    FROM employees e,Departments d
    WHERE e.DepartmentID = d.DepartmentID


-- Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
    
    select EmployeeID,FirstName,LastName,Salary from Employees as e
    where Salary >(select avg(Salary) from Employees where DepartmentID = e.DepartmentID)


-- Write a query to fetch even numbered records from employees table. 
    
	select * from Employees where (EmployeeID)%2 = 0


-- Write a query to find the 5th maximum salary in the employees table. 
    
	select distinct(Salary) from (select DENSE_RANK() over(order by Salary desc) as 'rank',Salary from Employees) tbl where rank ='5'


-- Write a query to find the 4th minimum salary in the employees table. 
    
	select distinct(Salary) from (select DENSE_RANK() over(order by Salary asc) as 'rank',Salary from Employees) tbl where rank ='4'


-- Write a query to select last 10 records from a table. 
    
	select  * from (select top 10 * from Employees order by EmployeeID  desc) sub order by EmployeeID asc


-- Write a query to list department number, name for all the departments in which there are no employees in the department. 
    
	select DepartmentID , DepartmentName from Departments
	where DepartmentID not in (select DepartmentID  from Employees)


-- Write a query to get 3 maximum salaries.    
    
	select distinct(Salary) 
    from (select DENSE_RANK() over(order by Salary desc) as 'rank',Salary
    from Employees) tbl where rank <=3 


-- Write a query to get 3 minimum salaries.
    
	select distinct(Salary) 
    from (select DENSE_RANK() over(order by Salary asc) as 'rank',Salary
    from Employees) tbl where rank <=3 


-- Write a query to get nth max salaries of employees.
    DECLARE @n int
	SET @n = 4

	select distinct(Salary) 
    from (select DENSE_RANK() over(order by Salary desc) as 'rank',Salary 
    from Employees) tbl where rank <= @n

