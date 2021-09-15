USE test1

--1.Write a query to list the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JOBID) FROM Employee

--2.Write a query to get the total salaries payable to employees.
SELECT SUM(SALARY) FROM Employee

--3.Write a query to get the minimum salary from employees table.
SELECT MIN(Salary) FROM Employee

--4.Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(Salary) FROM Employee
WHERE JobID LIKE '%PROG%'

--5.Write a query to get the average salary and number of employees working the department 90.
SELECT CAST(ROUND(AVG(SALARY),2) AS DECIMAL(10,2)),COUNT(EmployeeID) FROM Employee
WHERE DepartmentID = 90

--6.Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(SALARY),MIN(SALARY),SUM(SALARY),AVG(SALARY) FROM Employee

--7.Write a query to get the number of employees with the same job.
SELECT JOBID,COUNT(EmployeeID) FROM Employee
GROUP BY JOBID

--8.Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(SALARY)-MIN(SALARY) FROM Employee

--9.Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT ManagerID,MIN(Salary) FROM Employee
GROUP BY ManagerID

--10.Write a query to get the department ID and the total salary payable in each department.
SELECT DepartmentID,SUM(Salary) FROM Employee
GROUP BY DepartmentID

--11.Write a query to get the average salary for each job ID excluding programmer.

SELECT JOBID,AVG(SALARY) FROM Employee
WHERE JOBID NOT LIKE '%PROG%'
GROUP BY JOBID

--12.Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT SUM(SALARY),MAX(SALARY),MIN(SALARY),AVG(SALARY) FROM Employee
WHERE DepartmentID = 90
GROUP BY JobId

--13.Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

SELECT JOBID,SALARY FROM Employee
WHERE SALARY >=4000

--14. Write a query to get the average salary for all departments employing more than 10 employees.

SELECT AVG(SALARY),DepartmentID FROM Employee
GROUP BY DepartmentID
HAVING COUNT(EmployeeID)>10
