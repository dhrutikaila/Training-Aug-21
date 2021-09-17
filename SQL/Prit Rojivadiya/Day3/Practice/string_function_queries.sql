-- ASCII code of character
SELECT ASCII('A') as A,ASCII(1) as [1],ASCII('æ') as [extended ascii]

-- ASCII to char
SELECT NCHAR(80) AS [CHARACTER], NCHAR(230) AS [CHARACTER];

SELECT CHAR(80) AS [CHARACTER], CHAR(230) AS [CHARACTER];

--
SET TEXTSIZE 0;    
DECLARE @position INT, @string CHAR(8);    
SET @position = 1;  
SET @string = 'New Moon';  
WHILE @position <= DATALENGTH(@string)  
   BEGIN  
   SELECT ASCII(SUBSTRING(@string, @position, 1)),   
      CHAR(ASCII(SUBSTRING(@string, @position, 1)))  
   SET @position = @position + 1  
   END;  
GO  

--

SELECT CHAR(65) as [65],CHAR(66) AS [66]

-- char(13) carriage return
SELECT name, 'was created on ', create_date, CHAR(13), name, 'is currently ', state_desc FROM sys.databases;  


SELECT CHAR(188) AS single_byte_representing_complete_character, 
  CHAR(0xBC) AS single_byte_representing_complete_character;  


SELECT NCHAR(0x266A) AS [eighth-note]
  , CONVERT(CHAR(2), 0x81F4) AS [context-dependent-convert]
  , CAST(0x81F4 AS CHAR(2)) AS [context-dependent-cast]



-- charindex search for first occurance index
DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bike', @document, 5);  

-- example of case sensitive
SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CS_AS); 


SELECT CHARINDEX ( 'Test',  
       'This is a Test'  
       COLLATE Latin1_General_CS_AS);  


 -- case insensitive example
 SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CI_AS);  

-- searching from start
SELECT CHARINDEX('is', 'This is a string');  

-- searching form other than first
SELECT CHARINDEX('is', 'This is a string', 4);  

-- returns 0 when not found
SELECT CHARINDEX('at', 'This is a string');

-- concate
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;  

-- concate with saperator
SELECT CONCAT_WS( ' -> ', database_id, recovery_model_desc, containment_desc) AS DatabaseInfo
FROM sys.databases;


-- skipping null values
SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address;

-- generating scv file
SELECT 
STRING_AGG(CONCAT_WS( ',', database_id, recovery_model_desc, containment_desc), char(13)) AS DatabaseInfo
FROM sys.databases


-- difference
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');  

SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  


-- format
DECLARE @d DATE = '11/22/2020';
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'd', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'd', 'de-de' ) 'German'  
      ,FORMAT( @d, 'd', 'zh-cn' ) 'Simplified Chinese (PRC)';  
  
SELECT FORMAT( @d, 'D', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'D', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'D', 'de-de' ) 'German'  
      ,FORMAT( @d, 'D', 'zh-cn' ) 'Chinese (Simplified PRC)';


DECLARE @d1 DATE = GETDATE();  
SELECT FORMAT( @d1, 'dd/MM/yyyy', 'en-US' ) AS 'Date'  
       ,FORMAT(123456789,'###-##-####') AS 'Custom Number'; 
	   

SELECT FORMAT(cast('07:35' as time), N'hh.mm');   --> returns NULL  
SELECT FORMAT(cast('07:35' as time), N'hh:mm');   --> returns NULL


SELECT FORMAT(cast('07:35' as time), N'hh\.mm');  --> returns 07.35  
SELECT FORMAT(cast('07:35' as time), N'hh\:mm');  --> returns 07:35


SELECT FORMAT(SYSDATETIME(), N'hh:mm tt'); -- returns 03:46 PM
SELECT FORMAT(SYSDATETIME(), N'hh:mm t'); -- returns 03:46 P


select FORMAT(CAST('2018-01-01 01:00' AS datetime), N'hh:mm tt') -- returns 01:00 AM
select FORMAT(CAST('2018-01-01 01:00' AS datetime), N'hh:mm t')  -- returns 01:00 A


-- 24 hours format
select FORMAT(CAST('2018-01-01 15:00' AS datetime), N'HH:mm') -- returns 14:00


-- left function
SELECT LEFT('abcdefg',2); 


-- len function
  DECLARE @v1 VARCHAR(40),  
    @v2 NVARCHAR(40);  
SELECT   
@v1 = 'Test of 22 characters ',   
@v2 = 'Test of 22 characters ';  
SELECT LEN(@v1) AS [VARCHAR LEN] , DATALENGTH(@v1) AS [VARCHAR DATALENGTH];  
SELECT LEN(@v2) AS [NVARCHAR LEN], DATALENGTH(@v2) AS [NVARCHAR DATALENGTH]; 



-- lower function
SELECT LOWER('PRIT');



-- ltrim
SELECT LTRIM('     Prit');


--NCHAR
DECLARE @nstring NCHAR(8);  
SET @nstring = N'København';  
SELECT UNICODE(SUBSTRING(@nstring, 2, 1)),   
   NCHAR(UNICODE(SUBSTRING(@nstring, 2, 1))); 

   

-- PATINDEX
-- case insensitive
SELECT position = PATINDEX('%da%', 'interesting data');



-- using wildcard in PATINDEX
SELECT position = PATINDEX('%en_ure%', 'Please ensure the door is locked!');


-- finding wildcard character
SELECT position = PATINDEX('%[^ 0-9A-z]%', 'Please ensure the door is locked!');


DECLARE @MyValue VARCHAR(10) = 'safety';   
SELECT position = PATINDEX('%' + @MyValue + '%', 'SafetyFirst'); 



-- Quotename
SELECT QUOTENAME('abc[]def');

SELECT QUOTENAME('abc]def');

SELECT QUOTENAME('abc def');


--Replace
SELECT REPLACE('abcdefghicde','cde','xxx');  

SELECT REPLACE('This is a Test'  COLLATE Latin1_General_BIN,  
'Test', 'desk' ); 


-- Raplicate
SELECT REPLICATE('&',4)


--Reverse
SELECT REVERSE('PRIT');
SELECT REVERSE(1234) AS Reversed ;


--Right
SELECT RIGHT('PRIT',3);


--RTRIM
SELECT RTRIM('PRIT     ')+' Rojivadiya'


--Soundex
SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');


--difference
SELECT DIFFERENCE('Smithers', 'Smythers');

SELECT DIFFERENCE('Anothers', 'Brothers');  



--SPACE
use AdventureWorks2012
SELECT RTRIM(LastName) + ',' + SPACE(2) +  LTRIM(FirstName)  
FROM Person.Person  
ORDER BY LastName, FirstName; 


SELECT 'Prit'+SPACE(30)+'Rojivadiya'


-- STR
SELECT STR(123.45, 6, 1);  -->6 means total 6 char and 1 means number of char after decimal

SELECT STR(123.45, 8, 4); -->total 8 char and 4 char after decimal

SELECT STR (FLOOR (123.45), 8, 3);

SELECT STR(123.45, 2, 2);  



--STRING_AGG
USE AdventureWorks2016
GO
SELECT STRING_AGG (CONVERT(NVARCHAR(max),FirstName), CHAR(13)) AS csv 
FROM Person.Person;  


USE AdventureWorks2016
GO
SELECT STRING_AGG(CONVERT(NVARCHAR(max), ISNULL(FirstName,'N/A')), ',') AS csv 
FROM Person.Person;



USE AdventureWorks2016
GO
SELECT STRING_AGG(CONVERT(NVARCHAR(max), CONCAT(FirstName, ' ', LastName, '(', ModifiedDate, ')')), CHAR(13)) AS names 
FROM Person.Person;


USE AdventureWorks2016
GO

SELECT TOP 10 City, STRING_AGG(CONVERT(NVARCHAR(max), EmailAddress), ';') AS emails 
FROM Person.BusinessEntityAddress AS BEA  
INNER JOIN Person.Address AS A ON BEA.AddressID = A.AddressID
INNER JOIN Person.EmailAddress AS EA ON BEA.BusinessEntityID = EA.BusinessEntityID 
GROUP BY City;


-- STRING ESCAPE
SELECT STRING_ESCAPE('\		/  
\\		"     ', 'json') AS escapedText;



--STUFF
SELECT STUFF('abcdef', 2, 3, 'ijklmn');  


--Substring
SELECT name, SUBSTRING(name, 1, 1) AS Initial ,
SUBSTRING(name, 3, 2) AS ThirdAndFourthCharacters
FROM sys.databases  
WHERE database_id < 5;  



-- Translate
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');

-- this similar to following
SELECT
REPLACE
(
      REPLACE
      (
            REPLACE
            (
                  REPLACE
                  (
                        '2*[3+4]/{7-2}',
                        '[',
                        '('
                  ),
                  ']',
                  ')'
            ),
            '{',
            '('
      ),
      '}',
      ')'
);


SELECT TRANSLATE('abcdef','abc','bcd') AS Translated,
       REPLACE(REPLACE(REPLACE('abcdef','a','b'),'b','c'),'c','d') AS Replaced;



--TRIM
SELECT TRIM( '     test    ') AS Result;
--The following example removes a trailing period and spaces from before # and after the word test.
SELECT TRIM( '.,! ' FROM  '  ,   #     test  ! .') AS Result;



-- UNICODE
DECLARE @nstring NCHAR(12);  
SET @nstring = N'Åkergatan 24';  
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring));



--Upper
SELECT UPPER('prit')