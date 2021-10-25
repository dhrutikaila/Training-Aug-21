
USE Subqueries



---1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

SELECT FirstName+' '+Lastname as Name, salary 
FROM Employees 
	WHERE Salary>(SELECT Salary FROM Employees WHERE Lastname='bull')


---2. Find the names (first_name, last_name) of all employees who works in the IT department. 

SELECT FirstName+' '+Lastname as Name FROM Employees WHERE Departmentid = (SELECT DepartmentID FROM Departments WHERE DepartmentName='IT') 


---3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
---Hint : Write single-row and multiple-row subqueries

SELECT FirstName+' '+Lastname as Name FROM Employees WHERE MANAGERID IN(
SELECT EMPLOYEEID FROM EMPLOYEES WHERE DEPARTMENTID IN(
SELECT DEPARTMENTID FROM DEPARTMENTS WHERE LOCATIONID IN(
(SELECT LOCATIONID FROM LOCATIONS WHERE COUNTRYID IN 
(SELECT CountryID FROM Countries WHERE COUNTRYNAME='United states of america')))))


---4. Find the names (first_name, last_name) of the employees who are managers.

SELECT Firstname+' '+Lastname AS NAME, EMPLOYEEID FROM Employees WHERE EmployeeID IN (SELECT DISTINCT Managerid FROM Employees) 


----5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

SELECT Firstname+' '+Lastname AS Name FROM Employees WHERE Salary> 
(SELECT AVG(Salary) FROM Employees)


---6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

SELECT Firstname+' '+Lastname,Salary AS Name FROM Employees WHERE Salary IN 
(SELECT MIN(Salary) FROM Employees GROUP BY Jobid)


---7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

SELECT Firstname+' '+Lastname as name FROM Employees WHERE Salary >
(SELECT AVG(Salary) FROM Employees) AND DepartmentID = 
(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT') 


---8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

SELECT Firstname+' '+Lastname as Name, Salary FROM Employees WHERE Salary > 
(SELECT Salary FROM Employees WHERE Firstname='Bell' or Lastname='Bell')


---9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 

SELECT Firstname+' '+Lastname as Name,EmployeeId, Salary,DepartmentId FROM Employees e1 WHERE Salary = 
(SELECT MIN(Salary) FROM Employees e2  WHERE e1.DepartmentID=e2.DepartmentId GROUP BY DepartmentID)



---10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

SELECT Firstname+' '+Lastname as Name, Salary FROM Employees WHERE Salary>(SELECT AVG(Salary) FROM Employees ) 


----11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 

SELECT Firstname+' '+Lastname as Name, Salary FROM Employees WHERE Salary >
( SELECT MAX(Salary) FROM Employees GROUP BY JOBID HAVING JOBID='SH_CLERK') ORDER BY Salary DESC


---12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

SELECT Firstname+' '+Lastname as Name FROM Employees WHERE DepartmentID=
(SELECT DepartmentID FROM Departments WHERE DepartmentName='SUPERVISER')


---13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

SELECT e.EmployeeID, e.Firstname, e.lastname, d.departmentname FROM Employees e JOIN Departments d ON e.DepartmentId=d.DepartmentId

SELECT EmployeeID, Firstname, Lastname,(SELECT DepartmentName FROM DEPARTMENTS WHERE Employees.DEPARTMENTID= Departments.DEPARTMENTID) AS DEPARTMENTNAME FROM Employees 

---14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
 
SELECT EmployeeID,Firstname, Lastname,Salary,DEPARTMENTID FROM Employees E1 WHERE Salary> (SELECT AVG(Salary) FROM Employees E2 WHERE E1.DepartmentID=E2.DepartmentID GROUP BY DepartmentID)


---15. Write a query to fetch even numbered records from employees table. 

SELECT * FROM (SELECT *,ROW_NUMBER() OVER(ORDER BY EmployeeID ASC) AS NUMBER FROM Employees)TEMP 
WHERE NUMBER%2=0



----16. Write a query to find the 5th maximum salary in the employees table.

SELECT Salary FROM (SELECT SALARY, DENSE_RANK() OVER(ORDER BY Salary DESC) AS sal FROM Employees) temp WHERE sal=5;

SELECT MAX(Salary) FROM Employees WHERE Salary <
(SELECT MAX(Salary) FROM Employees WHERE Salary <
(SELECT MAX(Salary) FROM Employees WHERE Salary<									  
(SELECT MAX(Salary) FROM Employees WHERE Salary< 
(SELECT MAX(Salary) FROM Employees))))


---17. Write a query to find the 4th minimum salary in the employees table. 

SELECT Salary FROM (SELECT SALARY, DENSE_RANK() OVER(ORDER BY Salary ASC) AS sal FROM Employees) temp WHERE sal=4;

SELECT MIN(Salary) FROM Employees WHERE Salary >
(SELECT MIN(Salary) FROM Employees WHERE Salary>									  
(SELECT MIN(Salary) FROM Employees WHERE Salary> 
(SELECT MIN(Salary) FROM Employees)))


---18. Write a query to select last 10 records from a table. 

SELECT * FROM (SELECT *,ROW_NUMBER() OVER(ORDER BY EmployeeID DESC) AS NUMBER FROM Employees)TEMP 
WHERE NUMBER<11 ORDER BY EmployeeID ASC

SELECT * FROM Employees WHERE EmployeeID IN (SELECT TOP 10 EmployeeID FROM Employees ORDER BY EmployeeID DESC) ORDER BY EmployeeID ASC


-----19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

SELECT DepartmentID,Departmentname FROM Departments WHERE DepartmentID NOT IN(SELECT DepartmentID FROM Employees)


-----20. Write a query to get 3 maximum salaries. 

SELECT DISTINCT SALARY FROM (SELECT SALARY, DENSE_RANK() OVER(ORDER BY Salary DESC) AS sal FROM Employees) TEMP WHERE sal<4 

SELECT MAX(Salary)AS S1,(SELECT MAX(SALARY) FROM EMPLOYEES WHERE SALARY<E1.S1)S2,(SELECT MAX(SALARY) FROM EMPLOYEES WHERE SALARY<E1.S2) FROM EMPLOYEES AS E1


-----21. Write a query to get 3 minimum salaries. 

SELECT DISTINCT SALARY FROM (SELECT SALARY, DENSE_RANK() OVER(ORDER BY Salary ASC) AS sal FROM Employees) TEMP WHERE sal<4


----22. Write a query to get nth max salaries of employees. 

DECLARE @NthNumber AS INT
SET @NthNumber=2

SELECT Salary FROM (SELECT SALARY, DENSE_RANK() OVER(ORDER BY Salary DESC) AS sal FROM Employees) temp WHERE sal=@NthNumber


SELECT * FROM Employee1

SELECT * FROM Incentives

----1. Select employee details from employee table if data exists in incentive table ?

SELECT * 
FROM Employee1
	WHERE Employee_Id IN (SELECT Employee_ref_Id FROM Incentives)


----2. Find Salary of the employee whose salary is more than Roy Salary

SELECT First_Name+' '+Last_Name AS Name,Salary
FROM Employee1
	WHERE Salary>(SELECT Salary FROM Employee1 WHERE First_Name='Roy')

