/*1) Write a query to rank employees based on their salary for a month*/

SELECT EmployeeID,FirstName,LastName,Salary,(DENSE_RANK() OVER(ORDER BY Salary DESC)) AS 'ERank' FROM employees;

/*2) Select 4th Highest salary from employee table using ranking function*/

SELECT * FROM (SELECT EmployeeID,FirstName,LastName,Salary,(DENSE_RANK() OVER(ORDER BY Salary DESC)) AS 'Rank' FROM employees)tmp WHERE Rank=4;

/*3) Get department, total salary with respect to a department from employee table.*/

SELECT DepartmentID, SUM(Salary) FROM employees GROUP BY DepartmentID;

/*4) Get department, total salary with respect to a department from employee table order by total salary descending*/

SELECT DepartmentID,SUM(Salary) AS 'TotalSalary' FROM employees GROUP BY DepartmentID ORDER BY TotalSalary DESC;

/*5) Get department wise maximum salary from employee table order by salary ascending*/

SELECT DepartmentID,MAX(Salary) FROM employees GROUP BY DepartmentID ORDER BY MAX(Salary) ASC;

/*6) Get department wise minimum salary from employee table order by salary ascending*/

SELECT DepartmentID,MIN(Salary) AS MinSalary FROM employees GROUP BY DepartmentID ORDER BY MinSalary ASC;

/*7) Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending*/

SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID HAVING TotalSalary > 50000 ORDER BY TotalSalary DESC;