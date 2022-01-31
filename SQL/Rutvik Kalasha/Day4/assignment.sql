/*ASSIGNMENT*/

/*(1). Write a query to rank employees based on their salary for a month*/
SELECT FirstName,LastName,RANK() OVER (ORDER BY Salary DESC) FROM Employees

/*(2). Select 4th Highest salary from employee table using ranking function*/
SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) Rankk,* FROM Employees) tmp WHERE Rankk = 4;

/*(3). Get department, total salary with respect to a department from employee table.*/
SELECT DepartmentID, SUM(Salary) AS COUNTT FROM Employees GROUP BY DepartmentID;

/*(4). Get department, total salary with respect to a department from employee table order by total salary descending*/
SELECT DepartmentID, SUM(Salary) AS COUNTT FROM Employees GROUP BY DepartmentID ORDER BY COUNTT DESC;

/*(5). Get department wise maximum salary from employee table order by salary ascending*/
SELECT DepartmentID, MAX(Salary) AS TOTAL FROM Employees GROUP BY DepartmentID ORDER BY TOTAL ASC;

/*(6). Get department wise minimum salary from employee table order by salary ascending*/
SELECT DepartmentID, MIN(Salary) AS TOTAL FROM Employees GROUP BY DepartmentID ORDER BY TOTAL ASC;

/*(7). Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending*/
SELECT DepartmentID, SUM(Salary) AS COUNTT FROM Employees GROUP BY DepartmentID HAVING SUM(Salary) > 50000 ORDER BY COUNTT DESC;