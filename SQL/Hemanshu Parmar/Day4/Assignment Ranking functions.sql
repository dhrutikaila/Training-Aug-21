

Query-1

--Write a query to rank employees based on their salary for a month
1. SELECT RANK() OVER (ORDER BY Salary DESC) [Salary_Rank],* FROM Employees

2. SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) [Salary_Rank],* FROM Employees


Query-2
--Select 4th Highest salary from employee table using ranking function
SELECT * INTO Pagar FROM 
(SELECT RANK() OVER (ORDER BY Salary DESC) [TOP_SALARY],
* FROM Employees) temp 

SELECT * FROM Pagar WHERE TOP_SALARY=4


Query-3
--Get department, total salary with respect to a department from employee table.
1. SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY ROLLUP (DepartmentID, Salary)

2. SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID


Query-4
--Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID, SUM(Salary) AS Salary FROM Employees GROUP BY DepartmentID ORDER BY Salary DESC



Query-5
--Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID, MAX(Salary) AS Salary FROM Employees GROUP BY DepartmentID ORDER BY Salary ASC


Query-6
--Get department wise minimum salary from employee table order by salary ascending
SELECT DepartmentID, MIN(Salary) AS Salary FROM Employees GROUP BY DepartmentID ORDER BY Salary DESC


Query-7
--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT * INTO Wages FROM 
(SELECT DepartmentID, SUM(Salary) AS Salary 
FROM Employees GROUP BY DepartmentID) temp

SELECT * FROM Wages WHERE Salary>5000 ORDER BY SALARY DESC