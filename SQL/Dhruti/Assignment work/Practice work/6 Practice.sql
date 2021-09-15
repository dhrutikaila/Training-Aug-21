--1. Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 in department 30 or 100..
SELECT FirstName ,LastName,salary
FROM Employee
WHERE Salary NOT BETWEEN 10000 AND 15000
AND Departmentid IN (30,100);

--2. Write a query to display the names (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending alphabetical order by department ID.
SELECT FirstName,LastName,DepartmentID 
FROM Employee
WHERE DepartmentID IN (30,100)
ORDER BY DepartmentID

--4. Write a query to display the names (first_name, last_name) and hire date for all employees who were hired in 1987.
SELECT FirstName,LastName,HireDate
FROM Employee
WHERE YEAR(HireDate) LIKE '1987%'; 

--5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
SELECT FirstName
FROM Employee 
WHERE FirstName LIKE '%b%'
AND FirstName LIKE '%C%';

--6. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.
SELECT LastName, jobID,salary
FROM Employee
WHERE JobID IN ('IT_PROG','SH_CLERK')
AND Salary NOT IN (4500,10000,15000);

--7. Write a query to display the last names of employees whose names have exactly 6 characters.
SELECT LastName FROM Employee WHERE LastName LIKE '______';

--8. Write a query to display the last names of employees having 'e' as the third character.
SELECT LastName FROM Employee WHERE LastName LIKE '__e%';

--9. Write a query to display the jobs/designations available in the employees table.
SELECT DISTINCT JobID FROM Employee;

--11. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT * FROM Employee
WHERE LastName IN ('BLAKE','SCOTT','KING','FORD');