USE AdventureWorks2019		

SELECT ASCII('N') 'N',ASCII('I') 'I',ASCII('R') 'R',ASCII('A') 'A',ASCII('J') 'J'

SELECT ASCII(LOWER('N')),ASCII('i'),ASCII('r'),ASCII('a'),ASCII('j')

SELECT NCHAR(78),NCHAR(59),NCHAR(41),NCHAR(80),NCHAR(74)
SELECT CHAR(78),CHAR(59),CHAR(41),CHAR(80),CHAR(74)


SELECT UNICODE(230) AS 'UNI'


-- CHAR

SELECT NCHAR(0x266D) AS [eighth-note]

SELECT CONVERT(CHAR(2), 0x266B) AS 'NOTE'


DECLARE @var VARCHAR(64)
SELECT @var = 'NIRAJ and SAGAR are Developers in dreams'
SELECT CHARINDEX('E',@var COLLATE Latin1_General_CS_AS) AS 'Index' , CHARINDEX('E',@var COLLATE Latin1_General_CI_AS) AS 'Index2'


DECLARE @var2 VARCHAR(64)
SELECT @var2 = 'NIRAJ and SAGAR are Developers in dreams'
SELECT CHARINDEX('R',@var2,(CHARINDEX('R',@var2)+1)) AS 'Index'

-- CONCAT

SELECT CONCAT('Hello ','Everyone ','Today is ',GETDATE()) AS 'TEMP'
SELECT CONCAT('1 ',2,3,4,5,6,7,8,9,0) AS 'TEMP'

SELECT CONCAT_WS('/','C:','Program Files','SQL','Backup') AS 'Path'

-- DIFFERENCE 

SELECT DIFFERENCE('Niraj','Surati') AS 'Diff'

SELECT DIFFERENCE(SOUNDEX('Niraj') , SOUNDEX('Surati')) AS 'Diff'

-- FORMAT

DECLARE @d DATE =  GETDATE()
SELECT FORMAT(@d,'dd-MMM-yy') AS 'Today', FORMAT(917359411074,'+## ##### #####') AS 'Number'


-- LEFT

SELECT LEFT('Lorem ipso pom',20) AS 'LEFT'


-- LEN

SELECT LEN(LEFT('NIRAJ SURATT',6)) AS 'LEN'


-- LOWER

SELECT LOWER('NIRAJ SURATI') AS 'NAME'

-- LTRIM

SELECT LTRIM('           Niraj Surati') AS 'LTRIM'

-- PATINDIX

SELECT PATINDEX('%Developers%','NIRAJ and SAGAR are Developers in dreams') AS 'Pos'


-- QUOTENAME

SELECT QUOTENAME('Niraj') AS 'QT'
SELECT QUOTENAME('Niraj','{}') AS 'QT'

-- REPLACE

SELECT REPLACE('OLD','O','GO') AS 'STRING'


-- REPLICATE

SELECT REPLICATE('*',14) AS 'COPY'

-- REVERSE

SELECT 'NIRAJ' 'ORIGNAL',REVERSE('NIRAJ') AS 'REVERSE'


-- RIGHT

SELECT RIGHT('Lorem ipso pom',5) AS 'Right'

-- RTRIM

SELECT RTRIM('Niraj is Gamer.                                                  ') AS 'First'

-- SOUNDEX

SELECT SOUNDEX('yeger') AS '1', SOUNDEX('NIraj') AS '2'

-- SPACE

SELECT CONCAT('Niraj',SPACE(2),'Surati') AS 'Full Name'

-- STR

SELECT STR(123.123123,7,3) AS 'STR'

-- STR_ESCAPE

SELECT STRING_ESCAPE('Today is beautiful day. 
Lets go somewhere		are you ready? ','json') AS 'SE'


-- STUFF

SELECT STUFF('Niraj Surati',7,6,'BEE') AS 'Stuff'

-- SUBSTRING

SELECT SUBSTRING(STUFF('Niraj Surati',7,6,'BEE'),7,3) AS 'Stuff'

-- TRANSLATE

SELECT TRANSLATE('7373737373','7','9') AS 'Translate'


-- TRIM

SELECT TRIM('     Dont      ') AS 'Trim'

-- UPPER

SELECT UPPER('bee14') AS 'Uppercase'