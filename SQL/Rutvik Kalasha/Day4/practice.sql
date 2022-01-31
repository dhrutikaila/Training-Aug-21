
/*Aggregate Function And (Group BY, Group BY ROLLUP, Group BY CUBE, Group BY GROUPING SETS,Having Cluse) */

SELECT AVG(Salary)AS 'Average Salary',   
    SUM(Salary) AS 'Total Salary'  
FROM Employees;

SELECT CHECKSUM_AGG(CAST(Salary AS INT))  
FROM Employees;  

SELECT COUNT(DISTINCT FirstName)  
FROM Employees;

SELECT JobId, SUM(Salary) 'TotalSalesYTD', GROUPING(JobId) AS 'Grouping'  
FROM Employees  
GROUP BY JobId WITH ROLLUP;

SELECT MAX(Salary) FROM Employees; 

SELECT MIN(Salary) FROM Employees;

SELECT STDEV(DISTINCT Salary )AS DistinctValues, STDEV(Salary) AS AllValues  
FROM Employees;  

SELECT STDEVP(Salary)  
FROM Employees;  

SELECT JobId, COUNT(JobId) AS COUNTT FROM Employees GROUP BY JobId;

SELECT COALESCE(JobId,'TOTAL'), COUNT(JobId) AS COUNTT FROM Employees GROUP BY ROLLUP(JobId);

SELECT COALESCE(JobId,'TOTAL'),DepartmentID, COUNT(JobId) AS COUNTT FROM Employees GROUP BY CUBE(DepartmentID,JobId);

SELECT JobId, COUNT(JobId) FROM Employees GROUP BY JobId HAVING COUNT(JobId) > 1;

SELECT JobId, COUNT(JobId) AS COUNTT FROM Employees GROUP BY JobId HAVING COUNT(JobId) > 1 ORDER BY COUNT(JobId) DESC;

SELECT JobId,SUM(Salary),DepartmentID, COUNT(JobId) AS COUNTT FROM Employees GROUP BY GROUPING SETS((DepartmentID,JobId),(DepartmentID),());

/*Ranking Function*/
SELECT JobId,RANK() OVER (ORDER BY Salary DESC) FROM Employees

SELECT JobId,DENSE_RANK() OVER (ORDER BY Salary DESC) FROM Employees

SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) Rankk,* FROM Employees) tmp WHERE Rankk < 2

SELECT ROW_NUMBER() OVER(ORDER BY Salary DESC) [Row Number],FirstName,LastName,Salary FROM Employees

/*ASSIGNMENT*/

SELECT FirstName,LastName,RANK() OVER (ORDER BY Salary DESC) FROM Employees

SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) Rankk,* FROM Employees) tmp WHERE Rankk = 4;

SELECT DepartmentID, SUM(Salary) AS COUNTT FROM Employees GROUP BY DepartmentID;

SELECT DepartmentID, SUM(Salary) AS COUNTT FROM Employees GROUP BY DepartmentID ORDER BY COUNTT DESC;

SELECT DepartmentID, MAX(Salary) AS TOTAL FROM Employees GROUP BY DepartmentID ORDER BY TOTAL ASC;

SELECT DepartmentID, MIN(Salary) AS TOTAL FROM Employees GROUP BY DepartmentID ORDER BY TOTAL ASC;

SELECT DepartmentID, SUM(Salary) AS COUNTT FROM Employees GROUP BY DepartmentID HAVING SUM(Salary) > 50000 ORDER BY COUNTT DESC;

