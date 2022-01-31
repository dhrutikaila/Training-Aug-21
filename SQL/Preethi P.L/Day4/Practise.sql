/* Ranking Functions */

SELECT EmployeeID,Salary,(DENSE_RANK() OVER(ORDER BY Salary DESC)) AS ERank FROM employees;

SELECT EmployeeID,Salary,(RANK() OVER(ORDER BY Salary DESC)) AS ERank FROM employees;

SELECT EmployeeID,Salary,(ROW_NUMBER() OVER(ORDER BY Salary DESC)) AS ERank FROM employees

SELECT EmployeeID,DepartmentID,Salary,(PERCENT_RANK() OVER(ORDER BY Salary DESC)) AS ERank FROM employees;


/*Aggregate Functions*/

SELECT COUNT(*) FROM employees;
SELECT SUM(Salary) AS TotalSalary FROM employees;
SELECT MAX(Salary) AS MaxSalary FROM employees;
SELECT MIN(Salary) AS MinSalary FROM employees;
SELECT AVG(Salary) AS AvgSalary FROM employees;

/* GROUP BY */

SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID;

/*GROUP BY .... WITH ROLLUP */

SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID WITH ROLLUP;

/* HAVING CLAUSE */

SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID HAVING TotalSalary > 40000 ORDER BY TotalSalary DESC;

/* PARTITION CLAUSE */

SELECT EmployeeID,DepartmentID,(DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC)) AS ERank FROM employees;