USE AdventureWorksLT2019

--String Functions--

--ASCII-
SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2]
--CHAR--
SELECT CHAR(65) AS [65], CHAR(66) AS [66],   
CHAR(97) AS [97], CHAR(98) AS [98],   
CHAR(49) AS [49], CHAR(50) AS [50]
--CHARINDEX--
SELECT Name, CHARINDEX('Road',Name,0) FROM SalesLT.Product 
--CONCAT--
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result
--DIFFERENCE--
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene')
--FORMAT--
DECLARE @Date datetime=GETDATE()
SELECT FORMAT (@Date, 'd','en-us')
--LEFT--
SELECT LEFT(Name,5) FROM SalesLT.Product
--LEN--
SELECT Name, LEN(Name) AS Name_Len FROM  SalesLT.Product
--LOWER--
SELECT Name, LOWER(Name) AS Lower_Name FROM SalesLT.Product
--LTRIM--
SELECT LTRIM('     LTrim') AS Result
--PATINDEX--
SELECT position = PATINDEX('%cro%', 'Microsoft')
--REPLACE--
SELECT REPLACE('Csharp','sharp','#')
--REPLICATE--
SELECT REPLICATE('*',5)
--REVERSE--
SELECT REVERSE('abcde');
--RIGHT--
SELECT Name, RIGHT(Name,5) FROM SalesLT.Product
--RTRIM--
SELECT LTRIM('RTrim      ') AS Result
--SOUNDEX--
SELECT SOUNDEX ('Smit'), SOUNDEX ('Smith');  
--UPPER--
SELECT Name, UPPER(Name) AS Upper FROM SalesLT.Product




--DATE Functions--

SELECT SYSDATETIME()  
    ,SYSDATETIMEOFFSET()  
    ,SYSUTCDATETIME()  
    ,CURRENT_TIMESTAMP  
    ,GETDATE()  
    ,GETUTCDATE()

--DATEADD--
SELECT DATEADD(mm, 1, GETDATE())
SELECT DATEADD(year, 1, GETDATE())

--DATEDIFF--
SELECT DATEDIFF(day,SellStartDate,SellEndDate) AS Difference FROM SalesLT.Product

--DATENAME--
SELECT DATENAME(year, GETDATE())  
    ,DATENAME(month, GETDATE())  
    ,DATENAME(day, GETDATE())  
    ,DATENAME(dayofyear,GETDATE())  
    ,DATENAME(weekday, GETDATE())




--MATH Functions--

--ABS-- Convert Negative to Positive
SELECT ABS(-1.0), ABS(0.0), ABS(1.0)

--Ceiling--
SELECT CEILING($123.45), CEILING($-123.45), CEILING($0.0)

--Floor--
SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45)

--PI--
SELECT PI();  

--SQRT--
SELECT SQRT(1.00), SQRT(9.00)

--Square--
SELECT SQUARE(2)




--SYSTEM Functions--

--HOST_ID--
SELECT host_id() AS HostId

--HOST_NAME--
SELECT host_name() AS HostName
 
--CONTEXT_INFO--
SELECT CONTEXT_INFO()

--CURRENT_TRANSACTION_ID--
SELECT CURRENT_TRANSACTION_ID()  

--GATANSINULL--
SELECT GETANSINULL('AdventureWorks2016')  

--ISNULL--
SELECT AVG(ISNULL(Weight, 50))  
FROM Production.Product 