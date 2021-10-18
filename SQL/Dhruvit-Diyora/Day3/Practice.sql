--current date
SELECT GETDATE() AS 'Current Date'

--current system date
SELECT SYSDATETIME() AS 'System Date'

--current date time stamp
SELECT CURRENT_TIMESTAMP AS 'TimeStamp'

--year, month & day part from date example
SELECT DATEPART(YEAR, '2025-10-04 15:19:07') AS 'year', DATEPART(MONTH, '2026-05-04 15:19:07') AS 'month',DATEPART(DAY, '2027-09-04 15:19:07') AS 'day' 

--hour, minute & second part from date
SELECT DATEPART(HOUR, '2028-09-0 15:19:07') AS 'hour', DATEPART(MINUTE, '2029-09-05 15:19:07') AS 'minute',DATEPART(SECOND, '2023-09-05 15:19:07') AS 'second'

--month name
SELECT DATENAME(MONTH, '2026-05-04 15:19:07') AS 'month'

--date add,date difference
SELECT DATEADD(DAY, 10, GETDATE()) AS 'Add Add'
SELECT DATEADD(MONTH, 6, GETDATE()) AS 'Month Add'
SELECT DATEADD(YEAR, 5, GETDATE()) AS 'Year Add'

SELECT DATEDIFF(DAY, '2002-05-01', GETDATE()) AS 'Day Diff'
SELECT DATEDIFF(MONTH, '2002-05-01', GETDATE()) AS 'Month Diff'
SELECT DATEDIFF(YEAR, '2002-05-01', GETDATE()) AS 'Year Diff'

--UTC Time difference
SELECT SYSDATETIMEOFFSET() AS 'UTC +/-'

--CAST,Floor,Ceiling EXAMPle
SELECT CAST(6.85201 AS INT) AS 'int'
SELECT CAST(-9.6969 AS NUMERIC) AS 'Numeric'
SELECT FLOOR(6.89) AS 'Floor', CEILING(6.48) AS 'Ceileing'

--CAST list price
SELECT SUBSTRING(Name, 1, 30) AS ProductName, ListPrice  FROM Sales.Product WHERE CAST(ListPrice AS INT) LIKE '33%'

--Math Function on employees.
SELECT MAX(Salary) AS MAXSAL, MIN(Salary) AS MINSAL, AVG(Salary) AS AVGSAL, SUM(Salary) AS TTLSAL FROM Employees

--Total Emloyees
SELECT COUNT(EmployeeID) AS Employees FROM Employees

--Length example
SELECT LEN(FirstName), FirstName AS 'LENGTH' FROM Employees
SELECT DATALENGTH('RxWeb DOT NET Trainees')

--Format example
DECLARE @d DATETIME = GETDATE()
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',FORMAT (@d, 'd', 'no') AS 'Norwegian Result',FORMAT (@d, 'd', 'zu') AS 'Zulu Result';

--Left, Right example
SELECT LEFT('Practice Exe', 6) AS ExtractString
SELECT RIGHT('Practice Exe', 6) AS ExtractString

--Replace, Replicate, Reverse example
SELECT REPLACE('Practice Exercise', 'e', 'ii') AS Repl
SELECT REPLICATE('Paralympic Medals ', 5) AS Rep
SELECT REVERSE('Shinchan') AS Rev

--Upper, Lower example
SELECT UPPER('Paralympic Medals') AS UPSide
SELECT LOWER('Paralympic Medals') AS LOWCase
