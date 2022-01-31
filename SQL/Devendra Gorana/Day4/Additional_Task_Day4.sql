SELECT *, NTILE(2) OVER(ORDER BY Salary DESC) Rank FROM Employees ORDER BY Rank

SELECT *, NTILE(4) OVER(ORDER BY Salary DESC) Rank FROM Employees ORDER BY Rank

SELECT *, NTILE(2) OVER(PARTITION BY JobId ORDER BY Salary DESC) Rank FROM Employees ORDER BY JobId, Rank

--Group by operations
SELECT COUNT(EmployeeID) AS 'Number',JobId,DepartmentID FROM Employees GROUP BY ROLLUP (JobId,DepartmentID) 

SELECT COUNT(EmployeeID) AS 'Number',JobId,DepartmentID FROM Employees GROUP BY CUBE (JobId,DepartmentID) ORDER BY COUNT(EmployeeID) DESC


