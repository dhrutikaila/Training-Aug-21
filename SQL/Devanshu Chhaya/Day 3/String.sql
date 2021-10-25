--- ******* DATE FUNCTION****** --------
--- 1. ASCII, CHAR AND UNICODE------
SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2];

SELECT ASCII('P') AS [ASCII], ASCII('æ') AS [Extended_ASCII];

SELECT NCHAR(80) AS [CHARACTER], NCHAR(230) AS [CHARACTER];

SELECT UNICODE('æ') AS [Extended_ASCII], NCHAR(230) AS [CHARACTER];

----2. char ---

SELECT CHAR(65) AS [65], CHAR(66) AS [66],   
CHAR(97) AS [97], CHAR(98) AS [98],   
CHAR(49) AS [49], CHAR(50) AS [50];

SELECT name, 'was created on ', create_date, CHAR(65), name, 'is currently ', state_desc   
FROM sys.databases;  
GO



----3. CharIndex---

DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bicycle', @document);  


DECLARE @document VARCHAR(64);   
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('vital', @document, 5);  


DECLARE @document VARCHAR(64);    
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bike', @document);  

SELECT CHARINDEX ( 'TEST', 'This is a Test');

SELECT CHARINDEX ( 'TEST', 'This is a Test' COLLATE Latin1_General_CS_AS); 


------- 4. Concate --------

CREATE TABLE #temp (  
    emp_name NVARCHAR(200) NOT NULL,  
    emp_middlename NVARCHAR(200) NULL,  
    emp_lastname NVARCHAR(200) NOT NULL  
);  
INSERT INTO #temp VALUES( 'Name', NULL, 'Lastname' );  
SELECT CONCAT( emp_name, emp_middlename, emp_lastname ) AS Result  
FROM #temp;


------ 5. Concate_WS

SELECT CONCAT_WS( ' - ', database_id, recovery_model_desc, containment_desc) AS DatabaseInfo
FROM sys.databases;

SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address;

SELECT 
STRING_AGG(CONCAT_WS( ',', database_id, recovery_model_desc, containment_desc), char(13)) AS DatabaseInfo
FROM sys.databases



----- 6. Difference
DIFFERENCE ( character_expression , character_expression )

-- Returns a DIFFERENCE value of 4, the least possible difference.  
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');  
GO  
-- Returns a DIFFERENCE value of 0, the highest possible difference.  
SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  
GO

------ 7. format.
FORMAT( value, format [, culture ] )

DECLARE @d DATE = '11/22/2020';
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'd', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'd', 'de-de' ) 'German'  
      ,FORMAT( @d, 'd', 'zh-cn' ) 'Simplified Chinese (PRC)';  
  
SELECT FORMAT( @d, 'D', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'D', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'D', 'de-de' ) 'German'  
      ,FORMAT( @d, 'D', 'zh-cn' ) 'Chinese (Simplified PRC)';

DECLARE @d DATE = GETDATE();  
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'Date'  
       ,FORMAT(123456789,'###-##-####') AS 'Custom Number';

SELECT TOP(5) CurrencyRateID, EndOfDayRate  
            ,FORMAT(EndOfDayRate, 'N', 'en-us') AS 'Number Format'  
            ,FORMAT(EndOfDayRate, 'G', 'en-us') AS 'General Format'  
            ,FORMAT(EndOfDayRate, 'C', 'en-us') AS 'Currency Format'  
FROM Sales.CurrencyRate  
ORDER BY CurrencyRateID;

SELECT TOP(5) CurrencyRateID, EndOfDayRate  
      ,FORMAT(EndOfDayRate, 'N', 'de-de') AS 'Numeric Format'  
      ,FORMAT(EndOfDayRate, 'G', 'de-de') AS 'General Format'  
      ,FORMAT(EndOfDayRate, 'C', 'de-de') AS 'Currency Format'  
FROM Sales.CurrencyRate  
ORDER BY CurrencyRateID;


--FORMAT returns NULL in these cases because . and : are not escaped.


SELECT FORMAT(cast('07:35' as time), N'hh.mm');   --> returns NULL  
SELECT FORMAT(cast('07:35' as time), N'hh:mm');   --> returns NULL  
--Format returns a formatted string because the . and : are escaped.


SELECT FORMAT(cast('07:35' as time), N'hh\.mm');  --> returns 07.35  
SELECT FORMAT(cast('07:35' as time), N'hh\:mm');  --> returns 07:35  
--Format returns a formatted current time with AM or PM specified


SELECT FORMAT(SYSDATETIME(), N'hh:mm tt'); -- returns 03:46 PM
SELECT FORMAT(SYSDATETIME(), N'hh:mm t'); -- returns 03:46 P
--Format returns the specified time, displaying AM


select FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm tt') -- returns 01:00 AM
select FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm t')  -- returns 01:00 A
--Format returns the specified time, displaying PM


select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm tt') -- returns 02:00 PM
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm t') -- returns 02:00 P
--Format returns the specified time in 24h format


select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') -- returns 14:00


-----8. Left

LEFT ( character_expression , integer_expression )


  
SELECT LEFT('abcdefg',2) FROM dbo.DimProduct;


------9. len

LEN ( string_expression )

SELECT LEN(FirstName) AS Length, FirstName, LastName   
FROM Sales.vIndividualCustomer  
WHERE CountryRegionName = 'Australia';  
GO

----10. Lower

LOWER ( character_expression )

-- Uses AdventureWorks  
  
SELECT LOWER(SUBSTRING(EnglishProductName, 1, 20)) AS Lower,   
       UPPER(SUBSTRING(EnglishProductName, 1, 20)) AS Upper,   
       LOWER(UPPER(SUBSTRING(EnglishProductName, 1, 20))) As LowerUpper  
FROM dbo.DimProduct  
WHERE ListPrice between 11.00 and 20.00;


-----11. Ltrim

LTRIM ( character_expression )

SELECT LTRIM('     Five spaces are at the beginning of this string.');

DECLARE @string_to_trim VARCHAR(60);  
SET @string_to_trim = '     5 spaces are at the beginning of this string.';  
SELECT 
    @string_to_trim AS 'Original string',
    LTRIM(@string_to_trim) AS 'Without spaces';  
GO

------12. NCHAR

DECLARE @nstring NCHAR(8);  
SET @nstring = N'København';  
SELECT UNICODE(SUBSTRING(@nstring, 2, 1)),   
   NCHAR(UNICODE(SUBSTRING(@nstring, 2, 1)));  
GO

-----13. PATINDEX

PATINDEX ( '%pattern%' , expression )

SELECT position = PATINDEX('%ter%', 'interesting data');

SELECT position = PATINDEX('%ensure%',DocumentSummary)  
FROM Production.Document  
WHERE DocumentNode = 0x7B40;  
GO

SELECT position = PATINDEX('%en_ure%', 'Please ensure the door is locked!');

SELECT position = PATINDEX('%[^ 0-9A-z]%', 'Please ensure the door is locked!');

USE tempdb;  
GO  
SELECT PATINDEX ( '%ein%', 'Das ist ein Test'  COLLATE Latin1_General_BIN) ;  
GO

-------14. QUOTENAME

QUOTENAME ( 'character_string' [ , 'quote_character' ] )

SELECT QUOTENAME('abc[]def');

-----15. replace

REPLACE ( string_expression , string_pattern , string_replacement )

SELECT REPLACE('abcdefghicde','cde','xxx');  
GO

----16.replicate

REPLICATE ( string_expression , integer_expression )

SELECT [Name]  
, REPLICATE('0', 4) + [ProductLine] AS 'Line Code'  
FROM [Production].[Product]  
WHERE [ProductLine] = 'T'  
ORDER BY [Name];  
GO


-----17. reverse

REVERSE ( string_expression )

SELECT FirstName, REVERSE(FirstName) AS Reverse  
FROM Person.Person  
WHERE BusinessEntityID < 5  
ORDER BY FirstName;  
GO

----18. right

RIGHT ( character_expression , integer_expression )

SELECT RIGHT(FirstName, 5) AS 'First Name'  
FROM Person.Person  
WHERE BusinessEntityID < 5  
ORDER BY FirstName;  
GO

----19. rtrim

RTRIM ( character_expression )

SELECT RTRIM('Removes trailing spaces.   ');

SELECT RTRIM('Four spaces are after the period in this sentence.    ') + 'Next string.';

----20. soundex

SOUNDEX ( character_expression )

-- Using SOUNDEX  
SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');

-- Using DIFFERENCE  
SELECT DIFFERENCE('Smithers', 'Smythers');  
GO

---------21. space

SPACE ( integer_expression )

USE AdventureWorks2012;  
GO  
SELECT RTRIM(LastName) + ',' + SPACE(2) +  LTRIM(FirstName)  
FROM Person.Person  
ORDER BY LastName, FirstName;  
GO

----22. str

STR ( float_expression [ , length [ , decimal ] ] )

SELECT STR(123.45, 6, 1);  
GO

-------23. STRING_AGG

STRING_AGG ( expression, separator ) [ <order_clause> ]

<order_clause> ::=   
    WITHIN GROUP ( ORDER BY <order_by_expression_list> [ ASC | DESC ] )

USE AdventureWorks2016
GO
SELECT STRING_AGG (CONVERT(NVARCHAR(max),FirstName), CHAR(13)) AS csv 
FROM Person.Person;


USE AdventureWorks2016
GO
SELECT STRING_AGG(CONVERT(NVARCHAR(max), ISNULL(FirstName,'N/A')), ',') AS csv 
FROM Person.Person;

------24.STRING_ESCAPE

STRING_ESCAPE( text , type )

SELECT STRING_ESCAPE('\   /  
\\    "     ', 'json') AS escapedText;


----25. STUFF

STUFF ( character_expression , start , length , replaceWith_expression )

SELECT STUFF('abcdef', 2, 3, 'ijklmn');  
GO


---26. SUBSTRING
SUBSTRING ( expression ,start , length )

SELECT name, SUBSTRING(name, 1, 1) AS Initial ,
SUBSTRING(name, 3, 2) AS ThirdAndFourthCharacters
FROM sys.databases  
WHERE database_id < 5;


---- 27. translate
TRANSLATE ( inputString, characters, translations)

SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');


-----28. trim
-- Syntax for SQL Server and Azure SQL Database
TRIM ( [ characters FROM ] string )

SELECT TRIM( '     test    ') AS Result;

SELECT TRIM( '.,! ' FROM  '     #     test    .') AS Result;

-----29. unicode

UNICODE ( 'ncharacter_expression' )

DECLARE @nstring NCHAR(12);  
SET @nstring = N'Åkergatan 24';  
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring));

----30.UPPER

UPPER ( character_expression )

-- Uses AdventureWorks  
  
SELECT UPPER(RTRIM(LastName)) + ', ' + FirstName AS Name  
FROM dbo.DimEmployee  
ORDER BY LastName;