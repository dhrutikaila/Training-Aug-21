USE Day_7;

---1. Write a query to rank employees based on their salary for a month

select * from [dbo].[Employees]

SELECT SALARY,RANK() OVER(ORDER BY Salary  ASC) AS RankBySalary FROM dbo.Employees; 


---2.Select 4th Highest salary from employee table using ranking function

SELECT Salary FROM (SELECT SALARY, DENSE_RANK() OVER(ORDER BY Salary DESC) AS sal FROM dbo.Employees) temp WHERE sal=4;

----3. Get department, total salary with respect to a department from employee table.

SELECT DepartmentID, SUM (Salary)AS Total_Salary FROM dbo.Employees GROUP BY DepartmentID; 

---3. Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID, SUM (Salary)AS Total_Salary FROM dbo.Employees GROUP BY DepartmentID ORDER BY Total_Salary DESC;

----4. Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID, MAX(Salary) AS Max_Salary FROM dbo.Employees GROUP BY DepartmentID ORDER BY Max_Salary; 

---5. Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentID, MIN(Salary) AS Min_Salary FROM dbo.Employees GROUP BY DepartmentID ORDER BY Min_Salary;

----6. Select department, total salary with respect to a department from employee table where total salary 
---- greater than 50000 order by TotalSalary descending

SELECT DepartmentID, SUM(Salary) AS total_salary FROM dbo.Employees GROUP BY DepartmentID HAVING SUM(Salary)>5000 ORDER BY total_salary DESC;
