--1. current date
SELECT GETDATE() AS 'Current Date'

--2. current system date
SELECT SYSDATETIME() AS 'System Date'

--3. current date
SELECT CURRENT_TIMESTAMP AS 'TimeStamp'

--4. year, month & day part from date
SELECT 
	DATEPART(YEAR, '2025-10-04 15:19:07') AS 'year', 
	DATEPART(MONTH, '2026-05-04 15:19:07') AS 'month',
	DATEPART(DAY, '2027-09-04 15:19:07') AS 'day' 

--5. hour, minute & second part from date
SELECT
	DATEPART(HOUR, '2028-09-0 15:19:07') AS 'hour', 
	DATEPART(MINUTE, '2029-09-05 15:19:07') AS 'minute',
	DATEPART(SECOND, '2023-09-05 15:19:07') AS 'second'

--6. month name
SELECT DATENAME(MONTH, '2026-05-04 15:19:07') AS 'month'

--7. date add,date difference
SELECT DATEADD(DAY, 30, GETDATE()) AS 'Add Add'
SELECT DATEADD(MONTH, 36, GETDATE()) AS 'Month Add'
SELECT DATEADD(YEAR, -9, GETDATE()) AS 'Year Add'

SELECT DATEDIFF(DAY, '2002-05-01', GETDATE()) AS 'Day Diff'
SELECT DATEDIFF(MONTH, '2002-05-01', GETDATE()) AS 'Month Diff'
SELECT DATEDIFF(YEAR, '2002-05-01', GETDATE()) AS 'Year Diff'

--8. UTC Time difference
SELECT SYSDATETIMEOFFSET() AS 'UTC +/-'

--9. CAST,Floor,Ceiling
SELECT CAST(10.6496 AS INT) AS 'int'
SELECT CAST(-10.6496 AS NUMERIC) AS 'Numeric'
SELECT FLOOR(6.48) AS 'Floor', CEILING(6.48) AS 'Ceileing'

--10. CAST list price
SELECT SUBSTRING(Name, 1, 30) AS ProductName, ListPrice  
FROM SalesLT.Product  
WHERE CAST(ListPrice AS INT) LIKE '33%'

--11. Math Function on employees.
SELECT MAX(Salary) AS MAXSAL, MIN(Salary) AS MINSAL, AVG(Salary) AS AVGSAL, SUM(Salary) AS TTLSAL FROM Employees

--12. Total Emloyees
SELECT COUNT(EmployeeID) AS Employees FROM Employees

--13. Length
SELECT LEN(FirstName), FirstName AS 'LENGTH' FROM Employees
SELECT DATALENGTH('RxWeb DOT NET Trainees')

--14. Format
DECLARE @d DATETIME = GETDATE()
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',  
       FORMAT (@d, 'd', 'no') AS 'Norwegian Result',  
       FORMAT (@d, 'd', 'zu') AS 'Zulu Result';

--15. Left, Right
SELECT LEFT('Practice Exe', 6) AS ExtractString
SELECT RIGHT('Practice Exe', 6) AS ExtractString

--16. Replace, Replicate, Reverse
SELECT REPLACE('Practice Exercise', 'e', 'ii') AS Repl
SELECT REPLICATE('Paralympic Medals ', 5) AS Rep
SELECT REVERSE('Shinchan') AS Rev

--17. Upper, Lower
SELECT UPPER('Paralympic Medals') AS UP
SELECT LOWER('Paralympic Medals') AS LOW
