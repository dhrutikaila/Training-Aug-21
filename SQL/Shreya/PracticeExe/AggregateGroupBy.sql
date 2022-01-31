
-----AGGREGATE AND GROUP BY QUERY ------------------
--1. Write a query to list the number of jobs available in the employees table.

SELECT JobId,COUNT(JobId) AS 'TOTAL JOB'   FROM employees GROUP BY JobId

--2. Write a query to get the total salaries payable to employees.

SELECT SUM(salary) AS 'Total salary' from employees

--3. Write a query to get the minimum salary from employees table.

SELECT MIN(Salary) 'MINIMUM SALARY' FROM Employees

--4. Write a query to get the maximum salary of an employee working as a Programmer.

SELECT MAX(Salary) 'MAXIMUM SALARY' FROM Employees , Departments WHERE DepartmentName = 'IT'
SELECT * FROM Employees 
SELECT * FROM Departments

--5 Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(Salary) 'AVERAGE SALARY',COUNT(EmployeeID)  'NO OF EMPLOYEE'FROM Employees
WHERE DepartmentID=90

--6. Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT  SUM(Salary) 'TOTAL SALARY',MIN(Salary) 'LOWEST SALARY',MAX(Salary) 'HIGHEST SALARY',AVG(Salary) 'AVERAGE SALARY'
FROM Employees

--7. Write a query to get the number of employees with the same job.
SELECT COUNT(EmployeeID) 'NO OF EMPLOYEE',JobId FROM Employees
GROUP BY JobId

--8. Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(Salary) - MIN(Salary) 'SALARYDIFF' FROM Employees

/* 9 Write a query to find the manager ID and the salary of the lowest-paid employee
for that manager.*/
--10. Write a query to get the department ID and the total salary payable in each department.


--11. Write a query to get the average salary for each job ID excluding programmer.
SELECT * FROM Employees
SELECT AVG(Salary) 'AVERAGE SALARY',JobId FROM Employees
WHERE JobId NOT LIKE  '%PROG%'
GROUP BY JobId

/*12. Write a query to get the total salary, maximum, minimum, average salary of
employees (job ID wise), for department ID 90 only.*/

SELECT  SUM(Salary) 'TOTAL SALARY',MIN(Salary) 'MINIMUM SALARY',MAX(Salary) 'MAXIMUM SALARY',AVG(Salary) 'AVERAGE SALARY',JobId
FROM Employees
GROUP BY JobId


/*13. Write a query to get the job ID and maximum salary of the employees where maximum 
salary is greater than or equal to $4000.*/

SELECT MAX(Salary) , JobId FROM Employees WHERE Salary > = 4000 
GROUP BY JobId

SELECT * FROM Employees

/*14. Write a query to get the average salary for all departments employing more 
than 10 employees.*/

SELECT COUNT(DepartmentID) AS [NoOfEmployee],DepartmentID,AVG(Salary) 
FROM Employees 
GROUP BY DepartmentID HAVING COUNT(EmployeeID)>10

SELECT * FROM Employees

