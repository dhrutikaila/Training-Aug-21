-- Q1 Write a query to list the number of jobs available in the employees table

SELECT DISTINCT JobId FROM Employees


-- Q2 Write a query to get the total salaries payable to employees.

SELECT SUM(Salary) FROM Employees


-- Q3 Write a query to get the minimum salary from employees table.

SELECT MIN(Salary) FROM Employees


-- Q4 Write a query to get the maximum salary of an employee working as a Programmer.

SELECT MAX(Salary) FROM Employees WHERE JobId = 'IT_Prog'


-- Q5 Write a query to get the average salary and number of employees working the department 90.

SELECT AVG(Salary),COUNT(EmployeeID) FROM Employees WHERE DepartmentID = 90


-- Q6 Write a query to get the highest, lowest, sum, and average salary of all employees.

SELECT 'highest' = MAX(Salary), 'lowest' = MIN(Salary), 'Sum' = SUM(Salary), 'Average' = AVG(Salary) FROM Employees


-- Q7 Write a query to get the number of employees with the same job.

SELECT JobId,COUNT(EmployeeID) FROM Employees GROUP BY JobId


-- Q8 Write a query to get the difference between the highest and lowest salaries

SELECT 'Diff' = MAX(Salary) - MIN(Salary) FROM Employees


-- Q9 Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

SELECT ManagerID,MIN(Salary) FROM Employees GROUP BY ManagerID


-- Q10 Write a query to get the department ID and the total salary payable in each department.

SELECT DepartmentID,SUM(Salary) FROM Employees GROUP BY DepartmentID


-- Q11 Write a query to get the average salary for each job ID excluding programmer.

SELECT JobId,AVG(Salary) FROM Employees WHERE JobId NOT IN ('IT_Prog') GROUP BY JobId


-- Q12 Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

SELECT 'highest' = MAX(Salary), 'lowest' = MIN(Salary), 'Sum' = SUM(Salary), 'Average' = AVG(Salary) FROM Employees
WHERE DepartmentID = 90
GROUP BY JobId


-- Q13 Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

SELECT JobId,MAX(Salary) FROM Employees
WHERE Salary >= 4000
GROUP BY JobId


-- Q14 Write a query to get the average salary for all departments employing more than 10 employees.

SELECT AVG(Salary) FROM Employees GROUP BY DepartmentID
HAVING COUNT(EmployeeID) > 10