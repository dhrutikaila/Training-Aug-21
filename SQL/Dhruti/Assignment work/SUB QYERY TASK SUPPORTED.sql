

USE EMPDB

--Q1 Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT FIRSTNAME, LASTNAME, SALARY 
FROM Employees 
WHERE SALARY > 
(SELECT salary FROM employees WHERE lastname = 'Bull');

--Q2 Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT firstname, lastname 
FROM employees 
WHERE departmentid 
IN (SELECT departmentid FROM departments WHERE departmentname='IT');

--Q3 Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT firstname, lastname FROM employees 
WHERE managerid in (select employeeid 
FROM employees WHERE departmentid 
IN (SELECT departmentid FROM departments WHERE locationid 
IN (select locationid from locations where countryid='US')));

--Q4 Write a query to find the name (first_name, last_name) of the employees who are managers.
SELECT firstname, lastname 
FROM employees 
WHERE (employeeid IN (SELECT managerid FROM employees));

--Q5 Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT firstname, lastname, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

--Q6 Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.


SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Full Name' ,Salary ,JobId
FROM Employees AS Emp
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employees 
    WHERE JobId = Emp.JobId

 


--Q7 Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
  SELECT (firstname, lastname), salary 
  FROM employees 
 
SELECT firstname, lastname, salary 
FROM employees 
WHERE departmentid IN 
(SELECT departmentid FROM departments WHERE departmentname LIKE 'IT%') 
AND salary > (SELECT avg(salary) FROM employees);



--Q8 Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT firstname, lastname, salary 
FROM employees 
WHERE salary > 
(SELECT salary FROM employees WHERE lastname = 'Bell') ORDER BY firstname;


--Q9  Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);


--Q10 Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.
SELECT * FROM employees 
WHERE salary > 
ALL(SELECT avg(salary)FROM employees GROUP BY departmentid);

--Q11 Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT firstname,lastname, jobid, salary 
FROM employees 
WHERE salary > 
ALL (SELECT salary FROM employees WHERE jobid = 'SH_CLERK') ORDER BY salary;


--Q12 Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT b.firstname,b.lastname 
FROM employees b 
WHERE NOT EXISTS (SELECT 'X' FROM employees a WHERE a.managerid = b.employeeid);


--Q13  Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT employeeid, firstname, lastname, 
(SELECT departmentname FROM departments d
 WHERE e.departmentid = d.departmentid) department 
 FROM employees e ORDER BY department;


--Q14  Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT employeeid, firstname 
FROM employees AS A 
WHERE salary > 
(SELECT AVG(salary) FROM employees WHERE departmentid = A.departmentid);


--Q15 Write a query to fetch even numbered records from employees table.
SELECT * FROM Employees 
WHERE EmployeeID IN(SELECT EmployeeID FROM Employees WHERE EmployeeID%2 = 0);

--Q16  Write a query to find the 5th maximum salary in the employees table. 
SELECT DISTINCT salary 
FROM employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT salary) 
FROM employees  e2 
WHERE e2.salary >= e1.salary);




--Q17 Write a query to find the 4th minimum salary in the employees table.
SELECT DISTINCT salary 
FROM employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT salary) 
FROM employees  e2 
WHERE e2.salary <= e1.salary);


--Q18 Write a query to select last 10 records from a table. 

SELECT TOP 10 FirstName+' '+LastName 'NAME',EmployeeID  FROM Employees  
ORDER BY EmployeeID ASC

--Q19 Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT * FROM Departments
WHERE DepartmentID 
NOT IN (select DepartmentID FROM Employees);

SELECT DepartmentName AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM Departments 
INNER JOIN employees 
ON employees.departmentid = departments.departmentid 
GROUP BY departments.departmentid, departmentname 
ORDER BY departmentname;




--Q20 Write a query to get 3 maximum salaries. 
SELECT DISTINCT salary 
FROM employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) 
FROM employees b 
WHERE b.salary >= a.salary) 
ORDER BY a.salary DESC;


--Q21  Write a query to get 3 minimum salaries. 
SELECT DISTINCT salary 
FROM employees a 
WHERE  3 >= (SELECT COUNT(DISTINCT salary) 
FROM employees b 
WHERE b.salary <= a.salary) 
ORDER BY a.salary DESC;


--Q22 Write a query to get nth max salaries of employees. 
SELECT *
FROM employees emp1
WHERE (1) = (
SELECT COUNT(DISTINCT(emp2.salary))
FROM employees emp2
WHERE emp2.salary > emp1.salary);





