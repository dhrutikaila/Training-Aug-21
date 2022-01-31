-----SELECT QUERIES-------
/*Write a query to display the names (first_name, last_name) using alias 
name “First Name", "Last Name"*/

SELECT FirstName AS 'First Name' , LastName AS 'Last Name' from employees

--Write a query to get unique department ID from employee table.

SELECT DISTINCT(DepartmentID) AS 'DEPARTMENT ID' from Employees

/*Write a query to get all employee details from the employee table order
by first name, descending*/

SELECT * FROM Employees ORDER BY FirstName , LastName desc

/*Write a query to get the names (first_name, last_name), salary, PF of
all the employees (PF is calculated as 12% of salary).*/

SELECT FirstName +' '+LastName AS Employeename , Salary , PF=0.12*Salary FROM Employees

/*Write a query to get the employee ID, names (first_name, last_name),
salary in ascending order of salary.*/

SELECT  EmployeeID, FirstName, LastName , salary from employees ORDER BY salary asc

--Write a query to get the total salaries payable to employees.

SELECT SUM(salary) AS 'Total salary' from employees

--7)Write a query to get the maximum and minimum salary from employees table.

SELECT MIN(salary) as 'Minimum salary' , MAX(salary) as 'Maximum Salary' FROM employees

--8)Write a query to get the average salary and number of employees in the employees table.

SELECT COUNT(EmployeeID)  AS 'No of employee', AVG(salary) AS 'Average salary'
FROM employees

--9)Write a query to get the number of employees working with the company.
SELECT COUNT(EmployeeID) 'Total Employees' FROM Employees

--10)Write a query to get the number of jobs available in the employees table.

SELECT JobId,COUNT(JobId) AS 'TOTAL JOB'   FROM employees GROUP BY JobId

--11)Write a query get all first name from employees table in upper case.

SELECT UPPER(FirstName) AS 'FirstName' FROM employees
