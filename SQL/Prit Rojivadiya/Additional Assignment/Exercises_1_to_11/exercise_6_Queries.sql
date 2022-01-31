use db2

-- Q1 Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.

SELECT FirstName,LastName,Salary FROM Employees
WHERE Salary NOT BETWEEN 10000 AND 15000


-- Q2 Write a query to display the names (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending alphabetical order by department ID.

SELECT FirstName,LastName,DepartmentID FROM Employees WHERE DepartmentID IN (30,100)
ORDER BY DepartmentID ASC


-- Q3 Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.

SELECT FirstName,LastName,Salary FROM Employees WHERE DepartmentID IN (30,100) AND Salary NOT BETWEEN 10000 AND 15000


-- Q4 Write a query to display the names (first_name, last_name) and hire date for all employees who were hired in 1987.

SELECT FirstName,LastName,HireDate FROM Employees WHERE YEAR(HireDate) = 1987


-- Q5 Write a query to display the first_name of all employees who have both "b" and "c" in their first name.

SELECT FirstName FROM Employees WHERE FirstName LIKE '%B%C%'


-- Q6 Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.

SELECT LastName,JobId,Salary FROM Employees WHERE JobId IN ('IT_Prog','SH_CLERK') AND Salary NOT IN (4500,10000,15000)


-- Q7 Write a query to display the last names of employees whose names have exactly 6 characters.

SELECT LastName FROM Employees WHERE LEN(FirstName) = 6 AND LEN(LastName) = 6


-- Q8 Write a query to display the last names of employees having 'e' as the third character.

SELECT LastName FROM Employees WHERE CHARINDEX('e',LastName,1) = 3


-- Q9 Write a query to display the jobs/designations available in the employees table

SELECT DISTINCT JobId FROM Employees ORDER BY JobId ASC


-- Q10 Write a query to display the names (first_name, last_name), salary and PF (15% of salary) of all employees

SELECT FirstName,LastName,Salary,'PF' = 0.15*Salary FROM Employees


-- Q11 Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.

SELECT * FROM Employees WHERE LastName IN ('BLAKE', 'SCOTT', 'KING' , 'FORD')