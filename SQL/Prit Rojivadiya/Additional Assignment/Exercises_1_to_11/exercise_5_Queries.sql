-- 1) Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" 

SELECT First_name AS [First Name], Last_name AS [Last Name] FROM Employees



-- 2) Write a query to get unique department ID from employee table.

SELECT DISTINCT Department_id FROM Employees



-- 3)Write a query to get all employee details from the employee table order by first name, descending.

SELECT * FROM Employees ORDER BY First_name DESC



-- 4)Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary).

SELECT First_name,Last_name,'PF' = Salary*0.12 FROM Employees



-- 5)Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

SELECT Employee_id,First_name,Last_name,Salary FROM Employees ORDER BY Salary ASC



-- 6) Write a query to get the total salaries payable to employees.

SELECT SUM(Salary) as 'Payable Salary' FROM Employees



-- 7)Write a query to get the maximum and minimum salary from employees table.

SELECT MAx(Salary) as 'Max salary',MIN(Salary) as 'Min salary' FROM Employees



-- 8)Write a query to get the average salary and number of employees in the employees table.

SELECT AVG(Salary) as 'Average Salary' FROM Employees



-- 9)Write a query to get the number of employees working with the company.

SELECT COUNT(Employee_id) FROM Employees



-- 10)Write a query to get the number of jobs available in the employees table.

SELECT COUNT(DISTINCT Job_id) FROM Employees



-- 11)Write a query get all first name from employees table in uppr case.

SELECT UPPER(First_name) FROM Employees

