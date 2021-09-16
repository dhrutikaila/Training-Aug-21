SELECT * FROM employees left joIN INcentive on Employees.EmployeeID=INcentive.EmployeeID WHERE Employees.EmployeeID=INcentive.EmployeeID


SELECT * FROM INcentive

--FINd Salary of the employee whose salary is more than Roy Salary

SELECT firstname,salary FROM Employees WHERE Salary >(SELECT salary FROM Employees WHERE firstname='roy' or LastName='roy')


-- Write a query to fINd the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

SELECT firstname,lastname,salary FROM Employees WHERE Salary >(SELECT salary FROM Employees WHERE  LastName='BULL')

--2. FINd the names (first_name, last_name) of all employees who works IN the IT department. 

SELECT firstname,lastname FROM Employees WHERE DepartmentId>(SELECT departmentID FROM Departments WHERE  DepartmentName='IT')

SELECT * FROM Departments 


use subqueries
--3. FINd the names (first_name, last_name) of the employees who have a manager who works for a department based IN United States. 

--HINt : Write sINgle-row and multiple-row subquerie

SELECT * FROM Employees 
WHERE managerID IN (SELECT managerid FROM  departments WHERE locationid IN (SELECT locationid FROM Locations 
WHERE countryID=(SELECT countryID FROM Countries WHERE countryName='United States of America')))


--4. FINd the names (first_name, last_name) of the employees who are managers. 
	SELECT Firstname,Lastname FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees )


--5. FINd the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
	SELECT Firstname,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees ) 
--6. FINd the names (first_name, last_name), salary of the employees whose salary is equal to the mINimum salary for their job grade. 
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary <= (SELECT AVG(Salary) FROM Employees )

--7. FINd the names (first_name, last_name), salary of the employees who earn more than the average salary and who works IN any of the IT departments. 
 SELECT firstname FROM Employees WHERE Salary > (SELECT avg(Salary) FROM Employees) and DepartmentID IN (SELECT DepartmentID FROM departments WHERE departmentname like'it%')
  SELECT firstname,salary FROM Employees WHERE DepartmentID IN(60,210)
  update Employees set salary=12000 WHERE DepartmentID=60
--8. FINd the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE FirstName='BULL' or LastName='BULL')

--9. FINd the names (first_name, last_name), salary of the employees who earn the same salary as the mINimum salary for all departments. 
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary IN (SELECT  MIN(Salary) FROM Employees GROUP BY DepartmentID) 	

--10. FINd the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
	SELECT FirstName,LastName,salary  FROM employees WHERE salary > (SELECT avg(Salary)as 'salary'  FROM employees)
	

SELECT departmentid,avg(Salary)FROM Employees group  by DepartmentID ORDER BY DepartmentID
--11. Write a query to fINd the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the ShippINg Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary FROM the lowest to highest. 
SELECT FirstName,LastName,salary  FROM employees WHERE salary  >  (SELECT max(salary) FROM employees WHERE JobId='SH_CLERK') ORDER BY salary



--12. Write a query to fINd the names (first_name, last_name) of the employees who are not supervisors. 
	SELECT FirstName ,LastName FROM employees WHERE employeeID IN(SELECT EmployeeID FROM employees WHERE Employeeid<>ManagerID) 

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT e.Firstname, e.lastName,d.departmentName FROM Employees e joIN  Departments d on  e.departmentid= d.departmentid 


--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
 SELECT employeeid,firstname,lastname,salary,departmentid FROM employees WHERE salary IN (SELECT avg(salary) FROM employees GROUP BY departmentId)

--15. Write a query to fetch even numbered records FROM employees table. 
SELECT * FROM empoyes WHERE employeeid=(SELECT employeeid FROM employees WHERE employeeid %2=0) 
	
--16. Write a query to fINd the 5th maximum salary IN the employees table.
		SELECT salary FROM (SELECT salary ,Rank() over (ORDER BY salary desc) as 'sa' FROM employees)a  WHERE sa= 5

--17. Write a query to fINd the 4th mINimum salary IN the employees table. 
	SELECT * FROM (SELECT distINct salary ,Rank() over (ORDER BY salary ) as 'sa' FROM employees)a  WHERE sa= 4
		
--18. Write a query to SELECT last 10 records FROM a table.
	SELECT  * FROM employees WHERE employeeid IN (SELECT top 10 EmployeeID FROM employees) 
	
--19. Write a query to list department number, name for all the departments IN which there are no employees IN the department. 
	SELECT * FROM Departments WHERE DepartmentID not IN(SELECT DepartmentID FROM Employees)	

--20. Write a query to get 3 maximum salaries.
	SELECT top 3 salary FROM Employees
	SELECT Salary FROM (SELECT salary,dense_rank() over(ORDER BY salary desc)as 's' FROM Employees) e WHERE s between 1 and 3

--21. Write a query to get 3 mINimum salaries. 
	SELECT Salary FROM (SELECT salary,dense_rank() over(ORDER BY salary asc)as 's' FROM Employees) e WHERE s between 1 and 3
	

SELECT  * FROM Employees