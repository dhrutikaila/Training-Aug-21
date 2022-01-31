--1.String Functions

----------ASCII---------------
SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2]

---------CHAR-----------------
SELECT CHAR(65) AS NumberCodeToCharacter

-------CHARINDEX------------------
DECLARE @document VARCHAR(64)    
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.'  
SELECT CHARINDEX('vital', @document, 5)  

SELECT CHARINDEX('e', 'Engineer') AS MatchPosition

SELECT CHARINDEX('e', 'Engineer',2) AS MatchPosition

--------------------CONCAT----------------------

SELECT CONCAT ( 'Happy ', 'Birthday ', 01, '/', '14' ) AS Result

SELECT CONCAT('SQL', ' is', ' fun!') AS Result

------------------------CONCAT_WS-----------------------------
SELECT CONCAT_WS( ' - ', database_id, recovery_model_desc, containment_desc) AS DatabaseInfo
FROM sys.databases

SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address

------------------------DIFFERENCE-----------------------------
-- Returns a DIFFERENCE value of 4, the least possible difference.  
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene')   
GO  

------------------------FORMAT-----------------------------
DECLARE @d DATE = GETDATE()   
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'Date'  
       ,FORMAT(123456789,'###-##-####') AS 'Custom Number'

SELECT TOP(5) CurrencyRateID, EndOfDayRate  
            ,FORMAT(EndOfDayRate, 'N', 'en-us') AS 'Number Format'  
            ,FORMAT(EndOfDayRate, 'G', 'en-us') AS 'General Format'  
            ,FORMAT(EndOfDayRate, 'C', 'en-us') AS 'Currency Format'  
FROM Sales.CurrencyRate  
ORDER BY CurrencyRateID

------------------------LEFT-----------------------------  
SELECT LEFT(Name, 5) AS [Name]  
FROM Production.Product  
ORDER BY ProductID

------------------------LEN-----------------------------
SELECT LEN(FirstName) AS Length, FirstName, LastName   
FROM Sales.vIndividualCustomer  
WHERE CountryRegionName = 'Australia' 

------------------------LOWER----------------------------- 
SELECT LOWER(FirstName) AS [NAME] FROM Employees


------------------------LTRIM----------------------------- 
DECLARE @string_to_trim VARCHAR(60)   
SET @string_to_trim = '     5 spaces are at the beginning of this string.'   
SELECT 
    @string_to_trim AS 'Original string',
    LTRIM(@string_to_trim) AS 'Without spaces'  

------------------------NCHAR-----------------------------  
DECLARE @d NVARCHAR(10) 
SET @d= 'ø' 
SELECT NCHAR(UNICODE(@d))

------------------------PATINDEX ----------------------------- 
SELECT position = PATINDEX('%ter%', 'interesting data')

SELECT position = PATINDEX('%ensure%',DocumentSummary)  
FROM Production.Document  
WHERE DocumentNode = 0x7B40  

SELECT position = PATINDEX('%[^ 0-9A-z]%', 'Please ensure the door is locked!')

------------------------QUOTENAME----------------------------- 
SELECT QUOTENAME('abc[]def')

SELECT QUOTENAME('abcdef', '()')

------------------------REPLACE----------------------------- 
SELECT REPLACE('SQL Tutorial', 'SQL', 'HTML')

------------------------REPLICATE----------------------------- 
CREATE TABLE t1   
(  
 c1 varchar(3),  
 c2 char(3)  
)  
INSERT INTO t1 VALUES ('2', '2'), ('37', '37'),('597', '597')

SELECT REPLICATE('0', 3 - DATALENGTH(c1)) + c1 AS 'Varchar Column',  
       REPLICATE('0', 3 - DATALENGTH(c2)) + c2 AS 'Char Column'  
FROM t1
 
--HERE CHAR(3) DIRECT CONTAIN 3BIT IN MEMEORY

------------------------REVERSE----------------------------
SELECT FirstName, REVERSE(FirstName) AS Reverse  
FROM Person.Person  
WHERE BusinessEntityID < 5  
ORDER BY FirstName 

SELECT REVERSE(1234) AS Reversed 

------------------------RIGHT----------------------------- 
SELECT RIGHT(FirstName, 5) AS 'First Name'  
FROM Person.Person  
WHERE BusinessEntityID < 5  
ORDER BY FirstName  

SELECT RIGHT('abcdefg', 2)

------------------------RTRIM----------------------------- 
SELECT RTRIM('Removes trailing spaces.   ')

------------------------SOUNDEX----------------------------- 
-- Using SOUNDEX  
SELECT SOUNDEX ('CUT'), SOUNDEX ('CT')

SELECT DIFFERENCE('CUT', 'CT')

------------------------SPACE-----------------------------
SELECT RTRIM(LastName) + ',' + SPACE(2) +  LTRIM(FirstName)  
FROM Person.Person  
ORDER BY LastName, FirstName

------------------------STR-----------------------------
--The STR() function returns a number as a string.
--STR(number, length, decimals)
SELECT STR(123.45, 6, 1) 

SELECT STR(123.45, 2, 2)

SELECT STR (FLOOR (123.45), 8, 3)

------------------------STRING_AGG-----------------------------
SELECT STRING_AGG(CONVERT(NVARCHAR(max), ISNULL(FirstName,'N/A')), ',') AS csv 
FROM Person.Person

SELECT STRING_AGG(CONVERT(NVARCHAR(max), CONCAT(FirstName, ' ', LastName, '(', ModifiedDate, ')')), CHAR(13)) AS names 
FROM Person.Person
------------------------STRING_ESCAPE----------------------------- 
--Quotation mark (")	\"
--Reverse solidus (\)	\\
--Solidus (/)	\/
--Backspace	\b
--Form feed	\f
--New line	\n
--Carriage return	\r
--Horizontal tab	\t

SELECT STRING_ESCAPE('\   /  
\\    "     ', 'json') AS escapedText

------------------------STUFF-----------------------------
SELECT STUFF('abcdef', 2, 3, 'ijklmn')

SELECT STUFF('SQL Tutorial', 1, 3, 'HTML')
------------------------SUBSTRING-----------------------------
--SUBSTRING(string, start, length)
SELECT x = SUBSTRING('abcdef', 2, 3)

------------------------TRANSLATE----------------------------- 
SELECT TRANSLATE('[137.4, 72.3]' , '[,]', '( )') AS Point,
    TRANSLATE('(137.4 72.3)' , '( )', '[,]') AS Coordinates,
	TRANSLATE('abcdef','abc','bcd') AS Translated

------------------------TRIM----------------------------- 
SELECT TRIM( '     test    ') AS Result

SELECT TRIM('#! ' FROM '    #SQL Tutorial!    ') AS TrimmedString
------------------------UNICODE----------------------------- 
--UNICODE function returns a UCS-2 codepoint in the range 000000 through 00FFFF 
--which is capable of representing the 65,535 characters in the Unicode 
--Basic Multilingual Plane (BMP)

DECLARE @nstring NCHAR(12)   
SET @nstring = N'Åkergatan 24'   
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring))

------------------------UPPER----------------------------- 
SELECT UPPER(FirstName) AS [NAME] FROM Employees 

--------------------------------------2.Date Functions-----------------------------------------
------------------------CURRENT_TIMESTAMP----------------------------- 
SELECT SYSDATETIME()  
    ,SYSDATETIMEOFFSET()  
    ,SYSUTCDATETIME()  
    ,CURRENT_TIMESTAMP  
    ,GETDATE()  
    ,GETUTCDATE()  

SELECT CURRENT_TIMESTAMP

------------------------DATEADD----------------------------- 
DECLARE @datetime2 datetime2 = '2007-01-01 13:10:10.1111111'  
SELECT 'year', DATEADD(year,1,@datetime2)  
UNION ALL  
SELECT 'quarter',DATEADD(quarter,1,@datetime2)  
UNION ALL  
SELECT 'month',DATEADD(month,1,@datetime2)  
UNION ALL  
SELECT 'dayofyear',DATEADD(dayofyear,1,@datetime2)  
UNION ALL  
SELECT 'day',DATEADD(day,1,@datetime2)  
UNION ALL  
SELECT 'week',DATEADD(week,1,@datetime2)  
UNION ALL  
SELECT 'weekday',DATEADD(weekday,1,@datetime2)  
UNION ALL  
SELECT 'hour',DATEADD(hour,1,@datetime2)  
UNION ALL  
SELECT 'minute',DATEADD(minute,1,@datetime2)  
UNION ALL  
SELECT 'second',DATEADD(second,1,@datetime2)  
UNION ALL  
SELECT 'millisecond',DATEADD(millisecond,1,@datetime2)  
UNION ALL  
SELECT 'microsecond',DATEADD(microsecond,1,@datetime2)  
UNION ALL  
SELECT 'nanosecond',DATEADD(nanosecond,1,@datetime2)

DECLARE @days INT = 365,   
@datetime DATETIME = '2000-01-01 01:01:01.111'
SELECT DATEADD(day, @days, @datetime)

SELECT DATEADD(month,-(10/2), SYSDATETIME())

-------------------------DATEDIFF---------------------------- 
SELECT DATEDIFF(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(quarter,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(month,       '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(dayofyear,   '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(day,         '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(week,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(hour,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(minute,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(second,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(millisecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 
SELECT DATEDIFF(microsecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000') 

SELECT DATEDIFF(day,
    (SELECT MIN(OrderDate) FROM Sales.SalesOrderHeader),  
    (SELECT MAX(OrderDate) FROM Sales.SalesOrderHeader))

------------------------DATEFROMPARTS----------------------------- 
SELECT DATEFROMPARTS(2018, 10, 31) AS Result

------------------------DATENAME----------------------------- 
SELECT DATENAME(MM, '2017/08/25') AS DatePartString

------------------------DATEPART----------------------------- 
SELECT DATEPART(year, '2017/08/25') AS DatePartInt

------------------------day----------------------------- 
SELECT DAY('2017/08/13 09:08') AS DayOfMonth

SELECT DAY(GETDATE()) AS TODAY_DATE

------------------------EOMONTH----------------------------- 
DECLARE @date DATETIME = GETDATE()  
SELECT EOMONTH ( @date ) AS 'This Month' 
SELECT EOMONTH ( @date, 1 ) AS 'Next Month' 
SELECT EOMONTH ( @date, -1 ) AS 'Last Month'  


------------------------GETDATE----------------------------- 
SELECT GETDATE()

------------------------GETUTCDATE----------------------------- 
SELECT GETUTCDATE()

------------------------ISDATE----------------------------- 
SELECT ISDATE('2017-12-12')
SELECT ISDATE('Hello world!')

------------------------LEN----------------------------- 
SELECT MONTH('2017/08/25') AS Month

SELECT MONTH(GETDATE()) AS MONTH

------------------------LEN----------------------------- 
SELECT SYSDATETIME() AS SysDateTime

------------------------LEN----------------------------- 
SELECT YEAR('2017/08/25') AS Year

SELECT YEAR(GETDATE()) AS Year

----------------------------3.Mathematical Functions------------------------------

------------------------ABS----------------------------- 
SELECT Abs(-243.5) AS AbsNum

------------------------ACOS-----------------------------
SELECT ACOS(0.25)
------------------------ASIN----------------------------- 
SELECT ASIN(0.25)

------------------------LOG,EXP-----------------------------

SELECT EXP( LOG(20)), LOG( EXP(20))
------------------------LOG10----------------------------- 
SELECT LOG10(10)

------------------------DEGREES-----------------------------
SELECT 'The number of degrees in PI/2 radians is: ' +   
CONVERT(VARCHAR, DEGREES((PI()/2)))  


------------------------CEILING----------------------------- 
SELECT CEILING(25.75) AS CeilValue

------------------------Floor----------------------------- 
SELECT FLOOR(25.75) AS FloorValue

------------------------RAND----------------------------- 
SELECT RAND(10)

------------------------ROUND----------------------------- 
SELECT ROUND(235.415, 2) AS RoundValue

------------------------PI----------------------------- 
SELECT PI()
------------------------POWER----------------------------- 
SELECT POWER(4, 3)
------------------------SIGN----------------------------- 
SELECT SIGN(-12)
------------------------SQRT----------------------------- 
SELECT SQRT(64)
------------------------SQUARE-----------------------------
SELECT SQUARE(8)
------------------------TAN-----------------------------
SELECT TAN(1)

