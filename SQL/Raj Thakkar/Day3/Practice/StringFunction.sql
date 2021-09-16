--ASCII--
SELECT ASCII('R') AS A, ASCII('X') AS B   
SELECT ASCII('r') AS a, ASCII('x') AS b  
SELECT ASCII(4) AS [4], ASCII(9) AS [9]  

SELECT ASCII('P') AS [ASCII], 
       ASCII('æ') AS [Extended_ASCII]

--CHAR--NCHAR--
SELECT CHAR(65) AS [65], 
       CHAR(66) AS [66], 
	   CHAR(97) AS [97], 
	   CHAR(98) AS [98], 
	   CHAR(49) AS [49], 
	   CHAR(50) AS [50]

DECLARE @nstring NCHAR(8);  
SET @nstring = N'København';  
SELECT UNICODE(SUBSTRING(@nstring, 2, 1)),   
   NCHAR(UNICODE(SUBSTRING(@nstring, 2, 1)))

--CHARINDEX--
--Returning the starting position of an expression
DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  ' components of your bicycle.'
SELECT CHARINDEX('bicycle', @document)
GO  

-- Searching from a specific position
DECLARE @document VARCHAR(64)
SELECT @document = 'Reflectors are vital safety' + ' components of your bicycle.'
SELECT CHARINDEX('vital', @document, 5)
GO  

--Searching for a nonexistent expression
DECLARE @document VARCHAR(64)
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.' 
SELECT CHARINDEX('bike', @document)
GO  
 
--perform a case sensitive search  
SELECT CHARINDEX ( 'TEST', 'This is a Test'  
       COLLATE Latin1_General_CS_AS)

SELECT CHARINDEX ( 'TEST', 'This is a Test' )

--CONCAT--
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result

--Concatenating values with separator
SELECT CONCAT_WS( ' _ ', database_id, recovery_model_desc, containment_desc) AS DatabaseInfo
FROM sys.databases

--Skipping NULL values
SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address

--DIFFERENCE--
-- Returns a DIFFERENCE value of 4, the least possible difference.  
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene')
-- Returns a DIFFERENCE value of 0, the highest possible difference.  
SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene')

--FORMAT--
DECLARE @d DATE = '11/22/2020'
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'd', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'd', 'de-de' ) 'German'  
      ,FORMAT( @d, 'd', 'zh-cn' ) 'Simplified Chinese (PRC)' 
  
SELECT FORMAT( @d, 'D', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'D', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'D', 'de-de' ) 'German'  
      ,FORMAT( @d, 'D', 'zh-cn' ) 'Chinese (Simplified PRC)'

SELECT FORMAT(CAST('07:35' as time), N'hh\.mm')
SELECT FORMAT(CAST('07:35' as time), N'hh\:mm')  

--LEFT--RIGHT--
SELECT LEFT('abcdefg',2)
SELECT RIGHT('abcdefg',2)

--LEN--
SELECT LEN(FirstName) AS Length, FirstName, LastName   
FROM Sales.vIndividualCustomer

--LOWER--UPPER--
SELECT LOWER(FirstName) AS Lower,   
       UPPER(SUBSTRING(FirstName, 1, 20)) AS Upper,   
       LOWER(SUBSTRING(FirstName, 1, 20)) As Lower  
FROM Person.Person 

--LTRIM--RTRIM--TRIM
SELECT LTRIM('     Five spaces are at the beginning of this string.')
SELECT RTRIM('Removes trailing spaces.   ')
SELECT TRIM( '     test    ') AS Result
SELECT TRIM( '.,! ' FROM  '     #     test    .') AS Result

--PATINDEX--
SELECT position = PATINDEX('%ter%', 'interesting data')
SELECT position = PATINDEX('%en_ure%', 'Please ensure the door is locked!')

--QUOTENAME--
SELECT QUOTENAME('abc[]def')

--REPLACE--
SELECT REPLACE('abcdefghicde','cde','xxx')

--REPLICATE--
SELECT [Name]  , REPLICATE('0', 4) + [ProductLine] AS 'Line Code'  
FROM [Production].[Product]  
WHERE [ProductLine] = 'T'  
ORDER BY [Name]

--REVERSE--
SELECT FirstName, REVERSE(FirstName) AS Reverse  
FROM Person.Person  
WHERE BusinessEntityID < 5  
ORDER BY FirstName

--SOUND--
SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe')

--SPACE--
SELECT RTRIM(LastName) + ',' + SPACE(2) +  LTRIM(FirstName)  
FROM Person.Person  
ORDER BY LastName, FirstName

--STR--
SELECT STR(123.45, 6, 1)

--STRING_AGG--
SELECT TOP 10 City, STRING_AGG(CONVERT(NVARCHAR(max), EmailAddress), ';') AS emails 
FROM Person.BusinessEntityAddress AS BEA  
INNER JOIN Person.Address AS A ON BEA.AddressID = A.AddressID
INNER JOIN Person.EmailAddress AS EA ON BEA.BusinessEntityID = EA.BusinessEntityID 
GROUP BY City

--STRING_ESCAPE--
SELECT STRING_ESCAPE('\   /  
\\    "     ', 'json') AS escapedText

--STUFF--
SELECT STUFF('abcdef', 2, 3, 'ijklmn')

--SUBSTRING--
SELECT name, SUBSTRING(name, 1, 1) AS Initial ,
SUBSTRING(name, 3, 2) AS ThirdAndFourthCharacters
FROM sys.databases  
WHERE database_id < 5

--TRANSLATE--
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()')

--UNICODE--
DECLARE @nstring NCHAR(12)
SET @nstring = N'Åkergatan 24'
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring))