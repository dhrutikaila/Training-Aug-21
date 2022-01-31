SELECT DATEDIFF(YEAR, '1981-04-1', GETDATE())

--Math Function
SELECT CEILING(25.75) AS CeilValue

SELECT EXP(2) AS E_RAIS_TO_GIVEN_NUMBER

SELECT FLOOR(25.75) AS FloorValue

SELECT POWER(4,2) AS Power_Of_Given_number

SELECT ROUND(235.415, 2) AS ROUND_NUMBER
SELECT ROUND(235.415, 2, 1)
SELECT ROUND(235.415, -1)

DECLARE @ranknumber int
SET @ranknumber = 4

SELECT * FROM
(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) 'Rank',* FROM Employees ) Tbl
WHERE Rank = @ranknumber ORDER BY Salary DESC

SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) 'Rank',* FROM Employees 

SELECT RANK() OVER(ORDER BY Salary) 'Rank', Salary FROM Employees ORDER BY Salary

SELECT ROW_NUMBER() OVER(ORDER BY SALARY) 'Rank', Salary FROM Employees ORDER BY SALARY

SELECT TOP 3 Salary, FirstName FROM Employees ORDER BY Salary DESC

SELECT *, NTILE(2) OVER(ORDER BY Salary DESC) Rank FROM Employees ORDER BY Rank

SELECT *, NTILE(4) OVER(ORDER BY Salary DESC) Rank FROM Employees ORDER BY Rank

SELECT *, NTILE(2) OVER(PARTITION BY JobId ORDER BY Salary DESC) Rank FROM Employees ORDER BY JobId, Rank

SELECT SUM(Salary) AS 'Total_Salary' From Employees
SELECT AVG(Salary) AS 'Avg_Salary' From Employees
SELECT COUNT(*) FROM Employees


SELECT SUM(Salary), COUNT(*), AVG(Salary) FROM Employees 

SELECT MIN(Salary) AS 'Min_Salary' FROM Employees
SELECT MAX(Salary) AS 'Max_Salary' FROM Employees


SELECT COUNT(EmployeeID) AS 'Number',JobId FROM Employees GROUP BY JobId HAVING COUNT(EmployeeID) >5 ORDER BY COUNT(EmployeeID) DESC

SELECT * INTO Temp FROM Employees
SELECT * FROM Temp
DROP TABLE Temp



