-------------ASSIGNMENT-------------
--Write a query to rank employees based on their salary for a month
SELECT RANK() OVER (ORDER BY Salary) AS RANK,FirstName,LastName,Salary FROM Employees;

SELECT DENSE_RANK() OVER (ORDER BY Salary)AS RANK,FirstName,LastName,Salary FROM Employees;

--Select 4th Highest salary from employee table using ranking function
SELECT Salary FROM
(SELECT RANK() OVER (ORDER BY Salary)RANKNo,FirstName,LastName,Salary FROM Employees) As Emp
WHERE Emp.RANKNo='4';

SELECT Salary FROM
(SELECT DENSE_RANK() OVER (ORDER BY Salary)RANKNo,FirstName,LastName,Salary FROM Employees) As Emp
WHERE Emp.RANKNo='4';

--Get department, total salary with respect to a department from employee table.
SELECT * FROM Employees

SELECT EMP.DepartmentID,DMP.DepartmentName,SUM(Salary) FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName;

--Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID,DepartmentName,TOTALSALARY FROM(SELECT EMP.DepartmentID,DMP.DepartmentName, SUM(Salary) AS TOTALSALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS EM_DP_TBL
ORDER BY TOTALSALARY DESC;

--Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID,DepartmentName,MAXSALARY FROM(SELECT EMP.DepartmentID,DMP.DepartmentName, MAX(Salary) AS MAXSALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS EM_DP_TBL
ORDER BY MAXSALARY;

--Get department wise minimum salary from employee table order by salary ascending
SELECT DepartmentID,DepartmentName,MINSALARY FROM(SELECT EMP.DepartmentID,DMP.DepartmentName, MIN(Salary) AS MINSALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS EM_DP_TBL
ORDER BY MINSALARY;

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID,DepartmentName,TOTALSALARY FROM(SELECT EMP.DepartmentID,DMP.DepartmentName, SUM(Salary) AS TOTALSALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS EM_DP_TBL
WHERE TOTALSALARY > 50000
ORDER BY TOTALSALARY DESC;