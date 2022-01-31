--1.Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
SELECT FirstName 'First Name', LastName 'Last Name' FROM Employees

--2.Write a query to get unique department ID from employee table.
SELECT DISTINCT DepartmentID FROM Employees

--3.Write a query to get all employee details from the employee table order by first name, descending.
SELECT * FROM Employees ORDER BY FirstName DESC

--4.Write a query to get the names (first_name, last_name), Salary, PF of all the employees (PF is calculated as 12% of Salary)
SELECT CONCAT(FirstName,' ' ,LastName) AS 'Name', Salary, Salary*.15 AS PF FROM Employees

--5.Write a query to get the employee ID, names (first_name, last_name), Salary in ascending order of Salary.
SELECT EmployeeID, CONCAT(FirstName,' ' ,LastName) AS 'Name' , Salary FROM Employees ORDER BY Salary ASC

--6.Write a query to get the total salaries payable to employees.
SELECT SUM(Salary) AS 'TotalSalaryPayable' FROM Employees

--7.Write a query to get the maximum and minimum Salary from employees table.
SELECT MAX(Salary) AS 'MaxSal', MIN(Salary) AS 'MinSal' FROM Employees

--8.Write a query to get the average Salary and number of employees in the employees table.
SELECT AVG(Salary) AS 'AvgSal', COUNT(EmployeeID) AS 'TotalEmployees' FROM Employees

--9.Write a query to get the number of employees working with the company.
SELECT COUNT(EmployeeID) AS 'TotalEmployees' FROM Employees

--10.Write a query to get the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JobId) 'NoOfJobs' FROM Employees

--11.Write a query get all first name from employees table in uppr case.
SELECT UPPER(FirstName) AS 'FirstName' FROM Employees