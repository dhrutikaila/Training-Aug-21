--1) Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
SELECT firstname'first_name', lastname 'last_name'
FROM Employee 

--2) Write a query to get unique department ID from employee table.
SELECT DISTINCT departmentID
FROM Employee;

--3)Write a query to get all employee details from the employee table order by first name, descending.
SELECT * FROM Employee
ORDER BY firstname DESC

--4)Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary).
SELECT firstname'first_name', lastname 'last_name',Salary*.12 PF
FROM Employee

--5)Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT employeeID,  (firstname  +lastname)'names', salary 
FROM Employee


--6) Write a query to get the total salaries payable to employees.



--7)Write a query to get the maximum and minimum salary from employees table.
SELECT MAX(Salary) FROM Employee
SELECT MIN(Salary) FROM Employee

--8)Write a query to get the average salary and number of employees in the employees table.
SELECT AVG(Salary) FROM Employee

--9)Write a query to get the number of employees working with the company.

	SELECT
	e.departmentid,
	d.departmentname,
	COUNT(*)
FROM
	employee e
INNER JOIN department d ON d.departmentid = e.departmentid
GROUP BY
	e.departmentid


--10)Write a query to get the number of jobs available in the employees table.

SELECT COUNT(DISTINCT jobid) 'jobs available'
    FROM employee;

--11)Write a query get all first name from employees table in uppr case.
SELECT UPPER(firstname)
FROM employee;
