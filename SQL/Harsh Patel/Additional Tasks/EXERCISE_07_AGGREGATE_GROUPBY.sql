SELECT * FROM EMPLOYEES
SELECT * FROM DEPARTMENTS
--1. Write a query to list the number of jobs available in the employees table.

	SELECT COUNT(DISTINCT JOBID) FROM EMPLOYEES 

--2. Write a query to get the total salaries payable to employees.

	SELECT SUM(SALARY) FROM EMPLOYEES

--3. Write a query to get the minimum salary from employees table.

	SELECT MIN(SALARY) FROM EMPLOYEES

--4. Write a query to get the maximum salary of an employee working as a Programmer.

	SELECT MAX(E.SALARY) FROM EMPLOYEES E WHERE E.DEPARTMENTID =(SELECT D.DEPARTMENTID FROM DEPARTMENTS D WHERE D.DEPARTMENTNAME='IT')
	SELECT MAX(SALARY) FROM EMPLOYEES WHERE JOBID='IT_PROG'
--5. Write a query to get the average salary and number of employees working the department 90.

	SELECT AVG(SALARY),COUNT(EMPLOYEEID) FROM EMPLOYEES WHERE DEPARTMENTID =90

--6. Write a query to get the highest, lowest, sum, and average salary of all employees.

	SELECT MAX(SALARY) AS HIGHEST,MIN(SALARY) AS LOWEST,
	SUM(SALARY) AS TOTAL,AVG(SALARY) AS AVERAGE FROM EMPLOYEES

--7. Write a query to get the number of employees with the same job.

	SELECT JOBID,COUNT(EMPLOYEEID) FROM EMPLOYEES GROUP BY JOBID

--8. Write a query to get the difference between the highest and lowest salaries.

	SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE FROM EMPLOYEES

--9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

	SELECT MANAGERID,MIN(SALARY) FROM EMPLOYEES GROUP BY MANAGERID

--10. Write a query to get the department ID and the total salary payable in each department.

	SELECT DEPARTMENTID,SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENTID

--11. Write a query to get the average salary for each job ID excluding programmer.

	SELECT JOBID,AVG(SALARY) FROM EMPLOYEES GROUP BY JOBID HAVING JOBID<>'IT_PROG'

--12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

	SELECT JOBID,SUM(SALARY) AS TOTAL,MAX(SALARY) AS MAXIMUM,MIN(SALARY) AS MINIMUM,AVG(SALARY) AS AVERAGE 
	FROM EMPLOYEES WHERE DEPARTMENTID=90 GROUP BY JOBID  

--13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

	SELECT JOBID,MAX(SALARY) FROM EMPLOYEES GROUP BY JOBID	HAVING MAX(SALARY)>=4000

--14. Write a query to get the average salary for all departments employing more than 10 employees.

	SELECT AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENTID HAVING COUNT(EMPLOYEEID)>10
 

