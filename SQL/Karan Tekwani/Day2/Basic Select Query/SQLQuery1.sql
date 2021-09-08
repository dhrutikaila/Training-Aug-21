--1 Get all employee details from the Employee table
select * from Employees

--2 Get FirstName, LastName from Employees table
select FirstName, LastName  from Employees 

--3 Get FirstName from Employees table using alias name “Employee Name”
select 'Employee Name'=FirstName  from Employees

--4 Get employee details from Employees table whose Employee Name is “Steven”
select * from Employees where FirstName ='Steven'

--5 Get employee details from Employees table whose Employee Name are “Neena” and “Lex”
select * from Employees where FirstName in('Neena' , 'Lex')

--6 Get employee details from Employees table whose Employee name are not “Neena” and “Neena”
select * from Employees where not FirstName='Neena' 

--7 Get employee details from Employees table whose Salary between 5000 and 8000
select * from Employees where Salary between 5000 and 8000

--8 Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).
select FirstName,LastName,Salary,'PF'=0.12*Salary from Employees

--9 Get employee details from Employees table whose FirstName starts with ‘N’
select * from Employees where  FirstName like 'N%'

--10 Write a query to get unique department ID from Employees table
select distinct DepartmentID from Employees 

--11 Write a query to get all employee details from the employee table order by FirstName, descending.
select * from Employees order by FirstName Desc

--12 Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.
select EmployeeID,FirstName,LastName,Salary  from Employees order by Salary

--13 Select TOP 2 salary from employee table
select top 2 Salary from Employees