--1. Write a query to list the number of jobs available in the employees table.

SELECT JobId AS Jobs FROM Employees

--2. Write a query to get the total salaries payable to employees.

SELECT SUM(Salary) AS TotalSalary FROM Employees

--3. Write a query to get the minimum salary from employees table.

SELECT MIN(Salary) AS MINSAL FROM Employees

--4. Write a query to get the maximum salary of an employee working as a Programmer.

SELECT MAX(Salary) AS MAXSAL FROM Employees

--5. Write a query to get the average salary and number of employees working the department 90.

SELECT AVG(Salary) AS AVGSAL, COUNT(EmployeeID) AS TotalEmp FROM Employees WHERE DepartmentID=90

--6. Write a query to get the highest, lowest, sum, and average salary of all employees.

SELECT MAX(Salary) AS HIGHSAL, MIN(Salary) AS LOWSAL, SUM(Salary) AS TTLSAL ,AVG(Salary) AS AVGSAL FROM Employees

--7. Write a query to get the number of employees with the same job.

SELECT JobId, COUNT(EmployeeID) AS EmpPerDept FROM Employees GROUP BY JobId

--8. Write a query to get the difference between the highest and lowest salaries.

SELECT MAX(SALARY)-MIN(SALARY) AS DIFF FROM Employees

--9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

SELECT ManagerID, MIN(Salary) AS LowWage FROM Employees GROUP BY ManagerID

--10. Write a query to get the department ID and the total salary payable in each department.

SELECT DepartmentID, SUM(Salary) AS TotalWage FROM Employees GROUP BY DepartmentID

--11. Write a query to get the average salary for each job ID excluding programmer.

SELECT AVG(Salary) AS AvgSal FROM Employees WHERE JobId!='IT_PROG' GROUP BY JobId

--12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

SELECT SUM(Salary) AS TTLSAL, MAX(Salary) AS HIGHSAL, MIN(Salary) AS LOWSAL, AVG(Salary) AS AVGSAL 
	FROM Employees WHERE DepartmentID=90 GROUP BY JobId

--13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

SELECT JobId, MAX(Salary) AS MAXSAL FROM Employees WHERE Salary IN (SELECT SALARY FROM Employees WHERE Salary>=4000) GROUP BY JobId

--14. Write a query to get the average salary for all departments employing more than 10 employees.

SELECT DepartmentID, AVG(Salary) FROM Employees GROUP BY DepartmentID HAVING COUNT(EmployeeId)>10
