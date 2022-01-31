--DENSE_RANK--
SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS SRank
,      Salary 
FROM Employees



--RANK--
SELECT RANK() OVER(ORDER BY Salary DESC) AS SRank
,      Salary 
FROM Employees


--ROW_NUMBER--
SELECT ROW_NUMBER() OVER(ORDER BY Salary DESC) AS SRank
,      Salary 
FROM Employees


--NTILE--
SELECT NTILE(12) OVER(ORDER BY Salary DESC) AS SRank
,      Salary 
FROM Employees
