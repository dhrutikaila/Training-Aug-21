/*
1.ASCII
*/
SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2];  

/* ASCII CAN'T HANDLE 8 BIT CHARACTERS,
Soln : We have to use NCHAR() and UNICODE
*/
SELECT UNICODE('æ'),NCHAR(230)

/*
2.CHAR
*/
SELECT CHAR(65) AS [65], CHAR(66) AS [66],   
CHAR(97) AS [97], CHAR(98) AS [98],   
CHAR(49) AS [49], CHAR(50) AS [50];  


/*
3.CHARINDEX
*/
SELECT CHARINDEX('TEST','this is a test')
SELECT CHARINDEX('S','MY SQL SERVER',7)
SELECT CHARINDEX('Z','MY SQL SERVER')

--CASE IN-SENSITIVE
--DOSEN'T THROW ERROR IF NOT FOUND


/*
4.CONCAT
*/
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result; 
SELECT CONCAT('ZERO IS','NOT EQUAL TO',NULL) AS RESULT
--WORKS FOR NULL VALUE

/*
5.CONCAT_WS
*/
SELECT CONCAT_WS( ' - ', 'HEY', 'THERE', 'HOW ARE YOU') AS Result
--Can use SEPARATOR

/*
6.FORMAT
SYNTAX : FORMAT( value, format [, culture ] )  
*/
SELECT FORMAT(123456789,'###-##-####') AS 'Custom Number' --> 123-45-6789
SELECT FORMAT(cast('07:35' as datetime), N'hh\.mm tt')  --> 07.35 AM 
SELECT FORMAT(cast('07:35' as time), N'hh\.mm');  --> 07.35  
select FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm tt') --> 01:00 AM
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') --> 14:00

/*
7.LEFT
*/
SELECT LEFT('abcdefg',2)  

/*
8.LEN
*/
DECLARE @v1 VARCHAR(40),  @v2 NVARCHAR(40);  
SELECT   
@v1 = 'Test of 22 characters ',   
@v2 = 'Test of 22 characters ';  
SELECT LEN(@v1) AS [VARCHAR LEN] , DATALENGTH(@v1) AS [VARCHAR DATALENGTH];  
SELECT LEN(@v2) AS [NVARCHAR LEN], DATALENGTH(@v2) AS [NVARCHAR DATALENGTH];  


/*
9.LOWER
*/
SELECT LOWER('CHITRANK')

/*
10.LTRIM
*/
SELECT LTRIM('     Five spaces are at the beginning of this string.');  


/*
11.NCHAR
*/
DECLARE @nstring NCHAR(8);  
SET @nstring = N'København';  
SELECT UNICODE(SUBSTRING(@nstring, 2, 1)),   
   NCHAR(UNICODE(SUBSTRING(@nstring, 2, 1)));  
GO  


/*
12.PATINDEX
SYNTAX : PATINDEX ( '%pattern%' , expression )  
*/
SELECT position = PATINDEX('%ter%', 'interesting data'); 


/*
13.REPLACE
SYNTAX : REPLACE ( string_expression , string_pattern , string_replacement )  
*/
SELECT REPLACE('abcdefghicde','cde','123')


/*
14.REPLICATE
*/
SELECT REPLICATE('$',5)


/*
15.REVERSE
*/
SELECT REVERSE('CHITRANK')
SELECT REVERSE(123)


/*
16.RIGHT
*/
SELECT RIGHT('abcdefgh',2)


/*
17.RTRIM
*/
SELECT RTRIM('Removes trailing spaces.   ');  


/*
18.SOUNDEX
*/
SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');

/*
19.SPACE
*/
SELECT 'CHITRANK' + SPACE(10) + 'UMARANIA'


/*
20.STR
*/
SELECT STR(123.45,5,10)

/*
21.STUFF
*/
SELECT STUFF('abcdef', 2, 3, 'ijklmn');  

/*
22.SUBSTRING
*/
SELECT x = SUBSTRING('abcdef', 2, 3);

/*
23.TRIM
*/
SELECT TRIM( '     test    ') AS Result;

/*
24.UPPER
*/
SELECT UPPER('chitrank')
