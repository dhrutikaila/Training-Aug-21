---1) Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"

SELECT FirstName 'First Name', LastName 'Last Name' FROM Employees

---2) Write a query to get unique department ID from employee table.

SELECT DISTINCT DepartmentID FROM Employees

---3)Write a query to get all employee details from the employee table order by first name, descending.

SELECT * FROM Employees ORDER BY FirstName DESC

---4)Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary)

SELECT FirstName 'First Name', LastName 'Last Name' ,Salary,Salary*.15 PF FROM Employees

---5)Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT EmployeeID,CONCAT(FirstName,' ' ,LastName)  'NAME OF EMP' ,Salary FROM Employees ORDER BY Salary

---6) Write a query to get the total salaries payable to employees.

SELECT SUM(salary) 'TOTAL PAYABLE SALARIES' FROM Employees

---7)Write a query to get the maximum and minimum salary from employees table.

SELECT MAX(salary)'MAXIMUM SALARY', MIN(salary)'MINIMUM SALARY' FROM Employees

---8)Write a query to get the average salary and number of employees in the employees table.
SELECT AVG(salary)'AVARAGE SALARY', COUNT(*)'NUMBER OF EMPLOYEE' FROM Employees


---9)Write a query to get the number of employees working with the company.
SELECT  COUNT(*)'NUMBER OF EMPLOYEE' FROM Employees

---10)Write a query to get the number of jobs available in the employees table.
SELECT COUNT(DISTINCT jobid) 'NUMBER OF JOBS' FROM Employees

---11)Write a query get all first name from employees table in uppr case.
SELECT UPPER(FirstName) FROM Employees




