
---1. Write a query to list the number of jobs available in the employees table.

SELECT COUNT(DISTINCT jobid) 'NUMBER OF JOBS' FROM Employees

---2. Write a query to get the total salaries payable to employees.
SELECT SUM(Salary) 'TOTAL PAYABLE SALARIES' FROM Employees


---3. Write a query to get the minimum salary from employees table.

SELECT MIN(Salary)'MINIMUM SALARY' FROM Employees

---4. Write a query to get the maximum salary of an employee working as a Programmer.

SELECT MAX(Salary)'MAXIMUM SALARY'fROM Employees WHERE JobId ='IT_PROG'

---5. Write a query to get the average salary and number of Employees working the department 90.
SELECT AVG(Salary) 'AVARAGE SALARY',COUNT(DepartmentID)  FROM Employees WHERE DepartmentID LIKE '%90%'

---6. Write a query to get the highest, lowest, sum, and average salary of all employees.

SELECT MAX(Salary)'MAXIMUM SALARY', MIN(Salary)'MINIMUM SALARY',SUM(Salary) 'SUM OF SALARY',AVG(Salary) 'AVARAGE SALARY' FROM Employees


---7. Write a query to get the number of employees with the same job.
SELECT JobID, COUNT(*) 'NUMBER OF EMPLOYEES' FROM Employees GROUP BY JobID;

---8. Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(Salary) - MIN(Salary) DIFFERENCE FROM Employees;


---9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT ManagerID, MIN(Salary) SALARY FROM employees WHERE ManagerID IS NOT NULL GROUP BY ManagerID ORDER BY MIN(Salary) DESC;

---10. Write a query to get the department ID and the total salary payable in each department.
SELECT DepartmentID, SUM(Salary) 'TOTAL PAYABLE AMOUNT' FROM Employees GROUP BY DepartmentID

---11. Write a query to get the average salary for each job ID excluding programmer.
SELECT JobId,AVG(Salary) 'AVARAGE SALARY' FROM Employees WHERE JobId <> 'IT_PROG' GROUP BY JobId

---12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT JobId, SUM(Salary)'TOTAL SALARY', MAX(Salary)'MAXIMUM SALARY',MIN(Salary)'MINIMUM SALARY',
AVG(Salary)'AVARAGE SALARY' FROM Employees WHERE DepartmentID=90 GROUP BY JobId


---13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT JobId,MAX(Salary)'MAXIMUM SALARY' FROM Employees GROUP BY JobId HAVING MAX(salary)>=4000 


---14. Write a query to get the average salary for all departments employing more than 10 employees

SELECT DepartmentID,AVG(Salary) 'AVARAGE SALARY' FROM Employees GROUP BY DepartmentID HAVING COUNT(DepartmentID)>10
